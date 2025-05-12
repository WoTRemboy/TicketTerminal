//
//  TripsSelectorView.swift
//  TicketTerminal
//
//  Created by Roman Tverdokhleb on 11/05/2025.
//

import SwiftUI

struct TripsSelectorView: View {
    
    @StateObject private var viewModel: TripsViewModel
    
    init(viewModel: TripsViewModel) {
        self._viewModel = StateObject(wrappedValue: viewModel)
    }
    
    internal var body: some View {
        VStack(spacing: 20) {
            horizontalButtons
            centerButton
        }
        .padding(.horizontal)
    }
    
    private var horizontalButtons: some View {
        HStack(spacing: 12) {
            ForEach(Trip.horizontalCases, id: \.self) { trip in
                TripsSelectorCell(
                    type: trip,
                    selected: viewModel.isSelectedTrip(trip)) {
                        viewModel.changeTrip(to: trip)
                    }
            }
        }
    }
    
    private var centerButton: some View {
        TripsSelectorCell(type: .pearl,
                          selected: viewModel.isSelectedTrip(.pearl)) {
            viewModel.changeTrip(to: .pearl)
        }
    }
}

#Preview {
    TripsSelectorView(viewModel: TripsViewModel())
        .environmentObject(AccessibilityManager())
}
