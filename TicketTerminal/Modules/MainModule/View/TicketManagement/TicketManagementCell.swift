//
//  TicketManagementCell.swift
//  TicketTerminal
//
//  Created by Roman Tverdokhleb on 03/05/2025.
//

import SwiftUI

struct TicketManagementCell: View {
    
    @EnvironmentObject private var accessibilityManager: AccessibilityManager
    
    private let type: TicketManagement
    
    init(type: TicketManagement) {
        self.type = type
    }
    
    internal var body: some View {
        Group {
            switch type {
            case .buy, .refund, .recomendations:
                horizontalLayout
                    .padding(.horizontal, 34)
            case .hot:
                hotLayout
                    .padding(.horizontal)
            case .print:
                verticalLayout
                    .padding(.horizontal)
                    .padding(.vertical, 24)
            }
        }
        .frame(maxWidth: .infinity,
               maxHeight: .infinity)
        .background(background)
        .frame(
            width: type.cellFrame.width,
            height: type.cellFrame.height)
    }
    
    private var background: some View {
        Group {
            if type == .hot {
                RoundedRectangle(cornerRadius: 20)
                    .fill(gradient)
            } else {
                shadowBackground
            }
        }
    }
    
    private var shadowBackground: some View {
        RoundedRectangle(cornerRadius: 20)
            .stroke(Color.blackVariant(
                color: .clear,
                scheme: accessibilityManager.fontColor),
                    lineWidth: 3)
            .background {
                RoundedRectangle(cornerRadius: 20)
                    .foregroundStyle(Color.BackColors.backDefault)
                    .shadow(
                        color: Color.alterColor(
                            normal: .LabelColors.labelBlack.opacity(0.25),
                            alter: .clear,
                            scheme: accessibilityManager.fontColor),
                        radius: 4,
                        x: 0,
                        y: 1)
            }
    }
    
    private var horizontalLayout: some View {
        HStack {
            Text(type.title)
                .font(.scalable(
                    size: 40,
                    weight: .medium,
                    scale: accessibilityManager.fontScale.scale)
                )
                .minimumScaleFactor(0.7)
                .lineLimit(1)
            
            Spacer()
            if type.showIcon(scheme: accessibilityManager.fontScale) {
                type.image
                    .frame(
                        width: type.imageFrame.width,
                        height: type.imageFrame.height)
            }
        }
    }
    
    private var verticalLayout: some View {
        VStack(spacing: 28) {
            if type.showIcon(scheme: accessibilityManager.fontScale) {
                type.image
                    .frame(
                        width: type.imageFrame.width,
                        height: type.imageFrame.height)
            }
            
            Text(type.title)
                .font(.scalable(
                    size: 40,
                    weight: .medium,
                    scale: accessibilityManager.fontScale.scale)
                )
                .minimumScaleFactor(0.7)
                .frame(maxWidth: .infinity, alignment: .leading)
        }
    }
    
    private var hotLayout: some View {
        Text(type.title)
            .font(.scalable(
                size: 40,
                weight: .medium,
                scale: accessibilityManager.fontScale.scale)
            )
            .minimumScaleFactor(0.7)
            .foregroundStyle(Color.LabelColors.labelWhite)
            .frame(maxWidth: .infinity, alignment: .leading)
    }
    
    private var gradient: LinearGradient {
        LinearGradient(
            gradient: Gradient(
                colors: [Color.greyVariant(
                            color: .SymbolColors.brown,
                            scheme: accessibilityManager.fontColor),
                         Color.greyVariant(
                            color: .SymbolColors.orange,
                            scheme: accessibilityManager.fontColor)]
            ),
            startPoint: .topLeading,
            endPoint: .bottomTrailing
        )
    }
}

#Preview {
    TicketManagementCell(type: .print)
        .environmentObject(AccessibilityManager())
}
