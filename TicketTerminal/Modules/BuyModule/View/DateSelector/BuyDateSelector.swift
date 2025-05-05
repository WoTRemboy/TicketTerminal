//
//  BuyDateSelector.swift
//  TicketTerminal
//
//  Created by Roman Tverdokhleb on 05/05/2025.
//

import SwiftUI

struct BuyDateSelector: View {
    
    @EnvironmentObject private var accessibilityManager: AccessibilityManager
    @EnvironmentObject private var viewModel: BuyViewModel
    
    private let type: BuyDate
    
    init(type: BuyDate) {
        self.type = type
    }
        
    internal var body: some View {
        background
            .frame(height: 200)
            .overlay(alignment: .topLeading) {
                overlay
            }
    }
    
    private var overlay: some View {
        ZStack {
            Text(type.title)
                .font(.scalable(
                    size: 32,
                    weight: .medium,
                    scale: accessibilityManager.fontScale.scale))
                .foregroundStyle(Color.LabelColors.labelPlaceholder)
                .padding(24)
            datePicker
        }
    }
    
    private var datePicker: some View {
        Group {
            switch type {
            case .departureDate:
                departurePicker
            case .returnDate:
                returnPicker
            }
        }
        .labelsHidden()
        .blendMode(.destinationOver)
    }
    
    private var departurePicker: some View {
        DatePicker(
            String(),
            selection: $viewModel.departureDate,
            displayedComponents: .date)
    }
    
    private var returnPicker: some View {
        DatePicker(
            String(),
            selection: $viewModel.returnDate,
            displayedComponents: .date)
    }
    
    private var background: some View {
        RoundedRectangle(cornerRadius: 40)
            .stroke(Color.blackVariant(
                color: .clear,
                scheme: accessibilityManager.fontColor),
                    lineWidth: 3)
            .background {
                RoundedRectangle(cornerRadius: 40)
                    .fill(Color.BackColors.backDefault)
                    .shadow(
                        color: Color.alterColor(
                            normal: .LabelColors.labelBlack.opacity(0.25),
                            alter: .clear,
                            scheme: accessibilityManager.fontColor),
                        radius: 4,
                        x: 0,
                        y: 1)
            }
    }
}

#Preview {
    BuyDateSelector(type: .departureDate)
        .environmentObject(AccessibilityManager())
        .environmentObject(BuyViewModel())
}
