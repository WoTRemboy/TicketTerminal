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
        .background(background)
    }
    
    private var background: some View {
        RoundedRectangle(cornerRadius: 143)
            .stroke(Color.blackVariant(
                color: .clear,
                scheme: accessibilityManager.fontColor),
                    lineWidth: 3)
            .background {
                RoundedRectangle(cornerRadius: 143)
                    .fill(Color.BackColors.backDefault)
                    .shadow(
                        color: Color.alterColor(
                            normal: .LabelColors.labelBlack.opacity(0.25),
                            alter: .clear,
                            scheme: accessibilityManager.fontColor),
                        radius: 4,
                        x: 0,
                        y: 1)
            }
    }
    
    private var fromContent: some View {
        TextField(type.title, text: $viewModel.fromSearchText)
            .font(.scalable(
                size: 32,
                weight: .medium,
                scale: accessibilityManager.fontScale.scale))
    }
    
    private var destinationContent: some View {
        TextField(type.title, text: $viewModel.destinationSearchText)
            .font(.scalable(
                size: 32,
                weight: .medium,
                scale: accessibilityManager.fontScale.scale))
    }
}

#Preview {
    BuyTextField(type: .from)
        .environmentObject(AccessibilityManager())
        .environmentObject(BuyViewModel())
}
