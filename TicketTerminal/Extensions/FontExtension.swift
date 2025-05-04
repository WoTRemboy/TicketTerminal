//
//  FontExtension.swift
//  TicketTerminal
//
//  Created by Roman Tverdokhleb on 04/05/2025.
//

import SwiftUI

extension Font {
    static func extraLargeTitle() -> Font? {
        Font.custom("SF-Pro-Text-Bold", size: 48, relativeTo: .largeTitle)
    }
    
    static func largeTitle() -> Font? {
        Font.custom("SFProDisplay", size: 40, relativeTo: .largeTitle)
    }
}


