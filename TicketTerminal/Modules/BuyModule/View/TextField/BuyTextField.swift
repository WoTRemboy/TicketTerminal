//
//  BuyTextField.swift
//  TicketTerminal
//
//  Created by Roman Tverdokhleb on 05/05/2025.
//

import SwiftUI

struct BuyTextField: View {
    
    @EnvironmentObject private var accessibilityManager: AccessibilityManager
    @EnvironmentObject private var viewModel: BuyViewModel
    
    private var type: BuyTarget
    
    init(type: BuyTarget) {
        self.type = type
    }
    
    internal var body: some View {
        Group {
            switch type {
            case .from:
                fromContent
            case .destination:
                destinationContent
            }
        }
        .padding(20)
        .background(Background(
            radius: 143,
            scheme: accessibilityManager.fontColor))
    }
    
    private var fromContent: some View {
        TextField(type.title, text: $viewModel.fromSearchText)
            .font(.scalable(
                size: 32,
                weight: .medium,
                scale: accessibilityManager.fontScale.scale))
            .foregroundStyle(Color.LabelColors.labelPrimary)
    }
    
    private var destinationContent: some View {
        TextField(type.title, text: $viewModel.destinationSearchText)
            .font(.scalable(
                size: 32,
                weight: .medium,
                scale: accessibilityManager.fontScale.scale))
            .foregroundStyle(Color.LabelColors.labelPrimary)
    }
}

#Preview {
    BuyTextField(type: .from)
        .environmentObject(AccessibilityManager())
        .environmentObject(BuyViewModel())
}
