//
//  TripSelectView.swift
//  TicketTerminal
//
//  Created by Roman Tverdokhleb on 08/05/2025.
//

import SwiftUI

struct TripSelectView: View {
    
    @EnvironmentObject private var accessibilityManager: AccessibilityManager
    @EnvironmentObject private var localizationManager: LocalizationManager
    
    @StateObject private var viewModel: BuyViewModel
    @Environment(\.dismiss) private var dismiss

    @State private var results: [NetworkTimetableService.List] = []
    
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
                .overlay(alignment: .center) {
                    loadingIndicatior
                }
        }
        .onAppear {
            Task {
                viewModel.setLoadingIndicator(to: true)
                guard let departureStation = viewModel.selectedDepartureStation,
                      let arrivalStation = viewModel.selectedArrivalStation,
                      let departureDate = viewModel.selectedDepartureDate else { return }
                let dateString = departureDate.dayMonthYearNumeric
                
                await NetworkTimetableService.shared.fetchTimetableRequest(
                    fromCode: departureStation.code,
                    toCode: arrivalStation.code,
                    date: dateString,
                    language: LocalizationManager.shared.networkServiceLanguage
                ) { result in
                    switch result {
                    case .success(let response):
                        let list = response.tp.first?.list ?? []
                        DispatchQueue.main.async {
                            results = list
                        }
                        viewModel.setLoadingIndicator(to: false)
                    case .failure(let error):
                        print("Time table parsing Error: \(error)")
                    }
                }
            }
        }
    }
    
    private var loadingIndicatior: some View {
        Group {
            if viewModel.isLoading {
                LoadingIndicatorView()
            }
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
                .transition(.blurReplace)
            }
            .padding(.horizontal, 30)
            .padding(.vertical)
            .animation(.easeInOut(duration: 0.2), value: results.count)
        }
    }
}

#Preview {
    TripSelectView(viewModel: BuyViewModel())
        .environmentObject(AccessibilityManager())
        .environmentObject(LocalizationManager())
}
