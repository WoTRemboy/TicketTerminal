//
//  TicketManagementView.swift
//  TicketTerminal
//
//  Created by Roman Tverdokhleb on 03/05/2025.
//

import SwiftUI

struct TicketManagementView: View {
    internal var body: some View {
        HStack(spacing: 16) {
            buyRefundRecomend
            hotPrint
        }
    }
    
    private var buyRefundRecomend: some View {
        VStack(spacing: 16) {
            ForEach(TicketManagement.allCasesHorizont, id: \.self) { type in
                CustomNavLink(destination: type.destination) {
                    TicketManagementCell(type: type)
                }
                .buttonStyle(.plain)
            }
        }
    }
    
    private var hotPrint: some View {
        VStack(spacing: 16) {
            ForEach(TicketManagement.allCasesVertical, id: \.self) { type in
                CustomNavLink(destination: type.destination) {
                    TicketManagementCell(type: type)
                }
                .buttonStyle(.plain)
            }
        }
    }
}

#Preview {
    TicketManagementView()
        .environmentObject(AccessibilityManager())
}
