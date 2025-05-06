//
//  Background.swift
//  TicketTerminal
//
//  Created by Roman Tverdokhleb on 05/05/2025.
//

import SwiftUI

struct Background: View {
    
    private let radius: CGFloat
    private let scheme: AccessibilityFontColor
    
    init(radius: CGFloat, scheme: AccessibilityFontColor) {
        self.radius = radius
        self.scheme = scheme
    }
    
    internal var body: some View {
        RoundedRectangle(cornerRadius: radius)
            .stroke(Color.blackVariant(
                color: .clear,
                scheme: scheme),
                    lineWidth: 3)
            .background(background)
    }
    
    private var background: some View {
        RoundedRectangle(cornerRadius: radius)
            .fill(Color.BackColors.backDefault)
            .shadow(
                color: Color.alterColor(
                    normal: .LabelColors.labelBlack.opacity(0.25),
                    alter: .clear,
                    scheme: scheme),
                radius: 4,
                x: 0,
                y: 1)
    }
}

#Preview {
    Background(radius: 40, scheme: .defaultValue)
}
