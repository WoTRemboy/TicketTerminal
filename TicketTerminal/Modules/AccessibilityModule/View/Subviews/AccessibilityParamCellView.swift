//
//  AccessibilityParamCellView.swift
//  TicketTerminal
//
//  Created by Roman Tverdokhleb on 04/05/2025.
//

import SwiftUI

struct AccessibilityParamCellView: View {
    
    @EnvironmentObject private var fontManager: FontSizeManager
    @Namespace private var namespace
    
    private let type: AccessibilityParam
    
    init(type: AccessibilityParam) {
        self.type = type
    }
    
    internal var body: some View {
        content
            .background {
                RoundedRectangle(cornerRadius: 50)
                    .foregroundStyle(Color.BackColors.backDefault)
                    .shadow(
                        color: .LabelColors.labelBlack.opacity(0.25),
                        radius: 4,
                        x: 0,
                        y: 1)
            }
    }
    
    private var content: some View {
        VStack(spacing: type.spacing) {
            Text(type.title)
                .font(.scalable(size: 40, weight: .regular, scale: fontManager.scale))
                .frame(maxWidth: .infinity, alignment: .leading)
                .padding(.top, 8)
            
            AccessibilityParamSelector(type: type)
            Spacer()
        }
        .animation(.easeInOut(duration: 0.2), value: fontManager.scale)
        .padding(.leading, 90)
        .frame(width: 885,
               height: 197)
    }
}

#Preview {
    AccessibilityParamCellView(type: .fontSize)
        .environmentObject(AccessibilityViewModel())
        .environmentObject(FontSizeManager())
}
