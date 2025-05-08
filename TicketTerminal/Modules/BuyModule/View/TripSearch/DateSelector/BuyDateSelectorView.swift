//
//  BuyDateSelectorView.swift
//  TicketTerminal
//
//  Created by Roman Tverdokhleb on 07/05/2025.
//

import SwiftUI

struct BuyDateSelectorView: View {
    
    @EnvironmentObject private var viewModel: BuyViewModel
    @EnvironmentObject private var accessibilityManager: AccessibilityManager
    
    @Environment(\.dismiss) private var dismiss
    
    private let type: BuyDate
    
    init(type: BuyDate) {
        self.type = type
    }
    
    internal var body: some View {
        VStack(spacing: 40) {
            title
            datePicker
            buttons
        }
    }
    
    private var title: some View {
        Text(type.title)
            .font(.scalable(
                size: 40,
                weight: .medium,
                scale: accessibilityManager.fontScale.scale))
    }
    
    private var datePicker: some View {
        Group {
            if type == .departureDate {
                departureDatePicker
            } else {
                returnDatePicker
            }
        }
        .datePickerStyle(.graphical)
        .frame(width: 400, height: 380)
        .background(Background(radius: 20, scheme: accessibilityManager.fontColor))
    }
    
    private var departureDatePicker: some View {
        DatePicker(
            String(),
            selection: $viewModel.departureDate,
            in: Date()...,
            displayedComponents: .date)
    }
    
    private var returnDatePicker: some View {
        DatePicker(
            String(),
            selection: $viewModel.returnDate,
            in: viewModel.departureDate...,
            displayedComponents: .date)
    }
    
    private var buttons: some View {
        HStack(spacing: 20) {
            cancelButton
            actionButton(type: type)
        }
        .padding([.horizontal, .bottom], 20)
    }
    
    private func actionButton(type: BuyDate) -> some View {
        Button {
            withAnimation(.easeInOut(duration: 0.2)) {
                viewModel.setDate(for: type)
            }
            dismiss()
        } label: {
            buttonContent(title: Texts.Actions.accept.localized,
                          color: Color.LabelColors.labelPrimary)
        }
        .buttonStyle(.plain)
    }
    
    private var cancelButton: some View {
        Button {
            dismiss()
        } label: {
            buttonContent(title: Texts.Actions.cancel.localized,
                          color: Color.SymbolColors.red)
        }
        .buttonStyle(.plain)
    }
    
    private func buttonContent(title: String, color: Color) -> some View {
        Text(title)
            .font(.scalable(size: 30,
                            weight: .medium,
                            scale: accessibilityManager.fontScale.scale))
            .foregroundStyle(color)
            .frame(maxWidth: .infinity)
            .padding()
            .background(Background(radius: 20, scheme: accessibilityManager.fontColor))
    }
}

#Preview {
    BuyDateSelectorView(type: .departureDate)
        .environmentObject(BuyViewModel())
        .environmentObject(AccessibilityManager())
}
