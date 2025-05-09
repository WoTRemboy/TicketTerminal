//
//  BuyButtonView.swift
//  TicketTerminal
//
//  Created by Roman Tverdokhleb on 05/05/2025.
//

import SwiftUI

struct BuyButtonView: View {
    
    @EnvironmentObject private var accessibilityManager: AccessibilityManager
    @EnvironmentObject private var viewModel: BuyViewModel
    
    private let type: BuyButton
    
    init(type: BuyButton) {
        self.type = type
    }
    
    internal var body: some View {
        CustomNavLink(destination: TripSelectView(viewModel: viewModel)) {
            buttonContent
        }
        .padding(.horizontal)
        .buttonStyle(.plain)
    }
    
    private var buttonContent: some View {
        Text(type.title)
            .font(.scalable(
                size: 32,
                weight: .medium,
                scale: accessibilityManager.fontScale.scale)
            )
            .foregroundStyle(Color.alterColor(
                normal: type.fontColor.default,
                alter: type.fontColor.alter,
                scheme: accessibilityManager.fontColor)
            )
        
            .frame(maxWidth: .infinity,
                   alignment: type.alignment)
            .padding(20)
            .background(background)
    }
    
    private var background: some View {
        Group {
            switch type {
            case .search:
                Background(
                    radius: 130,
                    scheme: accessibilityManager.fontColor)
            case .trips, .hot:
                RoundedRectangle(cornerRadius: 130)
                    .fill(gradient)
            }
        }
    }
    
    private var gradient: LinearGradient {
        LinearGradient(
            gradient: Gradient(
                colors: [
                    Color.greyVariant(
                        color: type.gradientColors.begin,
                        scheme: accessibilityManager.fontColor),
                    Color.greyVariant(
                        color: type.gradientColors.end,
                        scheme: accessibilityManager.fontColor)]
            ),
            startPoint: .topLeading,
            endPoint: .bottomTrailing
        )
    }
}

#Preview {
    BuyButtonView(type: .search)
        .environmentObject(AccessibilityManager())
        .environmentObject(BuyViewModel())
}
