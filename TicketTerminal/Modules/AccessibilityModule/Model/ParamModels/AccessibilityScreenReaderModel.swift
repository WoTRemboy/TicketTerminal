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
    
    internal var icon: Image {
        switch self {
        case .off:
            Image.Accessibility.ScreenReader.off
        case .on:
            Image.Accessibility.ScreenReader.on
        }
    }
}
