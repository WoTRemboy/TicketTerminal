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
    
    enum NavBar {
        static let about = "О терминале"
        static let special = "Специальные возможности"
        static let buy = "Купить билет"
    }
    
    enum About {
        static let headquaters = "Штаб-квартира"
        
        enum Version {
            static let title = "Версия"
            static let content = "v \(Bundle.main.infoDictionary?["CFBundleShortVersionString"] as? String ?? "1.0") (\(Bundle.main.infoDictionary?["CFBundleVersion"] as? String ?? "1"))"
        }
        
        enum Number {
            static let title = "Номер тех.поддержки"
            static let content = "+7 (800) 775-00-00"
            static let linkTel = "+78007750000"
        }
        
        enum Address {
            static let title = "Адрес нахождения"
            static let content = "107174, г. Москва, вн. тер. г. муниципальный округ Басманный, ул. Новая Басманная, д. 2/1, стр. 1"
        }
        
        enum Info {
            static let title = "Юридическая информация"
            static let content = "Ссылка"
        }
    }
    
    enum Accessibility {
        enum FontColor {
            static let title = "Цвет шрифта"
            static let firstVariation = "Фирменная палитра"
            static let secondVariation = "Чёрно-белый"
        }
        
        enum FontSize {
            static let title = "Размер шрифта"
            static let firstVariation = "1x"
            static let secondVariation = "1.25x"
            static let thirdVariation = "1.5x"
            static let fourthVariation = "1.75x"
            static let fifthVariation = "2x"
        }
        
        enum ImparedMode {
            static let title = "Режим для слабовидящих"
        }
        
        enum ScreenReader {
            static let title = "Чтение с экрана"
            static let firstVariation = "Включить"
            static let secondVariation = "Выключить"
        }
    }
}
