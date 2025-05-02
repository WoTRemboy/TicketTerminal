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
            static let title = "Попутчик"
            static let content = "Твой голосовой помощник"
        }
        
        enum Weather {
            static let title = "18°C"
            static let content = "Москва"
        }
        
        enum Trip {
            static let pearl = "Жемчужина Кавказа"
            static let lotus = "В долину лотосов"
            static let express = "Байкальский экспресс"
        }
        
        enum Management {
            static let buy = "Купить билет"
            static let refund = "Вернуть билет"
            static let recomendation = "Рекомендации"
            static let hot = "Горячие\nпути"
            static let print = "Распечатать\nбилет"
        }
    }
}
