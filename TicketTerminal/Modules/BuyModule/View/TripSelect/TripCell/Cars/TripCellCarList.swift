//
//  TripCellCarList.swift
//  TicketTerminal
//
//  Created by Roman Tverdokhleb on 08/05/2025.
//

import SwiftUI

struct TripCellCarList: View {
    
    @EnvironmentObject private var accessibilityManager: AccessibilityManager
    private let cars: [NetworkTimetableService.Car]
    
    init(cars: [NetworkTimetableService.Car]) {
        self.cars = cars
    }
    
    internal var body: some View {
        ScrollView {
            VStack(spacing: 10) {
                ForEach(cars, id: \.id) { car in
                    TripCellCar(car: car)
                }
            }
        }
    }
}

#Preview {
    TripCellCarList(cars: [.mock, .mock, .mock])
        .environmentObject(AccessibilityManager())
}
