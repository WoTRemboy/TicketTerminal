//
//  AccessibilityScreenReaderModel.swift
//  TicketTerminal
//
//  Created by Roman Tverdokhleb on 04/05/2025.
//

import SwiftUI

enum AccessibilityScreenReader: String, CaseIterable {
    case off = "AccessibilityScreenReaderOff"
    case on = "AccessibilityScreenReaderOn"
    
    internal func icon(scheme: AccessibilityFontColor) -> Image {
        switch self {
        case .off:
            Image.Accessibility.ScreenReader.off
        case .on:
            Image.alterColored(
                normal: Image.Accessibility.ScreenReader.on,
                alter: Image.Accessibility.ScreenReader.onBlack,
                scheme: scheme)
        }
    }
}
