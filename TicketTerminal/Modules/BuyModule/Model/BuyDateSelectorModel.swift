//
//  BuyDateSelectorModel.swift
//  TicketTerminal
//
//  Created by Roman Tverdokhleb on 05/05/2025.
//

enum BuyDate: CaseIterable {
    case departureDate
    case returnDate
    
    internal var title: String {
        switch self {
        case .departureDate:
            Texts.Buy.Placeholder.dateOfDeparture.localized
        case .returnDate:
            Texts.Buy.Placeholder.dateOfReturn.localized
        }
    }
}
