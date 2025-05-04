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
            Button {
                // Font Color Button Action
            } label: {
                AccessibilityParamSelectorCell(
                    title: Texts.Accessibility.FontColor.firstVariation,
                    icon: Image.Accessibility.FontColor.first,
                    selected: true)
            }
            
            Button {
                // Font Color Button Action
            } label: {
                AccessibilityParamSelectorCell(
                    title: Texts.Accessibility.FontColor.secondVariation,
                    icon: Image.Accessibility.FontColor.second,
                    selected: false)
            }
        }
        .buttonStyle(.plain)
    }
    
    private var fontSizeSelector: some View {
        HStack(alignment: .bottom, spacing: 26) {
            Button {
                // Font Size Button Action
            } label: {
                AccessibilityParamSelectorCell(
                    icon: Image.Accessibility.FontSize.first,
                    selected: true)
            }
            
            Button {
                // Font Size Button Action
            } label: {
                AccessibilityParamSelectorCell(
                    icon: Image.Accessibility.FontSize.second,
                    selected: false)
            }
            
            Button {
                // Font Size Button Action
            } label: {
                AccessibilityParamSelectorCell(
                    icon: Image.Accessibility.FontSize.third,
                    selected: false)
            }
            
            Button {
                // Font Size Button Action
            } label: {
                AccessibilityParamSelectorCell(
                    icon: Image.Accessibility.FontSize.fourth,
                    selected: false)
            }
            
            Button {
                // Font Size Button Action
            } label: {
                AccessibilityParamSelectorCell(
                    icon: Image.Accessibility.FontSize.fifth,
                    selected: false)
            }
        }
        .buttonStyle(.plain)
    }
    
    private var imparedModeSelector: some View {
        HStack(alignment: .bottom, spacing: 145) {
            Button {
                // Imapared Mode Button Action
            } label: {
                AccessibilityParamSelectorCell(
                    icon: Image.Accessibility.ImparedMode.off,
                    selected: true)
            }
            
            Button {
                // Imapared Mode Button Action
            } label: {
                AccessibilityParamSelectorCell(
                    icon: Image.Accessibility.ImparedMode.on,
                    selected: false)
            }
        }
        .buttonStyle(.plain)
    }
    
    private var screenReaderSelector: some View {
        HStack(alignment: .bottom, spacing: 145) {
            Button {
                // Screen Reader Button Action
            } label: {
                AccessibilityParamSelectorCell(
                    icon: Image.Accessibility.ScreenReader.off,
                    selected: true)
            }
            
            Button {
                // Screen Reader Button Action
            } label: {
                AccessibilityParamSelectorCell(
                    icon: Image.Accessibility.ScreenReader.on,
                    selected: false)
            }
        }
        .buttonStyle(.plain)
    }
}

#Preview {
    AccessibilityParamSelector(type: .screenReader)
}
