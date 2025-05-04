//
//  MainNavBar.swift
//  TicketTerminal
//
//  Created by Roman Tverdokhleb on 02/05/2025.
//

import SwiftUI

struct MainNavBar: View {
    
    @EnvironmentObject private var accessibilityManager: AccessibilityManager
    
    internal var body: some View {
        HStack(spacing: 45) {
            logo
            Spacer()
            
            ForEach(NavBarButton.allCases, id: \.self) { type in
                button(type: type)
            }
        }
        .padding()
    }
    
    private var logo: some View {
        Image.alterColored(
            normal: Image.MainPage.Logo.normal,
            alter: Image.MainPage.Logo.black,
            scheme: accessibilityManager.fontColor)
        
        .resizable()
        .frame(width: 175, height: 84)
    }
    
    private func button(type: NavBarButton) -> some View {
        CustomNavLink(destination: type.destination) {
            Circle()
                .stroke(type.strokeColor(scheme: accessibilityManager.fontColor),
                        lineWidth: 10)
                .background {
                    ZStack {
                        type.backgroundColor(scheme: accessibilityManager.fontColor)
                        type.image(scheme: accessibilityManager.fontColor)
                    }
                }
                .mask(Circle())
                .frame(width: 60)
        }
        .contentShape(.circle)
        .buttonStyle(.plain)
    }
}

#Preview {
    MainNavBar()
        .environmentObject(AccessibilityManager())
}
