//
//  ImageExtension.swift
//  TicketTerminal
//
//  Created by Roman Tverdokhleb on 02/05/2025.
//

import SwiftUI

extension Image {
    enum MainPage {
        static let logo = Image("MainPageLogo")
        static let info = Image("MainPageInfo")
        static let special = Image("MainPageSpecial")
        static let language = Image("MainRussianButton")
    }
    
    enum Trip {
        static let pearl = Image("TripPearl")
        static let lotus = Image("TripLotus")
        static let express = Image("TripExpress")
    }
}
