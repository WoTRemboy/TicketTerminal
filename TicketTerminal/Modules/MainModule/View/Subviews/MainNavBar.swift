//
//  MainNavBar.swift
//  TicketTerminal
//
//  Created by Roman Tverdokhleb on 02/05/2025.
//

import SwiftUI

struct MainNavBar: View {
    
    @EnvironmentObject private var viewModel: MainViewModel
    @EnvironmentObject private var accessibilityManager: AccessibilityManager
    
    internal var body: some View {
        HStack(spacing: 45) {
            logo
            Spacer()
            
            ForEach(NavBarButton.allCases, id: \.self) { type in
                button(type: type)
            }
            languageButton
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
            buttonContent(type: type)
        }
        .contentShape(.circle)
        .buttonStyle(.plain)
    }
    
    private var languageButton: some View {
        Button {
            viewModel.isShowingLanguagePageToggle()
        } label: {
            buttonContent(type: .language)
        }
        .contentShape(.circle)
        .buttonStyle(.plain)
    }
    
    private func buttonContent(type: NavBarButton) -> some View {
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
}

#Preview {
    MainNavBar()
        .environmentObject(MainViewModel())
        .environmentObject(AccessibilityManager())
}
