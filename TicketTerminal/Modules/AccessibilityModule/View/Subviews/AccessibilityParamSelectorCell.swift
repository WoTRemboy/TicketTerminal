//
//  AccessibilityParamSelectorCell.swift
//  TicketTerminal
//
//  Created by Roman Tverdokhleb on 04/05/2025.
//

import SwiftUI

struct AccessibilityParamSelectorCell: View {
    
    private let title: String?
    private let icon: Image
    private let selected: Bool
    
    init(title: String? = nil, icon: Image, selected: Bool) {
        self.title = title
        self.icon = icon
        self.selected = selected
    }
    
    internal var body: some View {
        VStack(spacing: 12) {
            icon
            if let title {
                Text(title)
                    .font(.system(size: 20, weight: .regular))
            }
            underline
        }
    }
    
    private var underline: some View {
        Group {
            if selected {
                RoundedRectangle(cornerRadius: 30)
                    .foregroundStyle(Color.SymbolColors.red)
            } else {
                Color.clear
            }
        }
        .frame(width: 34, height: 10)
    }
}

#Preview {
    AccessibilityParamSelectorCell(title: "Red Color", icon: Image.Accessibility.FontColor.first, selected: true)
}
