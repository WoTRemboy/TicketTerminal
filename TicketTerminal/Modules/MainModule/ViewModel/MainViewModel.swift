//
//  MainViewModel.swift
//  TicketTerminal
//
//  Created by Roman Tverdokhleb on 03/05/2025.
//

import SwiftUI

final class MainViewModel: ObservableObject {
    
    @Published internal var isShowingLanguagePage: Bool = false
    
    internal func isShowingLanguagePageToggle() {
        isShowingLanguagePage.toggle()
    }
}
