//
//  TripsSelectorCell.swift
//  TicketTerminal
//
//  Created by Roman Tverdokhleb on 11/05/2025.
//

import SwiftUI

struct TripsSelectorCell: View {
    
    @EnvironmentObject private var accessibilityManager: AccessibilityManager
    
    private let title: String
    private let selected: Bool
    private let action: () -> Void
    
    init(title: String, selected: Bool, action: @escaping () -> Void) {
        self.title = title
        self.selected = selected
        self.action = action
    }
    
    internal var body: some View {
        Button {
            action()
        } label: {
            content
                .background(background)
        }
        .buttonStyle(.plain)
    }
    
    private var background: some View {
        let radius = 140 / accessibilityManager.fontScale.scale
        return Group {
            if selected {
                RoundedRectangle(cornerRadius: radius)
                    .fill(Color.greyVariant(
                        color: .SymbolColors.red,
                        scheme: accessibilityManager.fontColor))
            } else {
                Background(radius: radius,
                           scheme: accessibilityManager.fontColor)
            }
        }
    }
    
    private var content: some View {
        Text(title)
            .font(.scalable(
                size: 32,
                weight: .medium,
                scale: accessibilityManager.fontScale.scale))
            .foregroundStyle(
                selected
                ? Color.LabelColors.labelWhite
                : Color.LabelColors.labelPrimary
            )
            .multilineTextAlignment(.center)
            .minimumScaleFactor(0.8)
        
            .padding(.vertical, 20)
            .padding(.horizontal)
            .frame(width: 392)
    }
}

#Preview {
    TripsSelectorCell(title: "Express", selected: false) {}
        .environmentObject(AccessibilityManager())
}
