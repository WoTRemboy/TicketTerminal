//
//  TicketManagementModel.swift
//  TicketTerminal
//
//  Created by Roman Tverdokhleb on 03/05/2025.
//

import SwiftUI

enum TicketManagement {
    case buy
    case refund
    case recomendations
    case hot
    case print
    
    static internal var allCasesHorizont: [TicketManagement] {
        [.buy, .refund, .recomendations]
    }
    
    static internal var allCasesVertical: [TicketManagement] {
        [.hot, .print]
    }
    
    internal var title: String {
        switch self {
        case .buy:
            Texts.MainPage.Management.buy
        case .refund:
            Texts.MainPage.Management.refund
        case .recomendations:
            Texts.MainPage.Management.recomendation
        case .hot:
            Texts.MainPage.Management.hot
        case .print:
            Texts.MainPage.Management.print
        }
    }
    
    internal var image: Image {
        switch self {
        case .buy:
            Image.Management.buy
        case .refund, .hot:
            Image.Management.refund
        case .recomendations:
            Image.Management.recomendations
        case .print:
            Image.Management.print
        }
    }
    
    internal var imageFrame: (width: CGFloat, height: CGFloat) {
        switch self {
        case .buy, .recomendations, .print:
            (width: 95, height: 95)
        case .refund, .hot:
            (width: 95, height: 47)
        }
    }
    
    internal var cellFrame: (width: CGFloat, height: CGFloat) {
        switch self {
        case .buy:
            (width: 495, height: 170)
        case .refund, .recomendations:
            (width: 495, height: 132)
        case .hot:
            (width: 289, height: 170)
        case .print:
            (width: 289, height: 274)
        }
    }
    
    internal func showIcon(scheme: AccessibilityFontSize) -> Bool {
        switch scheme {
        case .first, .second:
            true
        case .third, .fourth, .fifth:
            false
        }
    }
    
    @ViewBuilder
    internal var destination: some View {
        switch self {
        case .buy:
            BuyView()
                .environmentObject(BuyViewModel())
        case .recomendations:
            RecommendsView()
        case .refund, .hot, .print:
            Text(self.title)
        }
    }
}
