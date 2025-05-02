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
            TicketManagementCell(type: .buy)
            TicketManagementCell(type: .refund)
            TicketManagementCell(type: .recomendations)
        }
    }
    
    private var hotPrint: some View {
        VStack(spacing: 16) {
            TicketManagementCell(type: .hot)
            TicketManagementCell(type: .print)
        }
    }
}

#Preview {
    TicketManagementView()
}
