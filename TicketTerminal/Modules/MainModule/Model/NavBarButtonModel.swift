//
//  NavBarButtonModel.swift
//  TicketTerminal
//
//  Created by Roman Tverdokhleb on 02/05/2025.
//

import SwiftUI

enum NavBarButton: CaseIterable {
    case info
    case special
    case language
    
    static internal var allCases: [NavBarButton] {
        [.info, .special]
    }
    
    internal func image(scheme: AccessibilityFontColor) -> Image {
        switch self {
        case .info:
            Image.MainPage.Info.normal
        case .special:
            Image.alterColored(
                normal: Image.MainPage.Special.normal,
                alter: Image.MainPage.Special.black,
                scheme: scheme)
        case .language:
            Image.alterColored(
                normal: Image.MainPage.Language.normal,
                alter: Image.MainPage.Language.black,
                scheme: scheme)
        }
    }
    
    @ViewBuilder
    internal var destination: some View {
        switch self {
        case .info:
            AboutAppView()
                .environmentObject(AboutAppViewModel())
        case .special:
            AccessibilityView()
                .environmentObject(AccessibilityViewModel())
        case .language:
            AccessibilityView()
        }
    }
    
    internal func backgroundColor(scheme: AccessibilityFontColor) -> Color {
        switch self {
        case .info:
            Color.greyVariant(
                color: Color.SymbolColors.red,
                scheme: scheme)
        case .special:
            Color.alterColor(
                normal: Color.SymbolColors.red,
                alter: Color.SymbolColors.lightGrey,
                scheme: scheme)
        case .language:
            Color.clear
        }
    }
    
    internal func strokeColor(scheme: AccessibilityFontColor) -> Color {
        switch self {
        case .info:
            Color.greyVariant(
                color: Color.SymbolColors.red,
                scheme: scheme)
        case .special:
            Color.SymbolColors.red
        case .language:
            Color.alterColor(
                normal: Color.SymbolColors.red,
                alter: Color.clear,
                scheme: scheme)
        }
    }
}
