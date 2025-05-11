//
//  TripCellStationName.swift
//  TicketTerminal
//
//  Created by Roman Tverdokhleb on 08/05/2025.
//

import SwiftUI

struct TripCellStationName: View {
    
    @EnvironmentObject private var accessibilityManager: AccessibilityManager
    private let train: NetworkTimetableService.List
    
    init(train: NetworkTimetableService.List) {
        self.train = train
    }
    
    internal var body: some View {
        HStack {
            stationName(title: train.station0)
                .frame(maxWidth: .infinity, alignment: .leading)
            
            stationName(title: train.station1)
                .frame(maxWidth: .infinity, alignment: .trailing)
        }
        .multilineTextAlignment(.leading)
    }
    
    private func stationName(title: String) -> some View {
        Text(title)
            .font(.scalable(size: 24,
                            weight: .regular,
                            scale: accessibilityManager.fontScale.scale))
    }
}

#Preview {
    TripCellStationName(train: .mock)
        .environmentObject(AccessibilityManager())
}
