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
    
    internal var title: String {
        switch self {
        case .fontColor:
            Texts.Accessibility.FontColor.title
        case .fontSize:
            Texts.Accessibility.FontSize.title
        case .imparedMode:
            Texts.Accessibility.ImparedMode.title
        case .screenReader:
            Texts.Accessibility.ScreenReader.title
        }
    }
    
    internal var spacing: CGFloat {
        switch self {
        case .fontColor:
            return 9
        case .fontSize:
            return 26
        case .imparedMode:
            return 34
        case .screenReader:
            return 34
        }
    }
}
