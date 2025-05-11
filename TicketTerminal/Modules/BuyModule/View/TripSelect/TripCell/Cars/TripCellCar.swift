//
//  TripCellCar.swift
//  TicketTerminal
//
//  Created by Roman Tverdokhleb on 08/05/2025.
//

import SwiftUI

struct TripCellCar: View {
    
    @EnvironmentObject private var accessibilityManager: AccessibilityManager
    private let car: NetworkTimetableService.Car
    
    init(car: NetworkTimetableService.Car) {
        self.car = car
    }
    
    internal var body: some View {
        HStack {
            title
            price
        }
    }
    
    private var title: some View {
        Text(car.typeLoc)
            .font(.scalable(size: 20,
                            weight: .medium,
                            scale: accessibilityManager.fontScale.scale))
            .foregroundStyle(Color.LabelColors.labelPrimary)
            .frame(maxWidth: .infinity, alignment: .leading)
        
    }
    
    private var price: some View {
        let price = "\(Texts.Buy.TripCell.from.localized) \(car.tariff) ₽"
        return Text(price)
            .font(.scalable(size: 20,
                            weight: .medium,
                            scale: accessibilityManager.fontScale.scale))
            .foregroundStyle(Color.blackVariant(
                color: .SymbolColors.red,
                scheme: accessibilityManager.fontColor))
            .frame(alignment: .trailing)
    }
}

#Preview {
    TripCellCar(car: .mock)
        .environmentObject(AccessibilityManager())
}
