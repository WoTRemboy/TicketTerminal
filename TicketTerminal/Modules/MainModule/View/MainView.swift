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
    
    @Namespace private var namespace
    
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
        .fullScreenCover(isPresented: $viewModel.isShowingAssistantPage) {
            AssistantView(namespace: namespace)
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
            AssistantWeatherButtons(namespace: namespace)
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
