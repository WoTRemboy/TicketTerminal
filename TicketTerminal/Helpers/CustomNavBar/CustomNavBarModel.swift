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
    
    internal var title: String {
        switch self {
        case .about:
            Texts.NavBar.about
        case .special:
            Texts.NavBar.special
        case .buy:
            Texts.NavBar.buy
        }
    }
    
    internal var icon: Image {
        switch self {
        case .about:
            Image.NavBar.about
        case .special:
            Image.NavBar.special
        case .buy:
            Image.NavBar.buy
        }
    }
}
