//
//  RecommendScrollCell.swift
//  TicketTerminal
//
//  Created by Roman Tverdokhleb on 14/05/2025.
//

import SwiftUI

struct RecommendScrollCell: View {
    
    @EnvironmentObject private var accessibilityManager: AccessibilityManager
    
    private let type: RecommendsTrip
    
    init(type: RecommendsTrip) {
        self.type = type
    }
    
    internal var body: some View {
        VStack(alignment: .leading, spacing: 26) {
            titlePrice
            description
        }
        .frame(maxWidth: .infinity, alignment: .leading)
        .padding(30)
        .background(background)
    }
    
    private var background: some View {
        Background(radius: 40,
                   scheme: accessibilityManager.fontColor)
    }
    
    private var titlePrice: some View {
        HStack(spacing: 22) {
            title
            price
        }
    }
    
    private var title: some View {
        Text(type.title)
            .font(.scalable(
                size: 32,
                weight: .medium,
                scale: accessibilityManager.fontScale.scale)
            )
            .foregroundStyle(Color.LabelColors.labelPrimary)
    }
    
    private var price: some View {
        let content = "\(Texts.Buy.TripCell.from.localized) \(type.price) ₽"
        return Text(content)
            .font(.scalable(
                size: 32,
                weight: .medium,
                scale: accessibilityManager.fontScale.scale)
            )
            .foregroundStyle(Color.blackVariant(
                color: .SymbolColors.red,
                scheme: accessibilityManager.fontColor)
            )
    }
    
    private var description: some View {
        Text(type.description)
            .font(.scalable(
                size: 24,
                weight: .regular,
                scale: accessibilityManager.fontScale.scale)
            )
            .foregroundStyle(Color.LabelColors.labelPrimary)
    }
}

#Preview {
    RecommendScrollCell(type: .init(
        title: "Saint Petersburg",
        description: "Situated in the northwest of the country on the coast of the Gulf of Finland and at the mouth of the Neva River, 634 kilometers from Moscow.",
        code: 20000040,
        price: 1609))
    .environmentObject(AccessibilityManager())
}
