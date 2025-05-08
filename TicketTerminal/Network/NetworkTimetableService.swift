//
//  NetworkTimetableService.swift
//  TicketTerminal
//
//  Created by Roman Tverdokhleb on 08/05/2025.
//

import Foundation

actor NetworkTimetableService {
    static let shared = NetworkTimetableService()
    
    private struct RIDResponse: Decodable {
        let result: String
        let RID: Int
    }
    
    struct TimetableResponse: Decodable {
        let result: String
        let tp: [Train]
    }
    
    struct Train: Decodable, Identifiable {
        var id: String { String(fromCode) + String(toCode) + date }
        
        let from: String
        let fromCode: Int
        let to: String
        let toCode: Int
        let date: String
        let noSeats: Bool
        let list: [List]
        
        enum CodingKeys: String, CodingKey {
            case from, fromCode
            case to = "where"
            case toCode = "whereCode"
            case date, noSeats, list
        }
    }
    
    struct List: Decodable, Identifiable {
        var id: String { number + "-" + date0 }
        
        let number: String
        let code0: Int
        let code1: Int
        let trainName: String
        let brand: String
        let carrier: String
        let route0: String
        let route1: String
        let routeCode0: Int
        let routeCode1: Int
        let trDate0: String
        let trTime0: String
        let station0: String
        let station1: String
        let date0: String
        let time0: String
        let date1: String
        let time1: String
        let timeInWay: String
        let cars: [Car]
    }
    
    struct Car: Decodable, Identifiable {
        var id: String { type + servCls + String(tariff) }
        
        let type: String
        let typeLoc: String
        let freeSeats: Int
        let pt: Int
        let tariff: Int
        let servCls: String
    }
    
    func fetchTimetable(fromCode: Int, toCode: Int, date: String) async throws -> TimetableResponse {
        guard let url = URLComponents(string: "https://pass.rzd.ru/timetable/public/ru") else {
            throw URLError(.badURL)
        }
        
        var components = url
        components.queryItems = [
            URLQueryItem(name: "layer_id", value: "5827"),
            URLQueryItem(name: "lang", value: "ru"),
            URLQueryItem(name: "dir", value: "0"),
            URLQueryItem(name: "tfl", value: "3"),
            URLQueryItem(name: "checkSeats", value: "1"),
            URLQueryItem(name: "code0", value: String(fromCode)),
            URLQueryItem(name: "dt0", value: date),
            URLQueryItem(name: "code1", value: String(toCode)),
            URLQueryItem(name: "dt1", value: date)
        ]
        let config = URLSessionConfiguration.default
        config.httpCookieAcceptPolicy = .always
        let session = URLSession(configuration: config)
        
        guard let componentsURL = components.url else {
            throw URLError(.badURL)
        }
        let (data1, _) = try await session.data(from: componentsURL)
        let ridResponse = try JSONDecoder().decode(RIDResponse.self, from: data1)
        guard ridResponse.result == "RID" else {
            throw URLError(.badServerResponse)
        }
        
        try await Task.sleep(nanoseconds: 2000000000)
        components.queryItems = [
            URLQueryItem(name: "layer_id", value: "5827"),
            URLQueryItem(name: "lang", value: "ru"),
            URLQueryItem(name: "rid", value: String(ridResponse.RID))
        ]
        
        guard let componentsURLSecond = components.url else {
            throw URLError(.badURL)
        }
        let (data2, _) = try await session.data(from: componentsURLSecond)
        if let json = String(data: data2, encoding: .utf8) {
            print(json)
        }
        let timetable = try JSONDecoder().decode(TimetableResponse.self, from: data2)
        return timetable
    }
}

extension NetworkTimetableService.Train {
    static let mock = NetworkTimetableService.Train(
        from: "САНКТ-ПЕТЕРБУРГ",
        fromCode: 2004000,
        to: "ВОЛГОГРАД 1",
        toCode: 2020500,
        date: "09.05.2025",
        noSeats: false,
        list: [
            NetworkTimetableService.List(
                number: "089А",
                code0: 2004001,
                code1: 2020500,
                trainName: "",
                brand: "",
                carrier: "ФПК",
                route0: "С-ПЕТЕР-ГЛ",
                route1: "ВОЛГОГР 1",
                routeCode0: 2004001,
                routeCode1: 2020500,
                trDate0: "09.05.2025",
                trTime0: "20:20",
                station0: "САНКТ-ПЕТЕРБУРГ-ГЛАВН. (МОСКОВСКИЙ ВОКЗАЛ)",
                station1: "ВОЛГОГРАД 1",
                date0: "09.05.2025",
                time0: "20:20",
                date1: "11.05.2025",
                time1: "04:58",
                timeInWay: "32:38",
                cars: [
                    NetworkTimetableService.Car(type: "Купе",
                                                typeLoc: "Купе",
                                                freeSeats: 174,
                                                pt: 1805,
                                                tariff: 6031,
                                                servCls: "2К"),
                    NetworkTimetableService.Car(type: "Плац",
                                                typeLoc: "Плацкартный",
                                                freeSeats: 142,
                                                pt: 1619,
                                                tariff: 5411,
                                                servCls: "3Б")
                ]
            )
        ]
    )
}

extension NetworkTimetableService.List {
    static let mock = NetworkTimetableService.List(
        number: "089А",
        code0: 2004001,
        code1: 2020500,
        trainName: "",
        brand: "",
        carrier: "ФПК",
        route0: "С-ПЕТЕР-ГЛ",
        route1: "ВОЛГОГР 1",
        routeCode0: 2004001,
        routeCode1: 2020500,
        trDate0: "09.05.2025",
        trTime0: "20:20",
        station0: "САНКТ-ПЕТЕРБУРГ-ГЛАВН. (МОСКОВСКИЙ ВОКЗАЛ)",
        station1: "ВОЛГОГРАД 1",
        date0: "09.05.2025",
        time0: "20:20",
        date1: "11.05.2025",
        time1: "04:58",
        timeInWay: "32:38",
        cars: [
            NetworkTimetableService.Car(type: "Купе",
                                        typeLoc: "Купе",
                                        freeSeats: 174,
                                        pt: 1805,
                                        tariff: 6031,
                                        servCls: "2К"),
            NetworkTimetableService.Car(type: "Плац",
                                        typeLoc: "Плацкартный",
                                        freeSeats: 142,
                                        pt: 1619,
                                        tariff: 5411,
                                        servCls: "3Б")
        ]
    )
}

extension NetworkTimetableService.Car {
    static let mock = NetworkTimetableService.Car(type: "Купе",
                                                  typeLoc: "Купе",
                                                  freeSeats: 174,
                                                  pt: 1805,
                                                  tariff: 6031,
                                                  servCls: "2К")
}
