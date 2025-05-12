//
//  TripsSelectorCell.swift
//  TicketTerminal
//
//  Created by Roman Tverdokhleb on 11/05/2025.
//

import SwiftUI

struct TripsSelectorCell: View {
    
    @EnvironmentObject private var accessibilityManager: AccessibilityManager
    
    private let type: Trip
    private let selected: Bool
    private let action: () -> Void
    
    init(type: Trip, selected: Bool, action: @escaping () -> Void) {
        self.type = type
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
                    .fill(Color.SymbolColors.red)
            } else {
                Background(radius: radius,
                           scheme: accessibilityManager.fontColor)
            }
        }
    }
    
    private var content: some View {
        Text(type.title)
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
    TripsSelectorCell(type: .express, selected: false) {}
        .environmentObject(AccessibilityManager())
}
