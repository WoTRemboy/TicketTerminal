//
//  CustomNavBarView.swift
//  TicketTerminal
//
//  Created by Roman Tverdokhleb on 03/05/2025.
//

import SwiftUI

struct CustomNavBarView: View {
    
    @Environment(\.dismiss) private var dismiss
    
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
            type.icon
                .frame(width: 182, height: 108)
            Text(type.title)
                .font(.system(size: 48, weight: .semibold))
                .foregroundStyle(Color.SymbolColors.red)
        }
        .frame(maxWidth: .infinity)
        .padding(.top, 20)
    }
    
    private var backButton: some View {
        Button {
            dismiss()
        } label: {
            Image.NavBar.back
        }
        .buttonStyle(.plain)
    }
}

#Preview {
    CustomNavBarView(type: .about)
}
