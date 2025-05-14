//
//  BuyDateSelectorView.swift
//  TicketTerminal
//
//  Created by Roman Tverdokhleb on 07/05/2025.
//

import SwiftUI

struct BuyDateSelectorView: View {
    
    @EnvironmentObject private var accessibilityManager: AccessibilityManager
    
    @Binding var selectedDate: Date
    @Environment(\.dismiss) private var dismiss
    
    let title: String
    let dateRange: PartialRangeFrom<Date>
    let action: () -> Void
    
    internal var body: some View {
        VStack(spacing: 40) {
            titleLabel
            datePicker
            buttons
        }
    }
    
    private var titleLabel: some View {
        Text(title)
            .font(.scalable(
                size: 40,
                weight: .medium,
                scale: accessibilityManager.fontScale.scale))
    }
    
    private var datePicker: some View {
        DatePicker(
            String(),
            selection: $selectedDate,
            in: dateRange,
            displayedComponents: .date)
        
        .datePickerStyle(.graphical)
        .frame(width: 400, height: 380)
        .background(Background(radius: 20, scheme: accessibilityManager.fontColor))
    }
    
    private var buttons: some View {
        HStack(spacing: 20) {
            cancelButton
            actionButton
        }
        .padding([.horizontal, .bottom], 20)
    }
    
    private var actionButton: some View {
        Button {
            withAnimation(.easeInOut(duration: 0.2)) {
                action()
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
    BuyDateSelectorView(
        selectedDate: .constant(Date()),
        title: "Departure",
        dateRange: Date()...,
        action: {})
        .environmentObject(AccessibilityManager())
}
