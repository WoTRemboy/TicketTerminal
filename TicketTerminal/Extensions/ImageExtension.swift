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
        enum Logo {
            static let normal = Image("MainPageLogo")
            static let black = Image("MainPageLogoBlack")
        }
        
        enum Info {
            static let normal = Image("MainPageInfo")
        }
        
        enum Special {
            static let normal = Image("MainPageSpecial")
            static let black = Image("MainPageSpecialBlack")
        }
        
        enum Language {
            static let normal = Image("MainRussianLogo")
            static let black = Image("MainRussianLogoBlack")
        }
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
        enum Back {
            static let normal = Image("NavBarBack")
            static let black = Image("NavBarBackBlack")
        }
        
        enum About {
            static let normal = Image("NavBarInfo")
            static let black = Image("NavBarInfoBlack")
        }
        
        enum Special {
            static let normal = Image("NavBarSpecial")
            static let black = Image("NavBarSpecialBlack")
        }
        
        enum Buy {
            static let normal = Image("NavBarBuy")
            static let black = Image("NavBarBuyBlack")
        }
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
            static let onBlack = Image("ImparedModeOnBlack")
        }
        
        enum ScreenReader {
            static let on = Image("ScreenReaderOn")
            static let off = Image("ScreenReaderOff")
            static let onBlack = Image("ScreenReaderOnBlack")
        }
    }
    
    static func alterColored(normal: Image, alter: Image, scheme: AccessibilityFontColor) -> Image {
        switch scheme {
        case .defaultValue:
            normal
        case .whiteBlack:
            alter
        }
    }
}
