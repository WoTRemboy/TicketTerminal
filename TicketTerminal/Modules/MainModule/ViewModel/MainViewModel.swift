//
//  MainViewModel.swift
//  TicketTerminal
//
//  Created by Roman Tverdokhleb on 03/05/2025.
//

import SwiftUI

final class MainViewModel: ObservableObject {
    
    @Published internal var isShowingLanguagePage: Bool = false
    @Published internal var isShowingAssistantPage: Bool = false
    
    internal func isShowingLanguagePageToggle() {
        isShowingLanguagePage.toggle()
    }
    
    internal func isShowingAssistantPageToggle() {
        isShowingAssistantPage.toggle()
    }
    
    internal func detaildeButtonAction(type: DetailedButton) {
        switch type {
        case .assistant:
            isShowingAssistantPage.toggle()
        case .weather:
            return
        }
    }
}
