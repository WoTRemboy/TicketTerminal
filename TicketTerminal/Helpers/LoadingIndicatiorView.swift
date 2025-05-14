//
//  LoadingIndicatiorView.swift
//  TicketTerminal
//
//  Created by Roman Tverdokhleb on 11/05/2025.
//

import SwiftUI

struct LoadingIndicatorView: View {
    @EnvironmentObject private var accessibilityManager: AccessibilityManager
    @State private var animate = false

    internal var body: some View {
        HStack(spacing: 16) {
            ForEach(0..<3) { index in
                circle(index: index)
            }
        }
        .onAppear {
            animate = true
        }
    }
    
    private func circle(index: Int) -> some View {
        Circle()
            .fill(Color.blackVariant(
                color: .SymbolColors.red,
                scheme: accessibilityManager.fontColor))
            .frame(width: 50, height: 50)
            .scaleEffect(animate ? 0.5 : 1.0)
            .opacity(animate ? 0.3 : 1.0)
            .animation(
                Animation.easeInOut(duration: 0.6)
                    .repeatForever(autoreverses: true)
                    .delay(Double(index) * 0.2),
                value: animate
            )
    }
}

#Preview {
    LoadingIndicatorView()
        .environmentObject(AccessibilityManager())
}
