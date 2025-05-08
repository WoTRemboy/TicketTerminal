//
//  TripCellView.swift
//  TicketTerminal
//
//  Created by Roman Tverdokhleb on 08/05/2025.
//

import SwiftUI

struct TripCellView: View {
    
    @EnvironmentObject private var accessibilityManager: AccessibilityManager
    private let train: NetworkTimetableService.List
    
    init(train: NetworkTimetableService.List) {
        self.train = train
    }
    
    internal var body: some View {
        HStack(spacing: 20) {
            tripContent
            
            Divider()
            
            TripCellCarList(cars: train.cars)
                .frame(width: 240)
        }
        .padding(30)
        .background(Background(radius: 30,
                               scheme: accessibilityManager.fontColor))
    }
    
    private var tripContent: some View {
        VStack(alignment: .leading, spacing: 20) {
            trainNumberCarrier
            TripCellTime(train: train)
            TripCellStationName(train: train)
        }
    }
    
    private var trainNumberCarrier: some View {
        HStack(spacing: 20) {
            trainNumberCarrierLabel(title: train.number)
            trainNumberCarrierLabel(title: train.carrier)
        }
    }
    
    private func trainNumberCarrierLabel(title: String) -> some View {
        Text(title)
            .font(.scalable(size: 24,
                            weight: .medium,
                            scale: accessibilityManager.fontScale.scale))
            .foregroundStyle(Color.LabelColors.labelPrimary)
    }
}

#Preview {
    TripCellView(train: .mock)
        .environmentObject(AccessibilityManager())
}
