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
            enum Russian {
                static let normal = Image("MainLocalizationFlagRussian")
                static let black = Image("MainLocalizationFlagBlackRussian")
            }
            
            enum English {
                static let normal = Image("MainLocalizationFlagEnglish")
                static let black = Image("MainLocalizationFlagBlackEnglish")
            }
            
            enum Chinese {
                static let normal = Image("MainLocalizationFlagChinese")
                static let black = Image("MainLocalizationFlagBlackChinese")
            }
        }
    }
    
    enum Trip {
        enum Pearl {
            static let preview = Image("TripPearl")
            static let details = Image("TripDetailsPearl")
        }
        
        enum Lotus {
            static let preview = Image("TripLotus")
            static let details = Image("TripDetailsLotus")
        }
        
        enum Express {
            static let preview = Image("TripExpress")
            static let details = Image("TripDetailsExpress")
        }
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
        
        enum Assistant {
            static let normal = Image("NavBarAssistant")
            static let black = Image("NavBarAssistantBlack")
        }
        
        enum Destination {
            static let normal = Image("NavBarDestination")
            static let black = Image("NavBarDestinationBlack")
        }
        
        enum From {
            static let normal = Image("NavBarFrom")
            static let black = Image("NavBarFromBlack")
        }
        
        enum Trips {
            static let normal = Image("NavBarTrips")
            static let black = Image("NavBarTripsBlack")
        }
        
        enum Recommends {
            static let normal = Image("NavBarRecommends")
            static let black = Image("NavBarRecommendsBlack")
        }
    }
    
    enum Language {
        static let russian = Image("FlagLanguageRussian")
        static let english = Image("FlagLanguageEnglish")
        static let chinese = Image("FlagLanguageChinese")
    }
    
    enum Buy {
        static let switchIcon = Image("SwitchButtonIcon")
        static let removeDate = Image("RemoveDateIcon")
    }
    
    enum Assistant {
        enum Microphone {
            static let normal = Image("AssistantMicrophone")
            static let black = Image("AssistantMicrophoneBlack")
        }
        
        enum Answering {
            static let normal = Image("AssistantStatusAnswering")
            static let black = Image("AssistantStatusAnsweringBlack")
        }
        
        enum Listening {
            static let normal = Image("AssistantStatusListening")
        }
        
        enum None {
            static let normal = Image("AssistantStatusNone")
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
