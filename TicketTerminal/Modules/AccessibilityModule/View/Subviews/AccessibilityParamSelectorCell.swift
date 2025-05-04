//
//  AccessibilityParamSelectorCell.swift
//  TicketTerminal
//
//  Created by Roman Tverdokhleb on 04/05/2025.
//

import SwiftUI

struct AccessibilityParamSelectorCell: View {
    
    @EnvironmentObject private var accessibilityManager: AccessibilityManager
    
    private let title: String?
    private let icon: Image
    private let selected: Bool
    private let transitionID: String
    private let namespace: Namespace.ID
    
    init(title: String? = nil, icon: Image, selected: Bool, transitionID: String, namespace: Namespace.ID) {
        self.title = title
        self.icon = icon
        self.selected = selected
        self.transitionID = transitionID
        self.namespace = namespace
    }
    
    internal var body: some View {
        VStack(spacing: 20) {
            icon
            underline
        }
    }
    
    private var underline: some View {
        Group {
            if selected {
                RoundedRectangle(cornerRadius: 30)
                    .fill(Color.blackVariant(
                        color: .SymbolColors.red,
                        scheme: accessibilityManager.fontColor)
                    )
                    .matchedGeometryEffect(id: transitionID, in: namespace)
            } else {
                RoundedRectangle(cornerRadius: 30)
                    .fill(Color.clear)
            }
        }
        .frame(width: 34, height: 10)
    }
}

#Preview {
    AccessibilityParamSelectorCell(
        title: "Red Color",
        icon: Image.Accessibility.FontColor.first,
        selected: true,
        transitionID: "transitionID",
        namespace: Namespace().wrappedValue
    )
    .environmentObject(AccessibilityManager())
}
