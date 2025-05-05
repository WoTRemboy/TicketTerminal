//
//  AssistantWeatherButtons.swift
//  TicketTerminal
//
//  Created by Roman Tverdokhleb on 02/05/2025.
//

import SwiftUI

struct AssistantWeatherButtons: View {
    
    @EnvironmentObject private var accessibilityManager: AccessibilityManager
    
    internal var body: some View {
        HStack(spacing: 16) {
            button(type: .assistant)
            button(type: .weather)
        }
    }
    
    private func button(type: DetailedButton) -> some View {
        Button {
            // Button Action
        } label: {
            buttonContent(type: type)
        }
        .buttonStyle(.plain)
    }
    
    private func buttonContent(type: DetailedButton) -> some View {
        VStack(alignment: .leading, spacing: 10) {
            Text(type.title)
                .font(.scalable(
                    size: 64,
                    weight: .semibold,
                    scale: accessibilityManager.fontScale.scale)
                )
                .minimumScaleFactor(type.scaleFactor(scheme: accessibilityManager.fontScale))
            
            if type.scaleDescriprion(scheme: accessibilityManager.fontScale) {
                Text(type.content)
                    .font(.scalable(
                        size: 30,
                        weight: .medium,
                        scale: accessibilityManager.fontScale.scale)
                    )
            }
        }
        .foregroundStyle(Color.blackVariant(
            color: Color.LabelColors.labelWhite,
            scheme: accessibilityManager.fontColor)
        )
        .padding(.horizontal, type == .assistant ? 40 : 21)
        
        .frame(maxWidth: .infinity, alignment: .leading)
        .frame(width: type.frameSize.width,
               height: type.frameSize.height)
        
        .background {
            switch type {
            case .assistant:
                RoundedRectangle(cornerRadius: 20)
                    .stroke(Color.blackVariant(
                        color: .clear,
                        scheme: accessibilityManager.fontColor),
                            lineWidth: 4)
                    .fill(type.color(scheme: accessibilityManager.fontColor))
            case .weather:
                RoundedRectangle(cornerRadius: 20)
                    .stroke(Color.blackVariant(
                        color: .clear,
                        scheme: accessibilityManager.fontColor),
                            lineWidth: 4)
                    .fill(gradient)
            }
        }
    }
    
    private var gradient: LinearGradient {
        LinearGradient(
            gradient: Gradient(
                colors: [Color.whiteVariant(
                            color: .SymbolColors.yellow,
                            scheme: accessibilityManager.fontColor),
                         Color.whiteVariant(
                            color: .SymbolColors.blue,
                            scheme: accessibilityManager.fontColor)]
            ),
            startPoint: .topTrailing,
            endPoint: .bottomLeading
        )
    }
}

#Preview {
    AssistantWeatherButtons()
        .environmentObject(AccessibilityManager())
}
