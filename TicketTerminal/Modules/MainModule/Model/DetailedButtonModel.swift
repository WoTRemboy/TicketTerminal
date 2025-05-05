//
//  DetailedButtonModel.swift
//  TicketTerminal
//
//  Created by Roman Tverdokhleb on 02/05/2025.
//

import SwiftUI

enum DetailedButton {
    case assistant
    case weather
    
    internal var title: String {
        switch self {
        case .assistant:
            Texts.MainPage.Assistant.title
        case .weather:
            Texts.MainPage.Weather.title
        }
    }
    
    internal var content: String {
        switch self {
        case .assistant:
            Texts.MainPage.Assistant.content
        case .weather:
            Texts.MainPage.Weather.content
        }
    }
    
    internal var frameSize: (width: CGFloat, height: CGFloat) {
        switch self {
        case .assistant:
            (width: 584, height: 200)
        case .weather:
            (width: 200, height: 200)
        }
    }
    
    internal func color(scheme: AccessibilityFontColor) -> Color {
        switch self {
        case .assistant:
            Color.whiteVariant(
                color: .SymbolColors.red,
                scheme: scheme)
        case .weather:
            Color.whiteVariant(
                color: .SymbolColors.yellow,
                scheme: scheme)
        }
    }
    
    internal func scaleFactor(scheme: AccessibilityFontSize) -> CGFloat {
        switch self {
        case .assistant:
            return 0.8
        case .weather:
            return 0.5
        }
    }
    
    internal func scaleDescriprion(scheme: AccessibilityFontSize) -> Bool {
        switch scheme {
        case .first, .second:
            true
        case .third, .fourth, .fifth:
            false
        }
    }
}
