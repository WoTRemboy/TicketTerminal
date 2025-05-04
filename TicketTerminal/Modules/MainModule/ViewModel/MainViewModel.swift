//
//  MainViewModel.swift
//  TicketTerminal
//
//  Created by Roman Tverdokhleb on 03/05/2025.
//

import SwiftUI

final class MainViewModel: ObservableObject {
    
    @Published internal var isShowingAboutPage: Bool = false
    
    internal func isShowingAboutPageToggle() {
        isShowingAboutPage.toggle()
    }
}
