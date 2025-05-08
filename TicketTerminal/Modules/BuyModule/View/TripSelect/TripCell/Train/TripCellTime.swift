//
//  TripCellTime.swift
//  TicketTerminal
//
//  Created by Roman Tverdokhleb on 08/05/2025.
//

import SwiftUI

struct TripCellTime: View {
    
    @EnvironmentObject private var accessibilityManager: AccessibilityManager
    private let train: NetworkTimetableService.List
    
    init(train: NetworkTimetableService.List) {
        self.train = train
    }
    
    internal var body: some View {
        HStack {
            dateTime(time: train.time0, date: train.date0)
                .frame(maxWidth: .infinity, alignment: .leading)
            
            arrowDuration
            
            dateTime(time: train.time1, date: train.date1)
                .frame(maxWidth: .infinity, alignment: .trailing)
        }
    }
    
    private func dateTime(time: String, date: String) -> some View {
        VStack(alignment: .leading) {
            dateString(date)
            timeString(time)
        }
    }
    
    private func timeString(_ time: String) -> some View {
        Text(time)
            .font(.scalable(size: 40,
                            weight: .medium,
                            scale: accessibilityManager.fontScale.scale))
            .foregroundStyle(Color.LabelColors.labelPrimary)
    }
    
    private func dateString(_ date: String) -> some View {
        Group {
            if let date = Date.getDate(date), train.time0 != train.time1 {
                Text(date.dayMonthYear)
                    .font(.scalable(size: 20,
                                    weight: .medium,
                                    scale: accessibilityManager.fontScale.scale))
                    .foregroundStyle(Color.LabelColors.labelSecondary)
            }
        }
    }
    
    private var arrowLine: some View {
        HStack(spacing: 0) {
            Rectangle()
                .frame(height: 2)
                .foregroundStyle(Color.blackVariant(
                    color: .SymbolColors.red,
                    scheme: accessibilityManager.fontColor))
        }
        .frame(maxWidth: .infinity, alignment: .center)
    }

    private var arrowDuration: some View {
        VStack(spacing: 4) {
            if let time = train.timeInWay.durationDayHourMinute {
                Text(time)
                    .font(.scalable(size: 20,
                                    weight: .medium,
                                    scale: accessibilityManager.fontScale.scale))
                    .foregroundStyle(Color.LabelColors.labelSecondary)
            }
            arrowLine
        }
        .frame(maxWidth: .infinity)
    }
}

#Preview {
    TripCellTime(train: .mock)
        .environmentObject(AccessibilityManager())
}
