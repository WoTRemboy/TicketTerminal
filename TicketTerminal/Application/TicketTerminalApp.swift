//
//  TicketTerminalApp.swift
//  TicketTerminal
//
//  Created by Roman Tverdokhleb on 02/05/2025.
//

import SwiftUI

@main
struct TicketTerminalApp: App {
    
    @AppStorage(Texts.UserDefaults.Language.selectedLanguage)
    private var selectedLanguage: String = Locale.current.language.languageCode?.identifier ?? Texts.Language.English.code
    
    init() {
        Bundle.setLanguage(selectedLanguage)
    }
    
    internal var body: some Scene {
        WindowGroup {
            SplashScreenView()
                .environmentObject(AccessibilityManager.shared)
                .environmentObject(LocalizationManager.shared)
        }
    }
}
