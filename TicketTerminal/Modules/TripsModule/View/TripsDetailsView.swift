//
//  TripsDetailsView.swift
//  TicketTerminal
//
//  Created by Roman Tverdokhleb on 11/05/2025.
//

import SwiftUI

struct TripsDetailsView: View {
    
    @EnvironmentObject private var accessibilityManager: AccessibilityManager
    
    private let type: Trip
    
    init(type: Trip) {
        self.type = type
    }
    
    internal var body: some View {
        VStack(spacing: 0) {
            route
                .padding(.top, 26)
            
            title
                .padding(.top, 16)
            
            description
                .padding(.top, 34)
            
            if accessibilityManager.fontColor == .defaultValue,
               accessibilityManager.fontScale.scale < 1.5 {
                image
                    .padding(.top, 22)
            }
        }
    }
    
    private var route: some View {
        Text(type.route)
            .font(.scalable(
                size: 32,
                weight: .medium,
                scale: accessibilityManager.fontScale.scale))
            .foregroundStyle(Color.blackVariant(
                color: .SymbolColors.red,
                scheme: accessibilityManager.fontColor))
            .frame(maxWidth: .infinity, alignment: .leading)
    }
    
    private var title: some View {
        Text(type.detailsTitle)
            .font(.scalable(
                size: 50,
                weight: .medium,
                scale: accessibilityManager.fontScale.scale))
            .foregroundStyle(Color.LabelColors.labelPrimary)
            .frame(maxWidth: .infinity, alignment: .leading)
    }
    
    private var description: some View {
        Text(type.description)
            .font(.scalable(
                size: 32,
                weight: .regular,
                scale: accessibilityManager.fontScale.scale))
            .foregroundStyle(Color.LabelColors.labelPrimary)
            .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .leading)
    }
    
    private var image: some View {
        type.detailsImage
            .resizable()
            .scaledToFit()
            .frame(height: 400)
            .clipShape(.rect(cornerRadius: 20))
            .padding(.bottom)
    }
    
}

#Preview {
    TripsDetailsView(type: .express)
        .environmentObject(AccessibilityManager())
}
