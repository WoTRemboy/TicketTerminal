//
//  BuyViewModel.swift
//  TicketTerminal
//
//  Created by Roman Tverdokhleb on 05/05/2025.
//

import Foundation

final class BuyViewModel: ObservableObject {
    
    @Published internal var fromSearchText: String = String()
    @Published internal var destinationSearchText: String = String()
    
    @Published internal var departureDate: Date = .now
    @Published internal var returnDate: Date = .now
    
    internal func switchSearchTexts() {
        let temp = destinationSearchText
        destinationSearchText = fromSearchText
        fromSearchText = temp
    }
}
