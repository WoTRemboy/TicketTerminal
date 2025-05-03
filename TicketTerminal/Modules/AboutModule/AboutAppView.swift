//
//  AboutAppView.swift
//  TicketTerminal
//
//  Created by Roman Tverdokhleb on 03/05/2025.
//

import SwiftUI
import MapKit

struct AboutAppView: View {
    internal var body: some View {
        VStack(spacing: 0) {
            CustomNavBarView(type: .about, onDismiss: {})
            
            versionNumber
                .padding(.top, 40)
            infoAdress
                .padding(.top, 24)
            
            map
                .padding(24)
            
            
            Spacer()
        }
        .background(background)
    }
    
    private var background: some View {
        Color.BackColors.backDefault
            .ignoresSafeArea()
    }
    
    private var versionNumber: some View {
        HStack(spacing: 24) {
            AboutAppCellView(type: .version)
            AboutAppCellView(type: .number)
        }
    }
    
    private var infoAdress: some View {
        VStack(spacing: 24) {
            AboutAppCellView(type: .info)
            AboutAppCellView(type: .address)
        }
        .padding(.leading, -90)
    }
    
    private var map: some View {
        Map {
            MapCircle(center: .radius, radius: CLLocationDistance(100))
                .foregroundStyle(Color.SymbolColors.red.opacity(0.20))
                .mapOverlayLevel(level: .aboveLabels)
            
            Marker(Texts.About.headquaters,
                   coordinate: .headquaters)
            .tint(Color.SymbolColors.brown)
            .tag(1)
        }
        .clipShape(.rect(cornerRadius: 20))
        .frame(maxWidth: .infinity)
    }
}

#Preview {
    AboutAppView()
}
