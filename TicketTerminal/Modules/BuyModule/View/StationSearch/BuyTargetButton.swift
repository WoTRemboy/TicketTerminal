//
//  BuyTextField.swift
//  TicketTerminal
//
//  Created by Roman Tverdokhleb on 05/05/2025.
//

import SwiftUI

struct BuyTargetButton: View {
    
    @EnvironmentObject private var accessibilityManager: AccessibilityManager
    @EnvironmentObject private var viewModel: BuyViewModel
    
    private var type: BuyTarget
    
    init(type: BuyTarget) {
        self.type = type
    }
    
    internal var body: some View {
        content
            .padding(20)
            .background(Background(
                radius: 143,
                scheme: accessibilityManager.fontColor))
    }
    
    private var content: some View {
        let (name, color) = viewModel.getStationName(for: type)
        return CustomNavLink(
            destination: StationSearchView(
                type: type,
                viewModel: viewModel)
        ) {
            Text(name)
                .font(.scalable(
                    size: 32,
                    weight: .medium,
                    scale: accessibilityManager.fontScale.scale))
                .foregroundStyle(color)
                .contentTransition(.numericText())
                .frame(maxWidth: .infinity, alignment: .leading)
        }
        .animation(.easeInOut(duration: 0.15), value: name)
    }
}

#Preview {
    BuyTargetButton(type: .departure)
        .environmentObject(AccessibilityManager())
        .environmentObject(BuyViewModel())
}
