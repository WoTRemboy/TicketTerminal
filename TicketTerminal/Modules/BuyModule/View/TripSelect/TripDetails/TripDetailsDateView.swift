//
//  TripDetailsDateView.swift
//  TicketTerminal
//
//  Created by Roman Tverdokhleb on 08/05/2025.
//

import SwiftUI

struct TripDetailsDateView: View {
    
    @EnvironmentObject private var accessibilityManager: AccessibilityManager
    
    private let date: String
    private let action: () -> Void
    
    init(date: String, action: @escaping () -> Void) {
        self.date = date
        self.action = action
    }
    
    internal var body: some View {
        HStack(spacing: 18) {
            title
            dateButton
        }
    }
    
    private var title: some View {
        Text("\(Texts.Buy.TripCell.date.localized):")
            .font(.scalable(size: 32,
                            weight: .medium,
                            scale: accessibilityManager.fontScale.scale))
            .foregroundStyle(Color.blackVariant(
                color: .SymbolColors.red,
                scheme: accessibilityManager.fontColor))
    }
    
    private var dateButton: some View {
        Button {
            action()
        } label: {
            dateButtonContent
        }
        .buttonStyle(.plain)
    }
    
    private var dateButtonContent: some View {
        Text(date)
            .font(.scalable(size: 32,
                            weight: .regular,
                            scale: accessibilityManager.fontScale.scale))
            .foregroundStyle(Color.LabelColors.labelPrimary)
        
            .padding()
            .background(Background(radius: 140,
                                   scheme: accessibilityManager.fontColor))
    }
}

#Preview {
    TripDetailsDateView(date: "09.05.2025") {}
        .environmentObject(AccessibilityManager())
}
