//
//  MainNavBar.swift
//  TicketTerminal
//
//  Created by Roman Tverdokhleb on 02/05/2025.
//

import SwiftUI

struct MainNavBar: View {
    internal var body: some View {
        HStack(spacing: 45) {
            logo
            Spacer()
            
            button(type: .language)
            button(type: .info)
            button(type: .special)
        }
        .padding()
    }
    
    private var logo: some View {
        Image.MainPage.logo
            .resizable()
            .frame(width: 175, height: 84)
    }
    
    private func button(type: NavBarButton) -> some View {
        Button {
            // Button Action
        } label: {
            Circle()
                .stroke(Color.SymbolColors.red,
                        lineWidth: 10)
                .background {
                    ZStack {
                        Color.SymbolColors.red
                        type.image
                    }
                }
                .mask(Circle())
                .frame(width: 60)
        }
        .buttonStyle(.plain)
    }
}

#Preview {
    MainNavBar()
}
