//
//  TripCell.swift
//  TicketTerminal
//
//  Created by Roman Tverdokhleb on 02/05/2025.
//

import SwiftUI

struct TripCell: View {
    
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
        ZStack(alignment: trip.alignment) {
            trip.image
                .resizable()
                .scaledToFit()
            
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
}
