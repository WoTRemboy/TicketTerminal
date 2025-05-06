//
//  AboutAppView.swift
//  TicketTerminal
//
//  Created by Roman Tverdokhleb on 03/05/2025.
//

import SwiftUI
import MapKit

struct AboutAppView: View {
    
    @EnvironmentObject private var accessibilityManager: AccessibilityManager
    
    internal var body: some View {
        VStack(spacing: 0) {
            CustomNavBarView(type: .about)
                .padding(.top)
            
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
        Color.whiteVariant(
            color: .BackColors.backPage,
            scheme: accessibilityManager.fontColor)
        .ignoresSafeArea()
    }
    
    private var versionNumber: some View {
        HStack(spacing: 24) {
            AboutAppCellView(type: .version)
                .padding(.leading, -90)
            AboutAppCellView(type: .number)
                .padding(.trailing, -90)
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
            
            Marker(Texts.About.headquaters.localized,
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
        .environmentObject(AboutAppViewModel())
        .environmentObject(AccessibilityManager())
}
