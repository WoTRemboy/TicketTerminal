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
    
    internal func alignment(scheme: AccessibilityFontColor) -> Alignment {
        guard scheme != .whiteBlack else { return .center }
        switch self {
        case .pearl:
            return Alignment.topTrailing
        case .lotus:
            return Alignment.topLeading
        case .express:
            return Alignment.topLeading
        }
    }
}
