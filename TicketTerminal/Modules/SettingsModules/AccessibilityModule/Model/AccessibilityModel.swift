//
//  AccessibilityModel.swift
//  TicketTerminal
//
//  Created by Roman Tverdokhleb on 04/05/2025.
//

import Foundation

enum AccessibilityParam: CaseIterable {
    case fontColor
    case fontSize
    case imparedMode
    case screenReader
    
    static internal var allCases: [AccessibilityParam] {
        [.fontColor, .fontSize, .screenReader]
    }
    
    internal var title: String {
        switch self {
        case .fontColor:
            Texts.Accessibility.FontColor.title.localized
        case .fontSize:
            Texts.Accessibility.FontSize.title.localized
        case .imparedMode:
            Texts.Accessibility.ImparedMode.title.localized
        case .screenReader:
            Texts.Accessibility.ScreenReader.title.localized
        }
    }
    
    internal var spacing: CGFloat {
        switch self {
        case .fontColor:
            return 9
        case .fontSize:
            return 20
        case .imparedMode:
            return 26
        case .screenReader:
            return 9
        }
    }
}
