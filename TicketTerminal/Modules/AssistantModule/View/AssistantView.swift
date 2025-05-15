//
//  AssistantView.swift
//  TicketTerminal
//
//  Created by Roman Tverdokhleb on 05/05/2025.
//

import SwiftUI

struct AssistantView: View {
    
    @ObservedObject var viewModel: AssistantViewModel = AssistantViewModel()
    @EnvironmentObject private var accessibilityManager: AccessibilityManager
    
    @StateObject var speechRecognizer = SpeechRecognizer()
    @State private var isPulsing = false
    
    private let namespace: Namespace.ID
    
    init(namespace: Namespace.ID) {
        self.namespace = namespace
    }
    
    internal var body: some View {
        VStack(spacing: 0) {
            CustomNavBarView(type: .assistant)
                .padding(.top)
            
            requestStatus
                .padding(.top, 100)
           
            Spacer()
            speakBlock
        }
        .navigationTransition(.zoom(
            sourceID: Texts.NamespaceID.Assistant.zoomTransition,
            in: namespace))
        .background(background)
    }
    
    private var background: some View {
        Color.whiteVariant(
            color: .BackColors.backPage,
            scheme: accessibilityManager.fontColor)
        .ignoresSafeArea()
    }
    
    private var requestStatus: some View {
        VStack(spacing: 40) {
            Text(viewModel.isResponding()
                 ? viewModel.responseText
                 : viewModel.requestStatus.title)
                .font(.scalable(
                    size: 48,
                    weight: .semibold,
                    scale: accessibilityManager.fontScale.scale)
                )
                .foregroundStyle(Color.blackVariant(
                    color: viewModel.isResponding()
                    ? .SymbolColors.red
                    : .LabelColors.labelPrimary,
                    scheme: accessibilityManager.fontColor)
                )
                .id(viewModel.requestStatus)
                .transition(.blurReplace)
            
            viewModel.requestStatus.image
                .id(viewModel.requestStatus)
                .transition(.scale)
                .scaleEffect(isPulsing ? 1.1 : 1.0)
                .opacity(isPulsing ? 0.8 : 1.0)
                .onChange(of: viewModel.requestStatus) {
                    isPulsing = false
                    DispatchQueue.main.async {
                        isPulsing = true
                    }
                }
                .animation(
                    Animation.easeInOut(duration: 1)
                        .repeatForever(autoreverses: true),
                    value: isPulsing
                )
        }
        .animation(.easeInOut(duration: 0.3), value: viewModel.requestStatus)
    }
    
    private var speakBlock: some View {
        HStack(spacing: 22) {
            speakButton
            Text(speechRecognizer.transcript)
                .font(.scalable(
                    size: 40,
                    weight: .semibold,
                    scale: accessibilityManager.fontScale.scale))
                .foregroundStyle(Color.LabelColors.labelWhite)
                .contentTransition(.numericText())
        }
        .frame(maxWidth: .infinity, maxHeight: 200, alignment: .leading)
        .padding(.horizontal, 20)
        .background {
            RoundedRectangle(cornerRadius: 40)
                .fill(Color.greyVariant(
                    color: .SymbolColors.red,
                    scheme: accessibilityManager.fontColor)
                )
        }
        .padding(.horizontal)
        .background(alignment: .bottom) {
            bottomRectangle
                .offset(y: 30)
        }
    }
    
    private var bottomRectangle: some View {
        Rectangle()
            .fill(Color.whiteVariant(
                color: .SymbolColors.lightGrey,
                scheme: accessibilityManager.fontColor))
            .frame(maxWidth: .infinity, maxHeight: 160)
    }
    
    private var speakButton: some View {
        Button {
            endRecording()
        } label: {
            Image.alterColored(
                normal: Image.Assistant.Microphone.normal,
                alter: Image.Assistant.Microphone.black,
                scheme: accessibilityManager.fontColor)
            
        }
        .buttonStyle(.plain)
        .simultaneousGesture(
            LongPressGesture(minimumDuration: 0.1).onEnded { _ in
                startRecording()
            })
    }
    
    private func startRecording() {
        print("Debug: Start transcription")
        speechRecognizer.resetTranscript()
        speechRecognizer.startTranscribing()
        viewModel.setStatus(.listening)
    }
    
    private func endRecording() {
        speechRecognizer.stopTranscribing()
        print("Stopped:", speechRecognizer.transcript)
        viewModel.sendMessage(message: speechRecognizer.transcript)
    }
}

#Preview {
    AssistantView(namespace: Namespace().wrappedValue)
        .environmentObject(AccessibilityManager())
        .environmentObject(AssistantViewModel())
}
