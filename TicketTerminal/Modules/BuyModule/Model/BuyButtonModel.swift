//
//  BuyButtonModel.swift
//  TicketTerminal
//
//  Created by Roman Tverdokhleb on 05/05/2025.
//

import SwiftUI

enum BuyButton {
    case search
    case trips
    case hot
    
    static internal var allCases: [BuyButton] {
        [.trips, .hot]
    }
    
    internal var title: String {
        switch self {
        case .search:
            Texts.Buy.Buttons.search.localized
        case .trips:
            Texts.Buy.Buttons.trips.localized
        case .hot:
            Texts.Buy.Buttons.hot.localized
        }
    }
    
    internal var alignment: Alignment {
        switch self {
        case .search:
            Alignment.center
        case .trips, .hot:
            Alignment.leading
        }
    }
    
    internal var fontColor: (default: Color, alter: Color) {
        switch self {
        case .search:
            (default: .SymbolColors.red, alter: .LabelColors.labelBlack)
        case .trips, .hot:
            (default: .LabelColors.labelWhite, alter: .LabelColors.labelWhite)
        }
    }
    
    internal var gradientColors: (begin: Color, end: Color) {
        switch self {
        case .search, .trips:
            (begin: .SymbolColors.purple, end: .SymbolColors.pink)
        case .hot:
            (begin: .SymbolColors.brown, end: .SymbolColors.orange)
        }
    }
    
    static internal func showButtons(scheme: AccessibilityFontSize) -> Bool {
        switch scheme {
        case .first, .second, .third:
            true
        case .fourth, .fifth:
            false
        }
    }
}
