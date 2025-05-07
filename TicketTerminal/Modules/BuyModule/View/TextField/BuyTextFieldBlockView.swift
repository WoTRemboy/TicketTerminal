//
//  BuyTextFieldsView.swift
//  TicketTerminal
//
//  Created by Roman Tverdokhleb on 05/05/2025.
//

import SwiftUI

struct BuyTextFieldsView: View {
    
    @EnvironmentObject private var accessibilityManager: AccessibilityManager
    @EnvironmentObject private var viewModel: BuyViewModel
    
    @State private var rotationAngle: Angle = .zero
    
    internal var body: some View {
        VStack(spacing: 22) {
            ForEach(BuyTarget.allCases, id: \.self) {
                type in
                BuyTargetButton(type: type)
            }
        }
        .overlay(alignment: .trailing) {
            switchButton
                .padding(.trailing, 22)
        }
        .padding(.horizontal)
    }
    
    private var switchButton: some View {
        Button {
            withAnimation(.spring(duration: 0.5)) {
                rotationAngle += .degrees(180)
            }
            viewModel.switchDestinations()
        } label: {
            switchButtonContent
        }
        .buttonStyle(.plain)
    }
    
    private var switchButtonContent: some View {
        RoundedRectangle(cornerRadius: 30)
            .fill(Color.greyVariant(
                color: .SymbolColors.red,
                scheme: accessibilityManager.fontColor))
            .frame(width: 80, height: 80)
        
            .shadow(
                color: Color.alterColor(
                    normal: .LabelColors.labelBlack.opacity(0.25),
                    alter: .clear,
                    scheme: accessibilityManager.fontColor),
                radius: 4,
                x: 0,
                y: 1)
        
            .overlay {
                Image.Buy.switchIcon
                    .rotationEffect(rotationAngle)
            }
    }
}

#Preview {
    BuyTextFieldsView()
        .environmentObject(BuyViewModel())
        .environmentObject(AccessibilityManager())
}
