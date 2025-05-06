//
//  AccessibilityView.swift
//  TicketTerminal
//
//  Created by Roman Tverdokhleb on 04/05/2025.
//

import SwiftUI

struct AccessibilityView: View {
    
    @EnvironmentObject private var accessibilityManager: AccessibilityManager
    
    internal var body: some View {
        VStack(spacing: 0) {
            CustomNavBarView(type: .special)
                .padding(.top)
            
            params
                .padding(.top, 40)
            
            Spacer()
        }
        .background(background)
    }
    
    private var background: some View {
        Color.whiteVariant(
            color: .BackColors.backPage,
            scheme: accessibilityManager.fontColor)
        .ignoresSafeArea()
    }
    
    private var params: some View {
        VStack(spacing: 24) {
            ForEach(AccessibilityParam.allCases, id: \.self) { type in
                AccessibilityParamCellView(type: type)
            }
        }
        .padding(.leading, -90)
    }
}

#Preview {
    AccessibilityView()
        .environmentObject(AccessibilityViewModel())
        .environmentObject(AccessibilityManager())
}
