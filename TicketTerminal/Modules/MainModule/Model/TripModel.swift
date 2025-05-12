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
    
    static internal var horizontalCases: [Trip] {
        [.express, .lotus]
    }
    
    internal var title: String {
        switch self {
        case .pearl:
            Texts.MainPage.Trip.pearl.localized
        case .lotus:
            Texts.MainPage.Trip.lotus.localized
        case .express:
            Texts.MainPage.Trip.express.localized
        }
    }
    
    internal var route: String {
        switch self {
        case .pearl:
            Texts.TripsPage.Pearl.route.localized
        case .lotus:
            Texts.TripsPage.Lotus.route.localized
        case .express:
            Texts.TripsPage.Express.route.localized
        }
    }
    
    internal var detailsTitle: String {
        switch self {
        case .pearl:
            Texts.TripsPage.Pearl.title.localized
        case .lotus:
            Texts.TripsPage.Lotus.title.localized
        case .express:
            Texts.TripsPage.Express.title.localized
        }
    }
    
    internal var description: String {
        switch self {
        case .pearl:
            Texts.TripsPage.Pearl.description.localized
        case .lotus:
            Texts.TripsPage.Lotus.description.localized
        case .express:
            Texts.TripsPage.Express.description.localized
        }
    }
    
    internal var preview: Image {
        switch self {
        case .pearl:
            Image.Trip.Pearl.preview
        case .lotus:
            Image.Trip.Lotus.preview
        case .express:
            Image.Trip.Express.preview
        }
    }
    
    internal var detailsImage: Image {
        switch self {
        case .pearl:
            Image.Trip.Pearl.details
        case .lotus:
            Image.Trip.Lotus.details
        case .express:
            Image.Trip.Express.details
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
