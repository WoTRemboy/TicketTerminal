//
//  AssistantViewModel.swift
//  TicketTerminal
//
//  Created by Roman Tverdokhleb on 13/05/2025.
//

import Foundation
import Combine
import AVFAudio
import AVFoundation
import SwiftUI

final class AssistantViewModel: ObservableObject {
    
    @Published internal var requestStatus: RequestStatus = .none
    @Published internal var responseText: String = String()
    
    private var cancellables = Set<AnyCancellable>()
    let openAIService: OpenAIService
    
    private let speechSynthesizer = AVSpeechSynthesizer()

    init(openAIService: OpenAIService = OpenAIService()) {
        self.openAIService = openAIService
    }

    internal func sendMessage (message: String) {
        guard message != "" else { return }

        openAIService.makeRequest(message: OpenAIMessage(role: "user", content: message),
                                  systemPrompt: Texts.Assistant.prompt
        )
            .sink { completion in
                switch completion {
                case .failure(let error):
                    print(error.localizedDescription)
                case .finished:
                    break
                }
            } receiveValue: { response in
                self.handleResponse(response: response)
            }
            .store(in: &cancellables)
    }

    private func handleResponse(response: OpenAIResponse) {
        guard let message = response.choices.first?.message else { return }

        if let functionCall = message.function_call {
            handleFunctionCall(functionCall: functionCall)
        } else if let textResponse = message.content?.trimmingCharacters(in: .whitespacesAndNewlines.union(.init(charactersIn: "\""))) {
            print("Response", textResponse)
            responseText = textResponse
            self.speak(textResponse)
        }
    }

    private func handleFunctionCall(functionCall: FunctionCall) {
        self.openAIService.handleFunctionCall(functionCall: functionCall) { result in
            switch result {
            case .success(let functionResponse):
                self.openAIService.makeRequest(
                    message: OpenAIMessage(
                        role: "function",
                        content: functionResponse,
                        name: functionCall.name
                    )
                )
                .sink(receiveCompletion: { completion in
                    switch completion {
                    case .failure(let error): print("error", error)
                    case .finished: break
                    }
                }, receiveValue: { response in
                    guard let responseMessage = response.choices.first?.message,
                          let textResponse = responseMessage.content?
                              .trimmingCharacters(in: .whitespacesAndNewlines.union(.init(charactersIn: "\"")))
                    else { return }

                    print("Function Call Response", textResponse)
                    self.speak(textResponse)
                })
                .store(in: &self.cancellables)

            case .failure(let error):
                print(error.localizedDescription)
            }
        }
    }
    
    private func speak(_ text: String) {
        let utterance = AVSpeechUtterance(string: text)
        utterance.voice = AVSpeechSynthesisVoice(language: LocalizationManager.shared.localeLanguage)
        utterance.rate = AVSpeechUtteranceDefaultSpeechRate
        speechSynthesizer.speak(utterance)
        setStatus(.answering)
    }
    
    internal func setStatus(_ status: RequestStatus) {
        withAnimation(.snappy) {
            requestStatus = status
        }
    }
    
    internal func isResponding() -> Bool {
        return requestStatus == .answering
    }
}
