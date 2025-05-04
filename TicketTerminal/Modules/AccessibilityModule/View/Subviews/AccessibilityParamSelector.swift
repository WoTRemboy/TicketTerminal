//
//  AccessibilityParamSelector.swift
//  TicketTerminal
//
//  Created by Roman Tverdokhleb on 04/05/2025.
//

import SwiftUI

struct AccessibilityParamSelector: View {
    
    private let type: AccessibilityParam
    
    init(type: AccessibilityParam) {
        self.type = type
    }
    
    internal var body: some View {
        switch type {
        case .fontColor:
            fontColorSelector
        case .fontSize:
            fontSizeSelector
        case .imparedMode:
            imparedModeSelector
        case .screenReader:
            screenReaderSelector
        }
    }
    
    private var fontColorSelector: some View {
        HStack(alignment: .bottom, spacing: 110) {
            ForEach(AccessibilityFontColor.allCases, id: \.self) { type in
                Button {
                    // Font Color Button Action
                } label: {
                    AccessibilityParamSelectorCell(
                        title: type.title,
                        icon: type.icon,
                        selected: true)
                }
            }
        }
        .buttonStyle(.plain)
    }
    
    private var fontSizeSelector: some View {
        HStack(alignment: .bottom, spacing: 26) {
            ForEach(AccessibilityFontSize.allCases, id: \.self) { type in
                Button {
                    // Font Size Button Action
                } label: {
                    AccessibilityParamSelectorCell(
                        icon: type.icon,
                        selected: true)
                }
            }
        }
        .buttonStyle(.plain)
    }
    
    private var imparedModeSelector: some View {
        HStack(alignment: .bottom, spacing: 145) {
            ForEach(AccessibilityImparedMode.allCases, id: \.self) { type in
                Button {
                    // Imapared Mode Button Action
                } label: {
                    AccessibilityParamSelectorCell(
                        icon: type.icon,
                        selected: true)
                }
            }
        }
        .buttonStyle(.plain)
    }
    
    private var screenReaderSelector: some View {
        HStack(alignment: .bottom, spacing: 145) {
            ForEach(AccessibilityScreenReader.allCases, id: \.self) { type in
                Button {
                    // Screen Reader Button Action
                } label: {
                    AccessibilityParamSelectorCell(
                        icon: type.icon,
                        selected: true)
                }
            }
        }
        .buttonStyle(.plain)
    }
}

#Preview {
    AccessibilityParamSelector(type: .imparedMode)
}
