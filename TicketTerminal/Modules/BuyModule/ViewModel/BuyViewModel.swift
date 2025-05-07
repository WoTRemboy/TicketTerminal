//
//  BuyViewModel.swift
//  TicketTerminal
//
//  Created by Roman Tverdokhleb on 05/05/2025.
//

import Foundation
import SwiftUI

final class BuyViewModel: ObservableObject {

    @Published internal var selectedDepartureStation: NetworkStationService.Station?
    @Published internal var selectedArrivalStation: NetworkStationService.Station?
    
    @Published internal var departureDate: Date = .now
    @Published internal var returnDate: Date = .now
    
    internal func setStation(_ station: NetworkStationService.Station, for type: BuyTarget) {
        switch type {
        case .departure:
            selectedDepartureStation = station
        case .arrival:
            selectedArrivalStation = station
        }
    }
    
    internal func getStationName(for type: BuyTarget) -> (name: String, color: Color) {
        switch type {
        case .departure:
            guard let selectedDepartureStation else { return (type.title, Color.LabelColors.labelDetails) }
            return (selectedDepartureStation.name, Color.LabelColors.labelPrimary)
        case .arrival:
            guard let selectedArrivalStation else { return (type.title, Color.LabelColors.labelDetails) }
            return (selectedArrivalStation.name, Color.LabelColors.labelPrimary)
        }
    }
    
    internal func switchDestinations() {
        let temp = selectedDepartureStation
        selectedDepartureStation = selectedArrivalStation
        selectedArrivalStation = temp
    }
}
