//
//  TripCell.swift
//  TicketTerminal
//
//  Created by Roman Tverdokhleb on 02/05/2025.
//

import SwiftUI

struct TripCell: View {
    
    @EnvironmentObject private var accessibilityManager: AccessibilityManager
    
    private let trip: Trip
    
    init(trip: Trip) {
        self.trip = trip
    }
    
    internal var body: some View {
        content
    }
    
    private var content: some View {
        Button {
            // Trip Cell Action
        } label: {
            tripContent
        }
        .buttonStyle(.plain)
    }
    
    private var tripContent: some View {
        ZStack(alignment: trip.alignment(scheme: accessibilityManager.fontColor)) {
            if accessibilityManager.fontColor == .defaultValue {
                trip.image
                    .resizable()
                    .scaledToFit()
            } else {
                Color.SymbolColors.grey
            }
            
            
            Text(trip.title)
                .font(.system(size: 40, weight: .medium))
                .foregroundStyle(Color.LabelColors.labelWhite)
                .padding(24)
        }
        .mask {
            RoundedRectangle(cornerRadius: 20)
        }
        .frame(width: 795, height: 279)
    }
}

#Preview {
    TripCell(trip: .pearl)
        .environmentObject(AccessibilityManager())
}
