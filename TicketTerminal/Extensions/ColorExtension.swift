//
//  ColorExtension.swift
//  TicketTerminal
//
//  Created by Roman Tverdokhleb on 02/05/2025.
//

import SwiftUI

extension Color {
    
    // MARK: - Back Colors
    
    enum BackColors {
        static let backElevated = Color("BackElevated")
        static let backiOSPrimary = Color("BackiOSPrimary")
        static let backPrimary = Color("BackPrimary")
        static let backSecondary = Color("BackSecondary")
        static let backDefault = Color("BackDefault")
        static let backPage = Color("BackPage")
    }
    
    // MARK: - Label Colors
    
    enum LabelColors {
        static let labelDisable = Color("LabelDisable")
        static let labelDetails = Color("LabelDetails")
        static let labelPrimary = Color("LabelPrimary")
        static let labelSecondary = Color("LabelSecondary")
        static let labelTertiary = Color("LabelTertiary")
        static let labelReversed = Color("LabelReversed")
        static let labelBlack = Color("LabelBlack")
        static let labelWhite = Color("LabelWhite")
        static let labelPlaceholder = Color("LabelPlaceholder")
    }
    
    // MARK: - Symbol Colors
    
    enum SymbolColors {
        static let red = Color("SymbolRed")
        static let yellow = Color("SymbolYellow")
        static let blue = Color("SymbolBlue")
        static let orange = Color("SymbolOrange")
        static let brown = Color("SymbolBrown")
        static let pink = Color("SymbolPink")
        static let purple = Color("SymbolPurple")
        
        static let black = Color("SymbolBlack")
        static let lightGrey = Color("SymbolLightGrey")
        static let grey = Color("SymbolGrey")
        static let white = Color("SymbolWhite")
    }
    
    static func alterColor(normal: Color, alter: Color, scheme: AccessibilityFontColor) -> Color {
        switch scheme {
        case .defaultValue:
            normal
        case .whiteBlack:
            alter
        }
    }
    
    static func blackVariant(color: Color, scheme: AccessibilityFontColor) -> Color {
        switch scheme {
        case .defaultValue:
            color
        case .whiteBlack:
            Color.SymbolColors.black
        }
    }
    
    static func greyVariant(color: Color, scheme: AccessibilityFontColor) -> Color {
        switch scheme {
        case .defaultValue:
            color
        case .whiteBlack:
            Color.SymbolColors.grey
        }
    }
    
    static func whiteVariant(color: Color, scheme: AccessibilityFontColor) -> Color {
        switch scheme {
        case .defaultValue:
            color
        case .whiteBlack:
            Color.SymbolColors.white
        }
    }
}
