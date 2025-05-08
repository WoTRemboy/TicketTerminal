//
//  TripSelectView.swift
//  TicketTerminal
//
//  Created by Roman Tverdokhleb on 08/05/2025.
//

import SwiftUI

struct TripSelectView: View {
    
    @EnvironmentObject private var accessibilityManager: AccessibilityManager
    
    private var results: [NetworkTimetableService.List] = [.mock, .mock, .mock]
    
    internal var body: some View {
        VStack(spacing: 0) {
            CustomNavBarView(type: .buy)
                .padding(.top)
            
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
    
    private var resultsList: some View {
        ScrollView {
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
    TripSelectView()
        .environmentObject(AccessibilityManager())
}
