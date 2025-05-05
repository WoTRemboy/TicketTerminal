//
//  BuyButtonBlockView.swift
//  TicketTerminal
//
//  Created by Roman Tverdokhleb on 05/05/2025.
//

import SwiftUI

struct BuyButtonBlockView: View {
    internal var body: some View {
        VStack {
            ForEach(BuyButton.allCases, id: \.self) { type in
                BuyButtonView(type: type)
            }
        }
    }
}

#Preview {
    BuyButtonBlockView()
        .environmentObject(AccessibilityManager())
        .environmentObject(BuyViewModel())
}
