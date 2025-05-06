//
//  SelectLanguageView.swift
//  TicketTerminal
//
//  Created by Roman Tverdokhleb on 06/05/2025.
//

import SwiftUI

struct SelectLanguageView: View {
    
    @EnvironmentObject private var localizationManager: LocalizationManager
    @EnvironmentObject private var accessibilityManager: AccessibilityManager
    
    @Environment(\.dismiss) private var dismiss
    
    internal var body: some View {
        VStack(spacing: 70) {
            title
                .padding(.top, 40)
                .padding(.horizontal)
            
            languageButtons
                .padding([.horizontal, .bottom])
            
            Spacer()
        }
    }
    
    private var title: some View {
        Text(Texts.Language.title.localized)
            .font(.scalable(
                size: 40,
                weight: .medium,
                scale: accessibilityManager.fontScale.scale)
            )
    }
    
    private var languageButtons: some View {
        VStack(alignment: accessibilityManager.fontColor == .defaultValue ? .leading : .center, spacing: 80) {
            ForEach(Language.languages, id: \.id) { language in
                Button {
                    withAnimation(.easeInOut(duration: 0.2)) {
                        localizationManager.changeLanguage(to: language.code)
                        accessibilityManager.updateLayout()
                    }
                    dismiss()
                } label: {
                    SelectLanguageCellView(language: language)
                }
                .buttonStyle(.plain)
            }
        }
    }
}

#Preview {
    SelectLanguageView()
        .environmentObject(LocalizationManager())
        .environmentObject(AccessibilityManager())
}
