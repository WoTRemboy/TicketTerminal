//
//  BuyTargetModel.swift
//  TicketTerminal
//
//  Created by Roman Tverdokhleb on 05/05/2025.
//

enum BuyTarget: CaseIterable {
    case departure
    case arrival
    
    internal var title: String {
        switch self {
        case .departure:
            Texts.Buy.Placeholder.from.localized
        case .arrival:
            Texts.Buy.Placeholder.destination.localized
        }
    }
}
