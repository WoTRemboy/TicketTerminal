//
//  MainView.swift
//  TicketTerminal
//
//  Created by Roman Tverdokhleb on 02/05/2025.
//

import SwiftUI

struct MainView: View {
    internal var body: some View {
        ZStack {
            content
        }
        .background(
            background
        )
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
                .padding(.top, 44)
            
            TripScroll()
                .padding(.top, 10)
            
            Spacer()
        }
    }
}

#Preview {
    MainView()
}
