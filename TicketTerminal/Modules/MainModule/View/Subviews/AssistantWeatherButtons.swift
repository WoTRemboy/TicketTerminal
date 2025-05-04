//
//  AssistantWeatherButtons.swift
//  TicketTerminal
//
//  Created by Roman Tverdokhleb on 02/05/2025.
//

import SwiftUI

struct AssistantWeatherButtons: View {
    internal var body: some View {
        HStack(spacing: 16) {
            button(type: .assistant)
            button(type: .weather)
        }
    }
    
    private func button(type: DetailedButton) -> some View {
        Button {
            // Button Action
        } label: {
            buttonContent(type: type)
        }
        .buttonStyle(.plain)
    }
    
    private func buttonContent(type: DetailedButton) -> some View {
        VStack(alignment: .leading, spacing: 10) {
            Text(type.title)
                .font(.system(size: 64,
                              weight: .semibold))
            
            Text(type.content)
                .font(.system(size: 30,
                              weight: .medium))
        }
        .foregroundStyle(Color.LabelColors.labelWhite)
        .padding(.horizontal, type == .assistant ? 40 : 21)
        
        .frame(maxWidth: .infinity, alignment: .leading)
        .frame(width: type.frameSize.width,
               height: type.frameSize.height)
        
        .background {
            switch type {
            case .assistant:
                RoundedRectangle(cornerRadius: 20)
                    .foregroundStyle(type.color)
            case .weather:
                RoundedRectangle(cornerRadius: 20)
                    .foregroundStyle(gradient)
            }
        }
    }
    
    private var gradient: LinearGradient {
        LinearGradient(
            gradient: Gradient(
                colors: [Color.SymbolColors.yellow,
                         Color.SymbolColors.blue]
            ),
            startPoint: .topTrailing,
            endPoint: .bottomLeading
        )
    }
}

#Preview {
    AssistantWeatherButtons()
}
