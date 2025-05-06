//
//  AccessibilityParamCellView.swift
//  TicketTerminal
//
//  Created by Roman Tverdokhleb on 04/05/2025.
//

import SwiftUI

struct AccessibilityParamCellView: View {
    
    @EnvironmentObject private var accessibilityManager: AccessibilityManager
    @Namespace private var namespace
    
    private let type: AccessibilityParam
    
    init(type: AccessibilityParam) {
        self.type = type
    }
    
    internal var body: some View {
        content
            .background(Background(
                radius: 50,
                scheme: accessibilityManager.fontColor))
            .transition(.blurReplace)
    }
    
    private var content: some View {
        VStack(spacing: type.spacing) {
            Text(type.title)
                .font(.scalable(size: 40, weight: .regular, scale: accessibilityManager.fontScale.scale))
                .foregroundStyle(Color.LabelColors.labelPrimary)
                .frame(maxWidth: .infinity, alignment: .leading)
                .padding(.top, 8)
            
            AccessibilityParamSelector(type: type)
            Spacer()
        }
        .padding(.leading, 90)
        .frame(width: 885,
               height: 197)
    }
}

#Preview {
    AccessibilityParamCellView(type: .fontSize)
        .environmentObject(AccessibilityViewModel())
        .environmentObject(AccessibilityManager())
}
