//
//  BuyTargetModel.swift
//  TicketTerminal
//
//  Created by Roman Tverdokhleb on 05/05/2025.
//

enum BuyTarget: CaseIterable {
    case from
    case destination
    
    internal var title: String {
        switch self {
        case .from:
            Texts.Buy.Placeholder.from
        case .destination:
            Texts.Buy.Placeholder.destination
        }
    }
}
