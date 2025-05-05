//
//  MainView.swift
//  TicketTerminal
//
//  Created by Roman Tverdokhleb on 02/05/2025.
//

import SwiftUI

struct MainView: View {
    
    @EnvironmentObject private var viewModel: MainViewModel
    @EnvironmentObject private var accessibilityManager: AccessibilityManager
    
    internal var body: some View {
        NavigationStack {
            ZStack {
                content
            }
            .background(background)
        }
        .sheet(isPresented: $viewModel.isShowingLanguagePage) {
            Text(Texts.Language.title)
        }
    }
    
    private var background: some View {
        Color.whiteVariant(
            color: .BackColors.backPage,
            scheme: accessibilityManager.fontColor)
        .ignoresSafeArea()
    }
    
    private var content: some View {
        VStack(spacing: 0) {
            MainNavBar()
                .padding([.top, .horizontal])
            AssistantWeatherButtons()
                .padding(.top, 36)
            
            TripScroller()
                .padding(.top, 16)
            
            TicketManagementView()
                .padding(.top, 16)
            
            Spacer()
        }
    }
}

#Preview {
    MainView()
        .environmentObject(MainViewModel())
        .environmentObject(AccessibilityManager())
}
