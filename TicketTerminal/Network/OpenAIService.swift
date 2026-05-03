//
//  OpenAIService.swift
//  TicketTerminal
//
//  Created by Roman Tverdokhleb on 13/05/2025.
//

import Foundation
import Alamofire
import Combine
import SwiftUI

enum Constants {
    static let apiKey = Bundle.main.object(forInfoDictionaryKey: "OpenAIAPIKey") as? String ?? String()
}

struct OpenAIParameters: Codable {
    let model: String
    let messages: [OpenAIMessage]
    let functions: [Function]
    let function_call: String
    let max_tokens: Int
}

struct Function: Codable {
    let name: String
    let description: String
    let parameters: Parameters
}

struct Parameters: Codable {
    let type: String
    let properties: [String: Property]
    let required: [String]
}

struct Property: Codable {
    let type: String
    let description: String?
}

struct OpenAIResponse: Decodable {
    let id: String
    let choices: [OpenAIResponseChoice]
}

struct OpenAIResponseChoice: Decodable {
    let index: Int
    let message: OpenAIMessage
    let finish_reason: String
}

struct OpenAIMessage: Codable {
    let role: String
    let content: String?
    let function_call: FunctionCall?
    let name: String?

    init(role: String, content: String?, function_call: FunctionCall? = nil, name: String? = nil) {
        self.role = role
        self.content = content
        self.function_call = function_call
        self.name = name
    }
}

struct FunctionCall: Codable {
    let name: String
    let arguments: String
}

struct Arguments: Decodable {
    let location: String
    let unit: String?
}

struct TicketPurchaseArguments: Decodable {
    let departureDate: String?
}

struct RecommendationsArguments: Decodable {
    let direction: String?
    let travelDate: String?
}

struct AssistantFunctionResult {
    let responseText: String
    let route: AssistantRoute?
}

let openTicketPurchaseFunction = Function(
    name: "open_ticket_purchase",
    description: "Open the in-app train ticket purchase flow.",
    parameters: Parameters(
        type: "object",
        properties: [
            "departureDate": Property(
                type: "string",
                description: "Optional departure date in dd.MM.yyyy format if the user mentioned it."
            )
        ],
        required: []
    )
)

let openRecommendationsFunction = Function(
    name: "open_recommendations",
    description: "Open the in-app travel recommendations screen.",
    parameters: Parameters(
        type: "object",
        properties: [
            "direction": Property(
                type: "string",
                description: "Optional preferred direction such as north, south, east, or west."
            ),
            "travelDate": Property(
                type: "string",
                description: "Optional travel date in dd.MM.yyyy format if the user mentioned it."
            )
        ],
        required: []
    )
)

class OpenAIService {
    let baseUrl = "https://api.openai.com/v1/chat/completions"

    var isLoading: Bool = false
    var messages: [OpenAIMessage] = []

    func makeRequest(message: OpenAIMessage, systemPrompt: String? = nil) -> AnyPublisher<OpenAIResponse, Error> {
        if let prompt = systemPrompt {
            let systemMessage = OpenAIMessage(role: "system", content: prompt)
            messages = [systemMessage] + messages.filter { $0.role != "system" }
        }
        messages.append(message)
        let functions: [Function] = [openTicketPurchaseFunction, openRecommendationsFunction]
        let parameters = OpenAIParameters(
            model: "gpt-4.1-2025-04-14",
            messages: messages,
            functions: functions,
            function_call: "auto",
            max_tokens: 256
        )
        let headers: HTTPHeaders = ["Authorization" : "Bearer \(Constants.apiKey)"]

        return Future { [weak self] promise in
            self?.performNetworkRequest(with: parameters, headers: headers, promise: promise)
        }
        .eraseToAnyPublisher()
    }

    private func performNetworkRequest(with parameters: OpenAIParameters,
                                       headers: HTTPHeaders,
                                       promise: @escaping (Result<OpenAIResponse, Error>) -> Void) {
        AF.request(baseUrl,
                   method: .post,
                   parameters: parameters,
                   encoder: .json,
                   headers: headers
        )
        .validate()
        .responseDecodable(of: OpenAIResponse.self) { response in
            switch response.result {
            case .success(let result):
                promise(.success(result))
            case .failure(let error):
                promise(.failure(error))
            }
        }
    }

    func handleFunctionCall(functionCall: FunctionCall, completion: @escaping (Result<AssistantFunctionResult, Error>) -> Void) {
        self.messages.append(OpenAIMessage(role: "assistant", content: "", function_call: functionCall))

        let jsonData = functionCall.arguments.data(using: .utf8) ?? Data("{}".utf8)

        do {
            switch functionCall.name {
            case "open_ticket_purchase":
                let arguments = try JSONDecoder().decode(TicketPurchaseArguments.self, from: jsonData)
                completion(.success(openTicketPurchase(arguments: arguments)))
            case "open_recommendations":
                let arguments = try JSONDecoder().decode(RecommendationsArguments.self, from: jsonData)
                completion(.success(openRecommendations(arguments: arguments)))
            default:
                let error = NSError(
                    domain: "",
                    code: 0,
                    userInfo: [NSLocalizedDescriptionKey: "Function not found or supported."]
                )
                completion(.failure(error))
            }
        } catch {
            completion(.failure(error))
        }
    }

    struct TTSParameters: Codable {
        let model: String
        let input: String
        let voice: String
    }
}

private func openTicketPurchase(arguments: TicketPurchaseArguments) -> AssistantFunctionResult {
    AssistantFunctionResult(
        responseText: Texts.Assistant.ticketPurchaseResponse(for: LocalizationManager.shared.selectedLanguage),
        route: .ticketPurchase
    )
}

private func openRecommendations(arguments: RecommendationsArguments) -> AssistantFunctionResult {
    AssistantFunctionResult(
        responseText: Texts.Assistant.recommendationsResponse(for: LocalizationManager.shared.selectedLanguage),
        route: .recommendations
    )
}


enum RequestStatus {
    case none
    case listening
    case processing
    case answering
    case completed
    
    internal var title: String {
        switch self {
        case .none:
            Texts.Assistant.preparation.localized
        case .listening:
            Texts.Assistant.listening.localized
        case .processing, .answering, .completed:
            String()
        }
    }
    
    internal var image: Image {
        switch self {
        case .none:
            Image.Assistant.None.normal
        case .listening, .processing:
            Image.Assistant.Listening.normal
        case .answering, .completed:
            Image.Assistant.Answering.normal
        }
    }
}
