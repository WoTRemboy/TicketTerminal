//
//  AboutAppCellView.swift
//  TicketTerminal
//
//  Created by Roman Tverdokhleb on 03/05/2025.
//

import SwiftUI

struct AboutAppCellView: View {
    
    private let type: AboutAppCell
    
    init(type: AboutAppCell) {
        self.type = type
    }
    
    internal var body: some View {
        Button {
            // Button Action
        } label: {
            content
        }
        .buttonStyle(.plain)
        
        .background {
            RoundedRectangle(cornerRadius: 50)
                .foregroundStyle(Color.BackColors.backDefault)
                .shadow(
                    color: .LabelColors.labelBlack.opacity(0.25),
                    radius: 4,
                    x: 0,
                    y: 1)
        }
    }
    
    private var content: some View {
        VStack(alignment: alignment, spacing: 12) {
            Text(type.title)
                .font(.system(size: 40, weight: .regular))
            
            if type != .info {
                Text(type.content)
                    .font(.system(size: type == .address ? 30 : 50,
                                  weight: type == .address ? .regular : .medium))
            }
        }
        .padding(.leading, type.paddingValue)
        .frame(
            width: type.frameSize.width,
            height: type.frameSize.height,
            alignment: .leading)
        .contentShape(Rectangle())
    }
    
    private var alignment: HorizontalAlignment {
        switch type {
        case .version, .number:
                .center
        case .info, .address:
                .leading
        }
    }
}

#Preview {
    AboutAppCellView(type: .version)
}
