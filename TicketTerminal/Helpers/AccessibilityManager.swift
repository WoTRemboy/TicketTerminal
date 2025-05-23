//
//  AccessibilityManager.swift
//  TicketTerminal
//
//  Created by Roman Tverdokhleb on 04/05/2025.
//

import SwiftUI

final class AccessibilityManager: ObservableObject {
    @AppStorage(Texts.UserDefaults.AccessibilityManager.fontSize)
    internal var fontScale: AccessibilityFontSize = .first
    
    @AppStorage(Texts.UserDefaults.AccessibilityManager.fontColor)
    internal var fontColor: AccessibilityFontColor = .defaultValue
    
    static internal let shared = AccessibilityManager()
    
    internal func updateLayout() {
        fontColor = fontColor
    }
    
    internal func setFontColor(to scheme: AccessibilityFontColor) {
        fontColor = scheme
    }
    
    internal func setFontSize(to size: AccessibilityFontSize) {
        fontScale = size
    }
}

extension Font {
    static func scalable(size: CGFloat, weight: Font.Weight = .regular, design: Font.Design = .default, scale: CGFloat) -> Font {
        Font.system(size: size * scale, weight: weight, design: design)
    }
}
