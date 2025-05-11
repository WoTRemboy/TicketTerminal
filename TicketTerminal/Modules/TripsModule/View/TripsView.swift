//
//  TripsView.swift
//  TicketTerminal
//
//  Created by Roman Tverdokhleb on 11/05/2025.
//

import SwiftUI

struct TripsView: View {
    
    @StateObject private var viewModel: TripsViewModel
    
    init(selectedTrip: Trip? = nil) {
        if let selectedTrip {
            self._viewModel = StateObject(wrappedValue: TripsViewModel(selectedTrip: selectedTrip))
        } else {
            self._viewModel = StateObject(wrappedValue: TripsViewModel())
        }
    }
    
    internal var body: some View {
        VStack(spacing: 0) {
            CustomNavBarView(type: .trips)
                .padding(.top)
            
            TripsSelectorView(viewModel: viewModel)
                .padding(.top, 40)
            
            ScrollView(.vertical) {
                TripsDetailsView(type: viewModel.selectedTrip)
            }
        }
    }
}

#Preview {
    TripsView()
        .environmentObject(AccessibilityManager())
}
