//
//  AccessibilityImparedModeModel.swift
//  TicketTerminal
//
//  Created by Roman Tverdokhleb on 04/05/2025.
//

import SwiftUI

enum AccessibilityImparedMode: String, CaseIterable {
    case on = "AccessibilityImparedModeOn"
    case off = "AccessibilityImparedModeOff"
    
    internal var icon: Image {
        switch self {
        case .on:
            Image.Accessibility.ImparedMode.on
        case .off:
            Image.Accessibility.ImparedMode.off
        }
    }
}
