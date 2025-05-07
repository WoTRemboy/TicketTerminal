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
    
    @Published internal var selectedDepartureDate: Date?
    @Published internal var selectedReturnDate: Date?
    
    @Published internal var departureDate: Date = .now
    @Published internal var returnDate: Date = .now
    
    internal func setDate(for type: BuyDate) {
        switch type {
        case .departureDate:
            selectedDepartureDate = departureDate
        case .returnDate:
            selectedReturnDate = returnDate
        }
    }
    
    internal func getDateSeconds(for type: BuyDate) -> Double {
        switch type {
        case .departureDate:
            guard let selectedDepartureDate else { return 0 }
            return selectedDepartureDate.timeIntervalSinceNow
        case .returnDate:
            guard let selectedReturnDate else { return 0 }
            return selectedReturnDate.timeIntervalSinceNow
        }
    }
    
    internal func getDateName(for type: BuyDate) -> (name: String, color: Color) {
        switch type {
        case .departureDate:
            guard let selectedDepartureDate else { return (type.title, Color.LabelColors.labelDetails) }
            return (selectedDepartureDate.formatted(date: .numeric, time: .omitted), Color.LabelColors.labelPrimary)
        case .returnDate:
            guard let selectedReturnDate else { return (type.title, Color.LabelColors.labelDetails) }
            return (selectedReturnDate.formatted(date: .numeric, time: .omitted), Color.LabelColors.labelPrimary)
        }
    }
    
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
