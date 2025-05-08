//
//  DateExtension.swift
//  TicketTerminal
//
//  Created by Roman Tverdokhleb on 08/05/2025.
//

import Foundation

extension Date {

    private static let inFormatter: DateFormatter = {
        let df = DateFormatter()
        df.dateFormat = "dd.MM.yyyy"
        return df
    }()

    private static let outFormatter: DateFormatter = {
        let df = DateFormatter()
        df.dateFormat = "dd MMMM, EE"
        return df
    }()

    internal static func getDate(_ raw: String) -> Date? {
        inFormatter.date(from: raw)
    }
    
    internal var dayMonthYear: String {
        Date.outFormatter.string(from: self)
    }
}

extension String {
    internal var durationDayHourMinute: String? {
        let parts = self.split(separator: ":")
        guard parts.count == 2,
              let h = Int(parts[0]),
              let m = Int(parts[1]) else { return nil }
        
        let days = h / 24
        let hours = h % 24
        
        var segments: [String] = []
        if days > 0 { segments.append("\(days) \(Texts.Buy.TripCell.days.localized)") }
        if hours > 0 || days > 0 { segments.append("\(hours) \(Texts.Buy.TripCell.hours.localized)") }
        segments.append("\(m) \(Texts.Buy.TripCell.minutes.localized)")
        
        return segments.joined(separator: " ")
    }
}
