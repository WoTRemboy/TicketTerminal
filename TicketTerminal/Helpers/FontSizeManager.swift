//
//  FontSizeManager.swift
//  TicketTerminal
//
//  Created by Roman Tverdokhleb on 04/05/2025.
//

import SwiftUI

final class FontSizeManager: ObservableObject {
    @AppStorage(Texts.UserDefaults.Accessibility.fontSizeManager)
    internal var scale: Double = 1.0
}

extension Font {
    static func scalable(size: CGFloat, weight: Font.Weight = .regular, design: Font.Design = .default, scale: CGFloat) -> Font {
        Font.system(size: size * scale, weight: weight, design: design)
    }
}
