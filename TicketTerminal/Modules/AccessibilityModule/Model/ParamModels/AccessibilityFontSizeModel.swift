//
//  AccessibilityFontSizeModel.swift
//  TicketTerminal
//
//  Created by Roman Tverdokhleb on 04/05/2025.
//

import SwiftUI

enum AccessibilityFontSize: String, CaseIterable {
    case first = "AccessibilityFontSizeFirst"
    case second = "AccessibilityFontSizeSecond"
    case third = "AccessibilityFontSizeThird"
    case fourth = "AccessibilityFontSizeFourth"
    case fifth = "AccessibilityFontSizeFifth"
    
    internal var icon: Image {
        switch self {
        case .first:
            Image.Accessibility.FontSize.first
        case .second:
            Image.Accessibility.FontSize.second
        case .third:
            Image.Accessibility.FontSize.third
        case .fourth:
            Image.Accessibility.FontSize.fourth
        case .fifth:
            Image.Accessibility.FontSize.fifth
        }
    }
}
