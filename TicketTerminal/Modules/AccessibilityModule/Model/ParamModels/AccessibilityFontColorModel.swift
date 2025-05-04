//
//  AccessibilityFontColorModel.swift
//  TicketTerminal
//
//  Created by Roman Tverdokhleb on 04/05/2025.
//

import SwiftUI

enum AccessibilityFontColor: String, CaseIterable {
    case defaultValue = "AccessibilityFontColorDefault"
    case whiteBlack = "AccessibilityFontColorWhiteBlack"
    
    internal var title: String {
        switch self {
        case .defaultValue:
            Texts.Accessibility.FontColor.firstVariation
        case .whiteBlack:
            Texts.Accessibility.FontColor.secondVariation
        }
    }
    
    internal var icon: Image {
        switch self {
        case .defaultValue:
            Image.Accessibility.FontColor.first
        case .whiteBlack:
            Image.Accessibility.FontColor.second
        }
    }
}
