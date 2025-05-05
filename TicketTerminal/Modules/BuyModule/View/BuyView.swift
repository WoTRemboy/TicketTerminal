//
//  BuyView.swift
//  TicketTerminal
//
//  Created by Roman Tverdokhleb on 05/05/2025.
//

import SwiftUI

struct BuyView: View {
    
    @EnvironmentObject private var accessibilityManager: AccessibilityManager
    
    internal var body: some View {
        VStack(spacing: 0) {
            CustomNavBarView(type: .buy)
                .padding(.top)
            
            BuyTextFieldsView()
                .padding(.top, 40)
            
            BuyDateBlockView()
                .padding(.top, 34)
            
            BuyButtonView(type: .search)
                .padding(.top, 34)
                
            Spacer()
            BuyButtonBlockView()
                .padding(.bottom, 34 / accessibilityManager.fontScale.scale)
        }
        .background(background)
    }
    
    private var background: some View {
        Color.whiteVariant(
            color: .BackColors.backPage,
            scheme: accessibilityManager.fontColor)
        .ignoresSafeArea()
    }
}

#Preview {
    BuyView()
        .environmentObject(AccessibilityManager())
        .environmentObject(BuyViewModel())
}
