//
//  AssistantView.swift
//  TicketTerminal
//
//  Created by Roman Tverdokhleb on 05/05/2025.
//

import SwiftUI

struct AssistantView: View {
    
    @EnvironmentObject private var accessibilityManager: AccessibilityManager
    private let namespace: Namespace.ID
    
    init(namespace: Namespace.ID) {
        self.namespace = namespace
    }
    
    internal var body: some View {
        VStack(spacing: 0) {
            CustomNavBarView(type: .assistant)
                .padding(.top)
            
            Spacer()
        }
        .navigationTransition(.zoom(
            sourceID: Texts.NamespaceID.Assistant.zoomTransition,
            in: namespace))
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
    AssistantView(namespace: Namespace().wrappedValue)
        .environmentObject(AccessibilityManager())
}
