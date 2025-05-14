//
//  RecommendsModel.swift
//  TicketTerminal
//
//  Created by Roman Tverdokhleb on 14/05/2025.
//

import Foundation

enum Recommends {
    case north
    case south
    case east
    case west
    
    static internal var northWestCases: [Recommends] {
        [.north, .west]
    }
    
    static internal var southEastCases: [Recommends] {
        [.south, .east]
    }
    
    internal var title: String {
        switch self {
        case .north:
            Texts.Recommends.North.title.localized
        case .south:
            Texts.Recommends.South.title.localized
        case .east:
            Texts.Recommends.East.title.localized
        case .west:
            Texts.Recommends.West.title.localized
        }
    }
    
    internal var trips: [RecommendsTrip] {
        switch self {
        case .north:
            let first = RecommendsTrip(
                title: Texts.Recommends.North.First.title.localized,
                description: Texts.Recommends.North.First.description.localized,
                price: 858)
            let second = RecommendsTrip(
                title: Texts.Recommends.North.Second.title.localized,
                description: Texts.Recommends.North.Second.description.localized,
                price: 2740)
            let third = RecommendsTrip(
                title: Texts.Recommends.North.Third.title.localized,
                description: Texts.Recommends.North.Third.description.localized,
                price: 1609)
            return [first, second, third]
        case .south:
            let first = RecommendsTrip(
                title: Texts.Recommends.South.First.title.localized,
                description: Texts.Recommends.South.First.description.localized,
                price: 5753)
            let second = RecommendsTrip(
                title: Texts.Recommends.South.Second.title.localized,
                description: Texts.Recommends.South.Second.description.localized,
                price: 1885)
            let third = RecommendsTrip(
                title: Texts.Recommends.South.Third.title.localized,
                description: Texts.Recommends.South.Third.description.localized,
                price: 5121)
            return [first, second, third]
        case .east, .west:
            return []
        }
    }
}

struct RecommendsTrip {
    let id = UUID()
    let title: String
    let description: String
    let price: Int
}
