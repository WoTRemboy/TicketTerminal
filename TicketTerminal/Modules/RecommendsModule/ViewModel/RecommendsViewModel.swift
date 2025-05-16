//
//  RecommendsViewModel.swift
//  TicketTerminal
//
//  Created by Roman Tverdokhleb on 14/05/2025.
//

import Foundation
import SwiftUI

final class RecommendsViewModel: ObservableObject {
    
    @Published internal var selectedDate: Date = .now
    @Published internal var isDateSelectorShown: Bool = false
    @Published internal var selectedSet: Recommends = .north
    
    internal func setSelected(_ set: Recommends) {
        withAnimation(.easeInOut(duration: 0.2)) {
            selectedSet = set
        }
    }
    
    internal func isSelected(_ set: Recommends) -> Bool {
        selectedSet == set
    }
    
    internal func viewModelSetup(type: RecommendsTrip) -> BuyViewModel {
        let destViewModel = BuyViewModel()
        destViewModel.selectedDepartureDate = selectedDate
        destViewModel.selectedDepartureStation = NetworkStationService.Station(
            name: Texts.Buy.Placeholder.Station.second.localized,
            code: 2000000,
            S: 7, L: 6)
        destViewModel.selectedArrivalStation = NetworkStationService.Station(
            name: type.title.uppercased(),
            code: type.code,
            S: 5, L: 5)
        return destViewModel
    }
}
