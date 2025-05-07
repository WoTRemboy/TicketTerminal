//
//  Texts.swift
//  TicketTerminal
//
//  Created by Roman Tverdokhleb on 02/05/2025.
//

import Foundation

struct Texts {
    enum AppInfo {
        static let title = Bundle.main.object(forInfoDictionaryKey: "CFBundleDisplayName") as? String ?? "Ticket Terminal"
    }
    
    enum MainPage {
        enum Assistant {
            static let title = "MainPageAssistantTitle"
            static let content = "MainPageAssistantContent"
        }
        
        enum Weather {
            static let title = "MainPageWeatherTitle"
            static let content = "MainPageWeatherContent"
        }
        
        enum Trip {
            static let pearl = "MainPageTripPearl"
            static let lotus = "MainPageTripLotus"
            static let express = "MainPageTripExpress"
        }
        
        enum Management {
            static let buy = "MainPageManagementBuy"
            static let refund = "MainPageManagementRefund"
            static let recomendation = "MainPageManagementRecomendation"
            static let hot = "MainPageManagementHot"
            static let print = "MainPageManagementPrint"
        }
    }
    
    enum NavBar {
        static let about = "NavBarAbout"
        static let special = "NavBarSpecial"
        static let assistant = "NavBarAssistant"
        
        static let buy = "NavBarBuy"
        static let refund = "NavBarRefund"
        static let recomendation = "NavBarRecomendation"
        static let hot = "NavBarHot"
        static let print = "NavBarPrint"
        
        static let from = "NavBarFrom"
        static let destination = "NavBarDestination"
    }
    
    enum Language {
        static let title = "LanguageTitle"
        
        enum English {
            static let code = "en"
            static let name = "English"
        }
        
        enum Russian {
            static let code = "ru"
            static let name = "Русский"
        }
        
        enum Chinese {
            static let code = "zh-Hans"
            static let name = "中国人"
        }
    }
    
    enum About {
        static let headquaters = "AboutHeadquaters"
        
        enum Version {
            static let title = "AboutVersionTitle"
            static let content = "v \(Bundle.main.infoDictionary?["CFBundleShortVersionString"] as? String ?? "1.0") (\(Bundle.main.infoDictionary?["CFBundleVersion"] as? String ?? "1"))"
        }
        
        enum Number {
            static let title = "AboutNumberTitle"
            static let content = "+7 (800) 775-00-00"
            static let linkTel = "+78007750000"
        }
        
        enum Address {
            static let title = "AboutAddressTitle"
            static let content = "AboutAddressContent"
        }
        
        enum Info {
            static let title = "AboutInfoTitle"
            static let content = "AboutInfoContent"
        }
    }
    
    enum Accessibility {
        enum FontColor {
            static let title = "AccessibilityFontColorTitle"
            static let firstVariation = "AccessibilityFontColorFirstVariation"
            static let secondVariation = "AccessibilityFontColorSecondVariation"
        }
        
        enum FontSize {
            static let title = "AccessibilityFontSizeTitle"
            static let firstVariation = "1x"
            static let secondVariation = "1.25x"
            static let thirdVariation = "1.5x"
            static let fourthVariation = "1.75x"
            static let fifthVariation = "2x"
        }
        
        enum ImparedMode {
            static let title = "AccessibilityImparedModeTitle"
        }
        
        enum ScreenReader {
            static let title = "AccessibilityScreenReaderTitle"
            static let firstVariation = "AccessibilityScreenReaderFirstVariation"
            static let secondVariation = "AccessibilityScreenReaderSecondVariation"
        }
    }
    
    enum Buy {
        enum Placeholder {
            static let from = "BuyPlaceholderFrom"
            static let destination = "BuyPlaceholderDestination"
            static let dateOfDeparture = "BuyPlaceholderDateOfDeparture"
            static let dateOfReturn = "BuyPlaceholderDateOfReturn"
            static let station = "BuyPlaceholderStation"
            
            enum Station {
                static let first = "BuyPlaceholderStationFirst"
                static let second = "BuyPlaceholderStationSecond"
                static let third = "BuyPlaceholderStationThird"
            }
        }
        
        enum Buttons {
            static let search = "BuyButtonsSearch"
            static let trips = "BuyButtonsTrips"
            static let hot = "BuyButtonsHot"
        }
    }
    
    enum UserDefaults {
        enum Accessibility {
            static let fontColor = "AccessibilityFontColor"
            static let fontSize = "AccessibilityFontSize"
            static let imparedMode = "AccessibilityImparedMode"
            static let screenReader = "AccessibilityScreenReader"
        }
        
        enum AccessibilityManager {
            static let fontSize = "FontSizeManager"
            static let fontColor = "FontColorManager"
        }
        
        enum Language {
            static let selectedLanguage = "LocalizationManagerSelectedLanguage"
        }
    }
    
    enum NamespaceID {
        enum Accessibility {
            static let fontColor = "FontColorParam"
            static let fontSize = "FontSizeParam"
            static let imparedMode = "ImparedModeParam"
            static let screenReader = "ScreenReaderParam"
        }
        
        enum Assistant {
            static let zoomTransition = "AssistantZoomTransition"
        }
    }
}
