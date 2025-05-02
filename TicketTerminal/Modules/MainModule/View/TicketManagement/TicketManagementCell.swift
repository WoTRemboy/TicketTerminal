//
//  TicketManagementCell.swift
//  TicketTerminal
//
//  Created by Roman Tverdokhleb on 03/05/2025.
//

import SwiftUI

struct TicketManagementCell: View {
    
    private let type: TicketManagement
    
    init(type: TicketManagement) {
        self.type = type
    }
    
    internal var body: some View {
        Button {
            // Ticket Management Action
        } label: {
            content
        }
        .buttonStyle(.plain)
    }
    
    private var content: some View {
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
        
        .background {
            background
                .shadow(
                    color: .LabelColors.labelBlack.opacity(0.2),
                    radius: 4,
                    x: 0,
                    y: 1)
        }
        .frame(
            width: type.cellFrame.width,
            height: type.cellFrame.height)
    }
    
    private var horizontalLayout: some View {
        HStack {
            Text(type.title)
                .font(.system(size: 40, weight: .medium))
            
            Spacer()
            type.image
                .frame(
                    width: type.imageFrame.width,
                    height: type.imageFrame.height)
        }
    }
    
    private var verticalLayout: some View {
        VStack {
            type.image
                .frame(
                    width: type.imageFrame.width,
                    height: type.imageFrame.height)
            
            Spacer()
            Text(type.title)
                .font(.system(size: 40, weight: .medium))
                .frame(maxWidth: .infinity, alignment: .leading)
        }
    }
    
    private var hotLayout: some View {
        Text(type.title)
            .font(.system(size: 40, weight: .medium))
            .foregroundStyle(Color.LabelColors.labelWhite)
            .frame(maxWidth: .infinity, alignment: .leading)
    }
    
    private var background: some View {
        Group {
            if type == .hot {
                RoundedRectangle(cornerRadius: 20)
                    .fill(gradient)
            } else {
                RoundedRectangle(cornerRadius: 20)
                    .fill(Color.BackColors.backDefault)
            }
        }
    }
    
    private var gradient: LinearGradient {
        LinearGradient(
            gradient: Gradient(
                colors: [Color.SymbolColors.brown,
                    Color.SymbolColors.orange]
            ),
            startPoint: .topLeading,
            endPoint: .bottomTrailing
        )
    }
}

#Preview {
    TicketManagementCell(type: .print)
}
