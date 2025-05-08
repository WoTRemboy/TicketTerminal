//
//  NetworkStationService.swift
//  TicketTerminal
//
//  Created by Roman Tverdokhleb on 07/05/2025.
//

import Foundation

actor NetworkStationService {
    static let shared = NetworkStationService()

    struct Station: Identifiable, Decodable, Equatable {
        let name: String
        let code: Int
        let S: Int
        let L: Int
        
        var id: Int { code }

        enum CodingKeys: String, CodingKey {
            case name = "n"
            case code = "c"
            case S
            case L
        }
        
        static internal func ==(lhs: Self, rhs: Self) -> Bool {
            lhs.name == rhs.name && lhs.code == rhs.code
        }
        
        static func mock() -> [Station] {
            [Station(name: Texts.Buy.Placeholder.Station.first.localized, code: 2004000, S: 7, L: 6),   // SPB
             Station(name: Texts.Buy.Placeholder.Station.second.localized, code: 2000000, S: 7, L: 6),  // MSC
             Station(name: Texts.Buy.Placeholder.Station.third.localized, code: 2060615, S: 6, L: 6),   // KZN
             Station(name: Texts.Buy.Placeholder.Station.fourth.localized, code: 2020500, S: 5, L: 5),  // VLG
             Station(name: Texts.Buy.Placeholder.Station.fifth.localized, code: 2064788, S: 5, L: 5),   // KSD
             Station(name: Texts.Buy.Placeholder.Station.sixth.localized, code: 2020600, S: 4, L: 5),   // AST
             Station(name: Texts.Buy.Placeholder.Station.seventh.localized, code: 2064130, S: 5, L: 5)] // SOC
        }
    }

    internal func searchStations(partial: String, language: String) async -> [Station] {
        guard !partial.isEmpty else { return [] }
        var components = URLComponents(string: "https://pass.rzd.ru/suggester")
        components?.queryItems = [
            URLQueryItem(name: "stationNamePart", value: partial),
            URLQueryItem(name: "lang", value: language),
            URLQueryItem(name: "compactMode", value: "y")
        ]
        guard let url = components?.url else { return [] }

        do {
            let (data, _) = try await URLSession.shared.data(from: url)
            let decoder = JSONDecoder()
            let stations = try decoder.decode([Station].self, from: data)
            let filteredStations = stations.filter { station in
                station.name.contains(partial)
            }
            return filteredStations
        } catch {
            print("NetworkStationService error: \(error)")
            return []
        }
    }
}
