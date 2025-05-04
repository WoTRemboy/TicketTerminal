//
//  CustomNavBarView.swift
//  TicketTerminal
//
//  Created by Roman Tverdokhleb on 03/05/2025.
//

import SwiftUI

struct CustomNavBarView: View {
    
    @Environment(\.dismiss) private var dismiss
    @EnvironmentObject private var accessibilityManager: AccessibilityManager
    
    private let type: NavBar
    
    init(type: NavBar) {
        self.type = type
    }
    
    internal var body: some View {
        content
            .overlay(alignment: .topLeading) {
                backButton
                    .padding(.leading)
            }
    }
    
    private var content: some View {
        VStack(spacing: 22) {
            type.icon(scheme: accessibilityManager.fontColor)
                .frame(width: 182, height: 108)
            Text(type.title)
                .font(.system(size: 48, weight: .semibold))
                .foregroundStyle(
                    Color.blackVariant(
                        color: .SymbolColors.red,
                        scheme: accessibilityManager.fontColor
                    )
                )
        }
        .frame(maxWidth: .infinity)
    }
    
    private var backButton: some View {
        Button {
            dismiss()
        } label: {
            Image.alterColored(
                normal: Image.NavBar.Back.normal,
                alter: Image.NavBar.Back.black,
                scheme: accessibilityManager.fontColor)
        }
        .buttonStyle(.plain)
    }
}

#Preview {
    CustomNavBarView(type: .about)
        .environmentObject(AccessibilityManager())
}
