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

let getCurrentWeatherFunction =  Function(name: "get_current_weather",
                                          description: "Get the current weather in a given location",
                                          parameters: Parameters(
                                            type: "object",
                                            properties: ["location":
                                                            Property(
                                                                type: "integer",
                                                                description: "The city and state, e.g. San Francisco, CA"),
                                                        "unit":
                                                            Property(
                                                                type: "string",
                                                                description: "The unit of measurement, e.g. fahrenheit or celsius")
                                                        ],
                                            required: ["location"]
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
        let functions: [Function] = [getCurrentWeatherFunction]
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

    func handleFunctionCall(functionCall: FunctionCall, completion: @escaping (Result<String, Error>) -> Void) {
        self.messages.append(OpenAIMessage(role: "assistant", content: "", function_call: functionCall))

        let availableFunctions: [String: (String, String?) -> String] = ["get_current_weather": getCurrentWeather]

        if let functionToCall = availableFunctions[functionCall.name],
           let jsonData = functionCall.arguments.data(using: .utf8) {
            do {
                let arguments = try JSONDecoder().decode(Arguments.self, from: jsonData)
                let functionResponse = functionToCall(arguments.location, arguments.unit)
                completion(.success(functionResponse))
            } catch {
                completion(.failure(error))
            }
        } else {
            let error = NSError(domain: "", code: 0, userInfo: [NSLocalizedDescriptionKey: "Function not found or supported."])
            completion(.failure(error))
        }
    }

    struct TTSParameters: Codable {
        let model: String
        let input: String
        let voice: String
    }
}

func getCurrentWeather(location: String, unit: String?) -> String {
    let weatherInfo: [String: Any] = [
        "location": location,
        "temperature": "72",
        "unit": unit ?? "fahrenheit",
        "forecast": ["sunny", "windy"],
    ]
    let jsonData = try? JSONSerialization.data(withJSONObject: weatherInfo, options: .prettyPrinted)
    return String(data: jsonData!, encoding: .utf8)!
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
