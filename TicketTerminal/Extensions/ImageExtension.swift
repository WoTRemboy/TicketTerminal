//
//  ImageExtension.swift
//  TicketTerminal
//
//  Created by Roman Tverdokhleb on 02/05/2025.
//

import SwiftUI

extension Image {
    enum Onboarding {
        static let logo = Image("SplashScreenLogo")
    }
    
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
    
    enum Management {
        static let buy = Image("ManagementBuy")
        static let refund = Image("ManagementRefund")
        static let recomendations = Image("ManagementRecomendations")
        static let print = Image("ManagementPrint")
    }
    
    enum NavBar {
        static let back = Image("NavBarBack")
        static let about = Image("NavBarInfo")
        static let special = Image("NavBarSpecial")
        static let buy = Image("NavBarBuy")
    }
    
    enum Accessibility {
        enum FontColor {
            static let first = Image("FontColorRed")
            static let second = Image("FontColorWhiteBlack")
        }
        
        enum FontSize {
            static let first = Image("FontSizeFirst")
            static let second = Image("FontSizeSecond")
            static let third = Image("FontSizeThird")
            static let fourth = Image("FontSizeFourth")
            static let fifth = Image("FontSizeFifth")
        }
        
        enum ImparedMode {
            static let on = Image("ImparedModeOn")
            static let off = Image("ImparedModeOff")
        }
        
        enum ScreenReader {
            static let on = Image("ScreenReaderOn")
            static let off = Image("ScreenReaderOff")
        }
    }
}
