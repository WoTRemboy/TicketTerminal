//
//  RecommendsSelectorView.swift
//  TicketTerminal
//
//  Created by Roman Tverdokhleb on 14/05/2025.
//

import SwiftUI

struct RecommendsSelectorView: View {
    
    @StateObject private var viewModel: RecommendsViewModel
    
    init(viewModel: RecommendsViewModel) {
        self._viewModel = StateObject(wrappedValue: viewModel)
    }
    
    internal var body: some View {
        VStack(spacing: 20) {
            firstRow
            secondRow
        }
    }
    
    private var firstRow: some View {
        HStack(spacing: 12) {
            ForEach(Recommends.northWestCases, id: \.self) { recommend in
                TripsSelectorCell(
                    title: recommend.title,
                    selected: viewModel.isSelected(recommend)) {
                        viewModel.setSelected(recommend)
                    }
            }
        }
    }
    
    private var secondRow: some View {
        HStack(spacing: 12) {
            ForEach(Recommends.southEastCases, id: \.self) { recommend in
                TripsSelectorCell(
                    title: recommend.title,
                    selected: viewModel.isSelected(recommend)) {
                        viewModel.setSelected(recommend)
                    }
            }
        }
    }
}

#Preview {
    RecommendsSelectorView(viewModel: RecommendsViewModel())
        .environmentObject(AccessibilityManager())
}
