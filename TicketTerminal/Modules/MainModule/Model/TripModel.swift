//
//  TripModel.swift
//  TicketTerminal
//
//  Created by Roman Tverdokhleb on 02/05/2025.
//

import SwiftUI

enum Trip: CaseIterable {
    case pearl
    case lotus
    case express
    
    internal var title: String {
        switch self {
        case .pearl:
            Texts.MainPage.Trip.pearl
        case .lotus:
            Texts.MainPage.Trip.lotus
        case .express:
            Texts.MainPage.Trip.express
        }
    }
    
    internal var image: Image {
        switch self {
        case .pearl:
            Image.Trip.pearl
        case .lotus:
            Image.Trip.lotus
        case .express:
            Image.Trip.express
        }
    }
    
    internal func alignment(scheme: AccessibilityFontColor, size: AccessibilityFontSize) -> Alignment {
        guard scheme != .whiteBlack else { return .center }
        switch self {
        case .pearl:
            switch size {
            case .first, .second, .third:
                return Alignment.topTrailing
            case .fourth, .fifth:
                return Alignment.topLeading
            }
        case .lotus ,.express:
            return Alignment.topLeading
        }
    }
    
    internal func textAlignment(scheme: AccessibilityFontColor) -> TextAlignment {
        switch scheme {
        case .defaultValue:
            TextAlignment.leading
        case .whiteBlack:
            TextAlignment.center
        }
    }
    
    internal func backgroundBlur(scheme: AccessibilityFontSize) -> CGFloat {
        switch scheme {
        case .first, .second:
            return 0
        case .third, .fourth, .fifth:
            return 3
        }
    }
}
