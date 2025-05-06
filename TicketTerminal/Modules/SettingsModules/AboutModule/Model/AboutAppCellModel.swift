//
//  AboutAppCellModel.swift
//  TicketTerminal
//
//  Created by Roman Tverdokhleb on 03/05/2025.
//

import Foundation
import SwiftUI

enum AboutAppCell {
    case version
    case number
    case info
    case address
    
    internal var title: String {
        switch self {
        case .version:
            Texts.About.Version.title.localized
        case .number:
            Texts.About.Number.title.localized
        case .info:
            Texts.About.Info.title.localized
        case .address:
            Texts.About.Address.title.localized
        }
    }
    
    internal var content: String {
        switch self {
        case .version:
            Texts.About.Version.content
        case .number:
            Texts.About.Number.content
        case .info:
            Texts.About.Info.content.localized
        case .address:
            Texts.About.Address.content.localized
        }
    }
    
    internal var frameSize: (width: CGFloat, height: CGFloat) {
        switch self {
        case .version:
            (width: 315, height: 160)
        case .number:
            (width: 596, height: 160)
        case .info:
            (width: 875, height: 85)
        case .address:
            (width: 875, height: 197)
        }
    }
    
    internal var paddingValue: CGFloat {
        switch self {
        case .version, .info, .address:
            return 90
        case .number:
            return 50
        }
    }
}
