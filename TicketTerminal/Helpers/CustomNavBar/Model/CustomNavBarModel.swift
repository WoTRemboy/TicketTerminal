//
//  CustomNavBarModel.swift
//  TicketTerminal
//
//  Created by Roman Tverdokhleb on 03/05/2025.
//

import SwiftUI

enum NavBar {
    case about
    case special
    case buy
    case assistant
    case from
    case destination
    case trips
    case recommends
    
    internal var title: String {
        switch self {
        case .about:
            Texts.NavBar.about.localized
        case .special:
            Texts.NavBar.special.localized
        case .buy:
            Texts.NavBar.buy.localized
        case .assistant:
            Texts.NavBar.assistant.localized
        case .from:
            Texts.NavBar.from.localized
        case .destination:
            Texts.NavBar.destination.localized
        case .trips:
            Texts.NavBar.trips.localized
        case .recommends:
            Texts.NavBar.recommends.localized
        }
    }
    
    internal func icon(scheme: AccessibilityFontColor) -> Image {
        switch self {
        case .about:
            Image.alterColored(
                normal: Image.NavBar.About.normal,
                alter: Image.NavBar.About.black,
                scheme: scheme)
        case .special:
            Image.alterColored(
                normal: Image.NavBar.Special.normal,
                alter: Image.NavBar.Special.black,
                scheme: scheme)
        case .buy:
            Image.alterColored(
                normal: Image.NavBar.Buy.normal,
                alter: Image.NavBar.Buy.black,
                scheme: scheme)
        case .assistant:
            Image.alterColored(
                normal: Image.NavBar.Assistant.normal,
                alter: Image.NavBar.Assistant.black,
                scheme: scheme)
        case .from:
            Image.alterColored(
                normal: Image.NavBar.From.normal,
                alter: Image.NavBar.From.black,
                scheme: scheme)
        case .destination:
            Image.alterColored(
                normal: Image.NavBar.Destination.normal,
                alter: Image.NavBar.Destination.black,
                scheme: scheme)
        case .trips:
            Image.alterColored(
                normal: Image.NavBar.Trips.normal,
                alter: Image.NavBar.Trips.black,
                scheme: scheme)
        case .recommends:
            Image.alterColored(
                normal: Image.NavBar.Recommends.normal,
                alter: Image.NavBar.Recommends.black,
                scheme: scheme)
        }
    }
}
