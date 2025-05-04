//
//  AccessibilityViewModel.swift
//  TicketTerminal
//
//  Created by Roman Tverdokhleb on 04/05/2025.
//

import SwiftUI

final class AccessibilityViewModel: ObservableObject {
    
    @AppStorage(Texts.UserDefaults.Accessibility.fontColor)
    private var fontColor: AccessibilityFontColor = .defaultValue
    
    @AppStorage(Texts.UserDefaults.Accessibility.fontSize)
    private var fontSize: AccessibilityFontSize = .first
    
    @AppStorage(Texts.UserDefaults.Accessibility.imparedMode)
    private var isImparedMode: AccessibilityImparedMode = .off
    
    @AppStorage(Texts.UserDefaults.Accessibility.screenReader)
    private var isScreenReader: AccessibilityScreenReader = .off
    
    internal func isSelectedFontColor(_ color: AccessibilityFontColor) -> Bool {
        color == fontColor
    }
    
    internal func setFontColor(_ color: AccessibilityFontColor) {
        guard color != fontColor else { return }
        withAnimation(.easeInOut(duration: 0.2)) {
            self.fontColor = color
        }
    }
    
    internal func isSelectedFontSize(_ size: AccessibilityFontSize) -> Bool {
        size == fontSize
    }
    
    internal func setFontSize(_ size: AccessibilityFontSize) {
        guard size != fontSize else { return }
        withAnimation(.easeInOut(duration: 0.2)) {
            self.fontSize = size
        }
    }
    
    internal func isSelectedImparedMode(_ mode: AccessibilityImparedMode) -> Bool {
        mode == isImparedMode
    }
    
    internal func setImparedMode(_ mode: AccessibilityImparedMode) {
        guard mode != isImparedMode else { return }
        withAnimation(.easeInOut(duration: 0.2)) {
            self.isImparedMode = mode
        }
    }
    
    internal func isSelectedScreenReader(_ mode: AccessibilityScreenReader) -> Bool {
        mode == isScreenReader
    }
    
    internal func setScreenReader(_ mode: AccessibilityScreenReader) {
        guard mode != isScreenReader else { return }
        withAnimation(.easeInOut(duration: 0.2)) {
            self.isScreenReader = mode
        }
    }
    
}
