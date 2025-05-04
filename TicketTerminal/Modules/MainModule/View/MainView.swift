//
//  MainView.swift
//  TicketTerminal
//
//  Created by Roman Tverdokhleb on 02/05/2025.
//

import SwiftUI

struct MainView: View {
    
    @EnvironmentObject private var viewModel: MainViewModel
    
    internal var body: some View {
        NavigationStack {
            ZStack {
                content
            }
            .background(
                background
            )
        }
    }
    
    private var background: some View {
        Color.BackColors.backDefault
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
}
