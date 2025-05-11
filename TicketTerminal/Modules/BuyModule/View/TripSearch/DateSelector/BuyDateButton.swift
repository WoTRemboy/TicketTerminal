//
//  BuyDateSelector.swift
//  TicketTerminal
//
//  Created by Roman Tverdokhleb on 05/05/2025.
//

import SwiftUI

struct BuyDateButton: View {
    
    @EnvironmentObject private var accessibilityManager: AccessibilityManager
    @EnvironmentObject private var viewModel: BuyViewModel
    
    @State private var isDatePickerShown: Bool = false
        
    private let type: BuyDate
    
    init(type: BuyDate) {
        self.type = type
    }
    
    internal var body: some View {
        content
            .background(background)
            .overlay(alignment: .bottomTrailing) {
                if viewModel.getDate(for: type) != nil {
                    removeButton
                        .transition(.scale)
                }
            }
            .sheet(isPresented: $isDatePickerShown) {
                BuyDateSelectorView(type: type)
            }
            
    }
    
    private var background: some View {
        Background(
            radius: 40,
            scheme: accessibilityManager.fontColor)
    }
    
    private var content: some View {
        Button {
            isDatePickerShown.toggle()
        } label: {
            let (name, color) = viewModel.getDateName(for: type)
            Text(name)
                .font(.scalable(
                    size: 32,
                    weight: .medium,
                    scale: accessibilityManager.fontScale.scale))
                .foregroundStyle(color)
                .contentTransition(.numericText(value: viewModel.getDateSeconds(for: type)))
            
                .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .topLeading)
                .padding(24)
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
    
    private var removeButton: some View {
        Button {
            withAnimation(.easeInOut(duration: 0.2)) {
                viewModel.removeDate(for: type)
            }
        } label: {
            Image.Buy.removeDate
                .padding()
                .background(
                    Background(radius: 16,
                               scheme: accessibilityManager.fontColor)
                )
        }
        .buttonStyle(.plain)
        .padding(22)
    }
}

#Preview {
    BuyDateButton(type: .departureDate)
        .environmentObject(AccessibilityManager())
        .environmentObject(BuyViewModel())
}
