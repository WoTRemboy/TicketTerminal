//
//  StationSearchView.swift
//  TicketTerminal
//
//  Created by Roman Tverdokhleb on 07/05/2025.
//

import SwiftUI

// MARK: Пример использования в SwiftUI

struct StationSearchView: View {
    
    @EnvironmentObject private var accessibilityManager: AccessibilityManager
    
    @State private var searchText: String = String()
    @State private var results = NetworkStationService.Station.mock()
    
    private let type: BuyTarget
    
    init(type: BuyTarget) {
        self.type = type
    }
    
    var body: some View {
        VStack(spacing: 0) {
            CustomNavBarView(type: type == .from ? .from : .destination)
                .padding(.top)
            
            textField
                .padding(.top, 40)
                .padding(.horizontal)
            
            resultList
        }
        .background(background)
    }
    
    private var background: some View {
        Color.BackColors.backPage
            .ignoresSafeArea()
    }
    
    private var textField: some View {
        TextField(Texts.Buy.Placeholder.station.localized, text: $searchText)
            .font(.scalable(
                size: 32,
                weight: .medium,
                scale: accessibilityManager.fontScale.scale))
            .foregroundStyle(Color.LabelColors.labelPrimary)
            .frame(maxWidth: .infinity, alignment: .leading)
            .onChange(of: searchText) { newValue, _ in
                Task {
                    let upper = newValue.uppercased()
                    results = await NetworkStationService.shared.searchStations(partial: upper)
                }
            }
            .autocorrectionDisabled()
            .padding(20)
            .background(Background(
                radius: 143,
                scheme: accessibilityManager.fontColor))
    }
    
    private var resultList: some View {
        List(results) { station in
            Button {
                // Result List Buttom Action
            } label: {
                Text(station.name)
                    .font(.scalable(
                        size: 26,
                        weight: .regular,
                        scale: accessibilityManager.fontScale.scale))
                    .foregroundStyle(Color.LabelColors.labelPrimary)
                    .padding(.vertical, 8)
            }
        }
        .listStyle(.plain)
        .background(background)
        .mask {
            RoundedRectangle(cornerRadius: 20)
        }
        .padding(.top, 20)
        .padding(.horizontal)
    }
}

#Preview {
    StationSearchView(type: .from)
        .environmentObject(BuyViewModel())
        .environmentObject(AccessibilityManager())
}
