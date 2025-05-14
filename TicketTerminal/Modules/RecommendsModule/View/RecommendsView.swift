//
//  RecomendsView.swift
//  TicketTerminal
//
//  Created by Roman Tverdokhleb on 13/05/2025.
//

import SwiftUI

struct RecommendsView: View {
    
    @EnvironmentObject private var accessibilityManager: AccessibilityManager
    @StateObject private var viewModel = RecommendsViewModel()
    
    internal var body: some View {
        VStack(spacing: 0) {
            CustomNavBarView(type: .recommends)
                .padding(.top)
            
            RecommendsSelectorView(viewModel: viewModel)
                .padding(.top, 40)
            
            selectedDate
            recommendsScrollView
        }
        .sheet(isPresented: $viewModel.isDateSelectorShown) {
            dateSelectorView
        }
    }
    
    private var background: some View {
        Color.whiteVariant(
            color: .BackColors.backPage,
            scheme: accessibilityManager.fontColor)
    }
    
    private var selectedDate: some View {
        TripDetailsDateView(date: viewModel.selectedDate
            .formatted(date: .numeric, time: .omitted)) {
                viewModel.isDateSelectorShown.toggle()
        }
            .frame(maxWidth: .infinity, alignment: .leading)
            .padding(.horizontal, 30)
            .padding(.top, 22)
    }
    
    private var recommendsScrollView: some View {
        ScrollView(.vertical, showsIndicators: false) {
            ForEach(viewModel.selectedSet.trips, id: \.id) { trip in
                RecommendScrollCell(type: trip)
                    .transition(.blurReplace)
                    .padding(.bottom, 20)
            }
            .padding([.horizontal, .top])
        }
        .padding(.top, 10)
    }
    
    private var dateSelectorView: some View {
        BuyDateSelectorView(
            selectedDate: $viewModel.selectedDate,
            title: Texts.Buy.TripCell.date.localized,
            dateRange: Date()...) {}
    }
    
}

#Preview {
    RecommendsView()
        .environmentObject(AccessibilityManager())
}
