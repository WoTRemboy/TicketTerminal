//
//  NavBarButtonModel.swift
//  TicketTerminal
//
//  Created by Roman Tverdokhleb on 02/05/2025.
//

import SwiftUI

enum NavBarButton {
    case info
    case special
    case language
    
    internal var image: Image {
        switch self {
        case .info:
            Image.MainPage.info
        case .special:
            Image.MainPage.special
        case .language:
            Image.MainPage.language
        }
    }
}
