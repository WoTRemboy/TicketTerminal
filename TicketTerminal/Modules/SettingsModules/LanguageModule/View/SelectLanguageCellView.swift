//
//  SelectLanguageCellView.swift
//  TicketTerminal
//
//  Created by Roman Tverdokhleb on 06/05/2025.
//

import SwiftUI

struct SelectLanguageCellView: View {
    
    @EnvironmentObject private var accessibilityManager: AccessibilityManager
    private let language: Language
    
    init(language: Language) {
        self.language = language
    }
    
    internal var body: some View {
        HStack(spacing: 34) {
            if accessibilityManager.fontColor == .defaultValue {
                language.flag
                    .resizable()
                    .frame(width: 90, height: 60)
                    .clipShape(.rect(cornerRadius: 10))
                    .shadow(
                        color: .LabelColors.labelBlack.opacity(0.25),
                        radius: 5)
            }
            
            Text(language.name)
                .font(.scalable(
                    size: 40,
                    weight: .regular,
                    scale: accessibilityManager.fontScale.scale)
                )
                .foregroundStyle(Color.LabelColors.labelPrimary)
        }
    }
}

#Preview {
    SelectLanguageCellView(language: .languages[0])
        .environmentObject(AccessibilityManager())
}
