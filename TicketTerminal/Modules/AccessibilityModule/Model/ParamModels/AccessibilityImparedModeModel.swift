//
//  AccessibilityImparedModeModel.swift
//  TicketTerminal
//
//  Created by Roman Tverdokhleb on 04/05/2025.
//

import SwiftUI

enum AccessibilityImparedMode: String, CaseIterable {
    case off = "AccessibilityImparedModeOff"
    case on = "AccessibilityImparedModeOn"
    
    internal func icon(scheme: AccessibilityFontColor) -> Image {
        switch self {
        case .off:
            Image.Accessibility.ImparedMode.off
        case .on:
            Image.alterColored(
                normal: Image.Accessibility.ImparedMode.on,
                alter: Image.Accessibility.ImparedMode.onBlack,
                scheme: scheme)
        }
    }
}
