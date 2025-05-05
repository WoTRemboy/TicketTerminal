//
//  AssistantWeatherButtons.swift
//  TicketTerminal
//
//  Created by Roman Tverdokhleb on 02/05/2025.
//

import SwiftUI

struct AssistantWeatherButtons: View {
    
    @EnvironmentObject private var viewModel: MainViewModel
    @EnvironmentObject private var accessibilityManager: AccessibilityManager
    
    private let namespace: Namespace.ID
    
    init(namespace: Namespace.ID) {
        self.namespace = namespace
    }
    
    internal var body: some View {
        HStack(spacing: 16) {
            button(type: .assistant)
            button(type: .weather)
        }
    }
    
    private func button(type: DetailedButton) -> some View {
        Button {
            viewModel.detaildeButtonAction(type: type)
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
        
        .matchedTransitionSource(
            id: Texts.NamespaceID.Assistant.zoomTransition,
            in: namespace
        )
        .background(background(type: type))
    }
    
    private func background(type: DetailedButton) -> some View {
        let cornerRadius: CGFloat = 20
        let shape = RoundedRectangle(cornerRadius: cornerRadius)

        switch type {
        case .assistant:
            return AnyView(
                shape
                    .fill(type.color(scheme: accessibilityManager.fontColor))
                    .overlay(
                        shape.stroke(
                            Color.blackVariant(
                                color: .clear,
                                scheme: accessibilityManager.fontColor),
                            lineWidth: 3
                        )
                    )
            )
        case .weather:
            return AnyView(
                shape
                    .fill(gradient)
                    .overlay(
                        shape.stroke(
                            Color.blackVariant(
                                color: .clear,
                                scheme: accessibilityManager.fontColor),
                            lineWidth: 3
                        )
                    )
            )
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
    AssistantWeatherButtons(namespace: Namespace().wrappedValue)
        .environmentObject(AccessibilityManager())
        .environmentObject(MainViewModel())
}
