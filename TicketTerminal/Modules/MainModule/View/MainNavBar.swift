//
//  MainNavBar.swift
//  TicketTerminal
//
//  Created by Roman Tverdokhleb on 02/05/2025.
//

import SwiftUI

struct MainNavBar: View {
    internal var body: some View {
        HStack(spacing: 24) {
            logo
            infoButton
            specialButton
            languageButton
            
            Spacer()
            
            loginButton
        }
        .padding([.horizontal, .bottom])
        
        .overlay(alignment: .bottom) {
            Rectangle()
                .frame(maxWidth: .infinity, maxHeight: 1)
                .padding(.horizontal, 66)
        }
    }
    
    private var logo: some View {
        Image.MainPage.logo
            .resizable()
            .frame(width: 100, height: 55)
    }
    
    private var infoButton: some View {
        Button {
            // Info Button Action
        } label: {
            Image.MainPage.info
                .resizable()
                .frame(width: 12, height: 42)
        }
    }
    
    private var specialButton: some View {
        Button {
            // Special Button Action
        } label: {
            Image.MainPage.special
                .resizable()
                .frame(width: 44, height: 16)
        }
    }
    
    private var languageButton: some View {
        Button {
            // Language Button Action
        } label: {
            Image.MainPage.russian
                .resizable()
                .frame(width: 50, height: 33)
        }
    }
    
    private var loginButton: some View {
        Button {
            // Login Button Action
        } label: {
            loginContent
        }
    }
    
    private var loginContent: some View {
        HStack {
            Image.MainPage.person
                .foregroundStyle(Color.SymbolColors.red)
                .font(.system(size: 25))
            
            Text(Texts.MainPage.login)
                .foregroundStyle(Color.LabelColors.labelPrimary)
                .font(.system(size: 20))
        }
        .fontWeight(.medium)
        .frame(width: 260, height: 42)
        
        .background {
            RoundedRectangle(cornerRadius: 50)
                .foregroundStyle(Color.BackColors.backDefault)
                .shadow(
                    color: .black.opacity(0.25),
                    radius: 4,
                    x: 0,
                    y: 4
                )
                .overlay {
                    RoundedRectangle(cornerRadius: 50)
                        .stroke(Color.LabelColors.labelPrimary,
                                lineWidth: 1)
                }
        }
    }
}

#Preview {
    MainNavBar()
}
