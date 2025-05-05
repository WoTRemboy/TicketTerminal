//
//  BuyDateBlockView.swift
//  TicketTerminal
//
//  Created by Roman Tverdokhleb on 05/05/2025.
//

import SwiftUI

struct BuyDateBlockView: View {
    internal var body: some View {
        HStack(spacing: 22) {
            ForEach(BuyDate.allCases, id: \.self) { type in
                BuyDateSelector(type: type)
            }
        }
        .padding(.horizontal)
    }
}

#Preview {
    BuyDateBlockView()
        .environmentObject(AccessibilityManager())
        .environmentObject(BuyViewModel())
}
