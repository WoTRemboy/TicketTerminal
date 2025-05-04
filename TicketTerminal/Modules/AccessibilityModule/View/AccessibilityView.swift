//
//  AccessibilityView.swift
//  TicketTerminal
//
//  Created by Roman Tverdokhleb on 04/05/2025.
//

import SwiftUI

struct AccessibilityView: View {
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
        Color.BackColors.backDefault
            .ignoresSafeArea()
    }
    
    private var params: some View {
        VStack(spacing: 24) {
            AccessibilityParamCellView(type: .fontColor)
            AccessibilityParamCellView(type: .fontSize)
            AccessibilityParamCellView(type: .imparedMode)
            AccessibilityParamCellView(type: .screenReader)
        }
        .padding(.leading, -90)
    }
}

#Preview {
    AccessibilityView()
        .environmentObject(AccessibilityViewModel())
        .environmentObject(FontSizeManager())
}
