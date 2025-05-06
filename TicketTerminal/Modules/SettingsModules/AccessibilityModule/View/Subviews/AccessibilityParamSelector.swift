//
//  AccessibilityParamSelector.swift
//  TicketTerminal
//
//  Created by Roman Tverdokhleb on 04/05/2025.
//

import SwiftUI

struct AccessibilityParamSelector: View {
    
    @EnvironmentObject private var viewModel: AccessibilityViewModel
    @EnvironmentObject private var accessibilityManager: AccessibilityManager
    @Namespace private var namespace
    
    private let type: AccessibilityParam
    
    init(type: AccessibilityParam) {
        self.type = type
    }
    
    internal var body: some View {
        switch type {
        case .fontColor:
            fontColorSelector
        case .fontSize:
            fontSizeSelector
        case .imparedMode:
            imparedModeSelector
        case .screenReader:
            screenReaderSelector
        }
    }
    
    private var fontColorSelector: some View {
        HStack(alignment: .bottom, spacing: 110) {
            ForEach(AccessibilityFontColor.allCases, id: \.self) { type in
                Button {
                    viewModel.setFontColor(type) {
                        accessibilityManager.setFontColor(to: type)
                    }
                } label: {
                    AccessibilityParamSelectorCell(
                        title: type.title,
                        icon: type.icon,
                        selected: viewModel.isSelectedFontColor(type),
                        transitionID: Texts.NamespaceID.Accessibility.fontColor,
                        namespace: namespace
                    )
                }
            }
        }
        .buttonStyle(.plain)
    }
    
    private var fontSizeSelector: some View {
        HStack(alignment: .bottom, spacing: 26) {
            ForEach(AccessibilityFontSize.allCases, id: \.self) { type in
                Button {
                    viewModel.setFontSize(type) {
                        accessibilityManager.setFontSize(to: type)
                    }
                } label: {
                    AccessibilityParamSelectorCell(
                        icon: type.icon,
                        selected: viewModel.isSelectedFontSize(type),
                        transitionID: Texts.NamespaceID.Accessibility.fontSize,
                        namespace: namespace
                    )
                }
            }
        }
        .buttonStyle(.plain)
    }
    
    private var imparedModeSelector: some View {
        HStack(alignment: .bottom, spacing: 145) {
            ForEach(AccessibilityImparedMode.allCases, id: \.self) { type in
                Button {
                    viewModel.setImparedMode(type)
                } label: {
                    AccessibilityParamSelectorCell(
                        icon: type.icon(scheme: accessibilityManager.fontColor),
                        selected: viewModel.isSelectedImparedMode(type),
                        transitionID: Texts.NamespaceID.Accessibility.imparedMode,
                        namespace: namespace
                    )
                }
            }
        }
        .buttonStyle(.plain)
    }
    
    private var screenReaderSelector: some View {
        HStack(alignment: .bottom, spacing: 145) {
            ForEach(AccessibilityScreenReader.allCases, id: \.self) { type in
                Button {
                    viewModel.setScreenReader(type)
                } label: {
                    AccessibilityParamSelectorCell(
                        icon: type.icon(scheme: accessibilityManager.fontColor),
                        selected: viewModel.isSelectedScreenReader(type),
                        transitionID: Texts.NamespaceID.Accessibility.screenReader,
                        namespace: namespace
                    )
                }
            }
        }
        .buttonStyle(.plain)
    }
}

#Preview {
    AccessibilityParamSelector(type: .screenReader)
        .environmentObject(AccessibilityViewModel())
        .environmentObject(AccessibilityManager())
}
