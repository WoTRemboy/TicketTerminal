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

enum AssistantRoute: String, Identifiable {
    case ticketPurchase
    case recommendations

    var id: String { rawValue }
}

final class AssistantViewModel: ObservableObject {
    
    @Published internal var requestStatus: RequestStatus = .none
    @Published internal var responseText: String = String()
    @Published internal var activeRoute: AssistantRoute?
    
    private var cancellables = Set<AnyCancellable>()
    let openAIService: OpenAIService
    
    private let speechSynthesizer = AVSpeechSynthesizer()

    init(openAIService: OpenAIService = OpenAIService()) {
        self.openAIService = openAIService
    }

    internal func sendMessage (message: String) {
        guard message != "" else { return }
        activeRoute = nil
        setStatus(.processing)

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
            case .success(let functionResult):
                self.responseText = functionResult.responseText
                self.speak(functionResult.responseText)
                self.activeRoute = functionResult.route
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
