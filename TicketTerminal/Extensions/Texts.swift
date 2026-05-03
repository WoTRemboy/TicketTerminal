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
    
    enum Actions {
        static let accept = "ActionsAccept"
        static let cancel = "ActionsCancel"
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
    
    enum TripsPage {
        enum Pearl {
            static let title = "TripsPagePearlTitle"
            static let route = "TripsPagePearlRoute"
            static let description = "TripsPagePearlDescription"
        }
        
        enum Lotus {
            static let title = "TripsPageLotusTitle"
            static let route = "TripsPageLotusRoute"
            static let description = "TripsPageLotusDescription"
        }
        
        enum Express {
            static let title = "TripsPageExpressTitle"
            static let route = "TripsPageExpressRoute"
            static let description = "TripsPageExpressDescription"
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
        static let trips = "NavBarTrips"
        static let recommends = "NavBarRecommends"
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
                static let fourth = "BuyPlaceholderStationFourth"
                static let fifth = "BuyPlaceholderStationFifth"
                static let sixth = "BuyPlaceholderStationSixth"
                static let seventh = "BuyPlaceholderStationSeventh"
            }
        }
        
        enum TripCell {
            static let days = "BuyPlaceholderTripCellDays"
            static let hours = "BuyPlaceholderTripCellHours"
            static let minutes = "BuyPlaceholderTripCellMinutes"
            static let from = "BuyPlaceholderTripCellFrom"
            static let trip = "BuyPlaceholderTripCellTrip"
            static let date = "BuyPlaceholderTripCellDate"
        }
        
        enum Buttons {
            static let search = "BuyButtonsSearch"
            static let trips = "BuyButtonsTrips"
            static let hot = "BuyButtonsHot"
        }
    }
    
    enum Assistant {
        static let preparation = "AssistantPreparation"
        static let listening = "AssistantListening"
        static let prompt = "You are a multilingual ticket-terminal assistant inside a railway terminal app. When the user asks to buy or search for train tickets, call the function open_ticket_purchase. When the user asks for travel recommendations or recommended cities, call the function open_recommendations. If the user asks “Что ты умеешь?”, “What can you do?”, or “你能做什么？”, reply only with: “Я умею искать билеты и советовать города для поездки” in Russian; “I can search for tickets and recommend cities to visit” in English; “我可以搜索车票并推荐旅行城市” in Chinese (simplified). For all non-function text responses, do not add extra explanations or punctuation. Respond in the same language the user used."

        static func ticketPurchaseResponse(for language: String) -> String {
            switch language {
            case Texts.Language.Russian.code:
                "Перехожу на покупку билета"
            case Texts.Language.Chinese.code:
                "进入购票"
            default:
                "Proceeding to ticket purchase"
            }
        }

        static func recommendationsResponse(for language: String) -> String {
            switch language {
            case Texts.Language.Russian.code:
                "Перехожу в рекомендации"
            case Texts.Language.Chinese.code:
                "进入推荐"
            default:
                "Proceeding to recommendations"
            }
        }
    }
    
    enum Recommends {
        enum North {
            static let title = "RecommendsNorthTitle"
            
            enum First {
                static let title = "RecommendsNorthFirstTitle"
                static let description = "RecommendsNorthFirstDescription"
                static let price = "RecommendsNorthFirstPrice"
            }
            enum Second {
                static let title = "RecommendsNorthSecondTitle"
                static let description = "RecommendsNorthSecondDescription"
                static let price = "RecommendsNorthSecondPrice"
            }
            enum Third {
                static let title = "RecommendsNorthThirdTitle"
                static let description = "RecommendsNorthThirdDescription"
                static let price = "RecommendsNorthThirdPrice"
            }
        }
        
        enum South {
            static let title = "RecommendsSouthTitle"
            
            enum First {
                static let title = "RecommendsSouthFirstTitle"
                static let description = "RecommendsSouthFirstDescription"
            }
            enum Second {
                static let title = "RecommendsSouthSecondTitle"
                static let description = "RecommendsSouthSecondDescription"
            }
            enum Third {
                static let title = "RecommendsSouthThirdTitle"
                static let description = "RecommendsSouthThirdDescription"
            }
        }
        enum East {
            static let title = "RecommendsEastTitle"
        }
        enum West {
            static let title = "RecommendsWestTitle"
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
