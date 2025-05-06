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
        }
    }
}
