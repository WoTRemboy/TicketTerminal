//
//  AccessibilityScreenReaderModel.swift
//  TicketTerminal
//
//  Created by Roman Tverdokhleb on 04/05/2025.
//

import SwiftUI

enum AccessibilityScreenReader: String, CaseIterable {
    case on = "AccessibilityScreenReaderOn"
    case off = "AccessibilityScreenReaderOff"
    
    internal var icon: Image {
        switch self {
        case .on:
            Image.Accessibility.ScreenReader.on
        case .off:
            Image.Accessibility.ScreenReader.off
        }
    }
}
