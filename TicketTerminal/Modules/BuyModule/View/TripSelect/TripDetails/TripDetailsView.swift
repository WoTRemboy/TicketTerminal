//
//  TripDetailsView.swift
//  TicketTerminal
//
//  Created by Roman Tverdokhleb on 08/05/2025.
//

import SwiftUI

struct TripDetailsView: View {
    
    @EnvironmentObject private var accessibilityManager: AccessibilityManager
    
    private let departure: String
    private let arrival: String
    private let action: () -> Void
    
    init(departure: String, arrival: String, action: @escaping () -> Void) {
        self.departure = departure
        self.arrival = arrival
        self.action = action
    }
    
    internal var body: some View {
        HStack(spacing: 18) {
            title
            routeButton
        }
    }
    
    private var title: some View {
        Text("\(Texts.Buy.TripCell.trip.localized):")
            .font(.scalable(size: 32,
                            weight: .medium,
                            scale: accessibilityManager.fontScale.scale))
            .foregroundStyle(Color.blackVariant(
                color: .SymbolColors.red,
                scheme: accessibilityManager.fontColor))
    }
    
    private var routeButton: some View {
        Button {
            action()
        } label: {
            routeButtonContent
        }
        .buttonStyle(.plain)
    }
    
    private var routeButtonContent: some View {
        Text("\(departure) - \(arrival)")
            .font(.scalable(size: 32,
                            weight: .regular,
                            scale: accessibilityManager.fontScale.scale))
            .foregroundStyle(Color.LabelColors.labelPrimary)
            .lineLimit(2)
            .minimumScaleFactor(0.6)
        
            .padding()
            .frame(maxWidth: .infinity, alignment: .leading)
            .background(Background(radius: 140,
                                   scheme: accessibilityManager.fontColor))
    }
}

#Preview {
    TripDetailsView(departure: "NIZHNIY NOVGOROD", arrival: "SANKT-PETERBURG") {}
        .environmentObject(AccessibilityManager())
}
