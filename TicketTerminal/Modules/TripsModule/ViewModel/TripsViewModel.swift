//
//  TripsViewModel.swift
//  TicketTerminal
//
//  Created by Roman Tverdokhleb on 11/05/2025.
//

import Foundation
import SwiftUI

final class TripsViewModel: ObservableObject {
    
    @Published internal var selectedTrip: Trip
    
    init(selectedTrip: Trip = .express) {
        self.selectedTrip = selectedTrip
    }
    
    internal func isSelectedTrip(_ trip: Trip) -> Bool {
        trip == selectedTrip
    }
    
    internal func changeTrip(to trip: Trip) {
        withAnimation(.easeInOut(duration: 0.2)) {
            selectedTrip = trip
        }
    }
}
