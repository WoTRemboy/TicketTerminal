//
//  TripSelectView.swift
//  TicketTerminal
//
//  Created by Roman Tverdokhleb on 08/05/2025.
//

import SwiftUI

struct TripSelectView: View {
    
    @EnvironmentObject private var accessibilityManager: AccessibilityManager
    @StateObject private var viewModel: BuyViewModel
    @Environment(\.dismiss) private var dismiss

    private var results: [NetworkTimetableService.List] = [.mock, .mock, .mock]
    
    init(viewModel: BuyViewModel) {
        self._viewModel = StateObject(wrappedValue: viewModel)
    }
    
    internal var body: some View {
        VStack(spacing: 0) {
            CustomNavBarView(type: .buy)
                .padding(.top)
            
            tripDetails
                .padding(.top, 40)
            
            resultsList
                .padding(.top, 40)
        }
    }
    
    private var background: some View {
        Color.whiteVariant(
            color: .BackColors.backPage,
            scheme: accessibilityManager.fontColor)
        .ignoresSafeArea()
    }
    
    private var tripDetails: some View {
        VStack(alignment: .leading, spacing: 20) {
            TripDetailsView(
                departure: viewModel.selectedDepartureStation?.name ?? String(),
                arrival: viewModel.selectedArrivalStation?.name ?? String())
            { dismiss() }
            
            TripDetailsDateView(date: viewModel.selectedDepartureDate?.formatted(date: .numeric, time: .omitted) ?? String(), action: {})
        }
        .padding(.horizontal, 30)
    }
    
    private var resultsList: some View {
        ScrollView(.vertical) {
            VStack(spacing: 22) {
                ForEach(results, id: \.id) { train in
                    TripCellView(train: train)
                }
            }
            .padding(.horizontal, 30)
            .padding(.vertical)
        }
    }
}

#Preview {
    TripSelectView(viewModel: BuyViewModel())
        .environmentObject(AccessibilityManager())
}
