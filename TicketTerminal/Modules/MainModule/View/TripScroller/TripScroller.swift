//
//  TripScroller.swift
//  TicketTerminal
//
//  Created by Roman Tverdokhleb on 02/05/2025.
//

import SwiftUI

struct TripScroller: View {
    
    @State private var currentIndex = 0
    @State private var timer: Timer?
    
    internal var body: some View {
        TabView(selection: $currentIndex) {
            ForEach(Array(Trip.allCases.enumerated()), id: \.offset) { index, trip in
                CustomNavLink(
                    destination: TripsView(selectedTrip: trip)) {
                        TripCell(trip: trip)
                    }
                    .tag(index)
                    .buttonStyle(.plain)
            }
        }
        .frame(height: 279)
        .tabViewStyle(.page(indexDisplayMode: .never))
        .onAppear {
            startTimer()
        }
        .onDisappear {
            stopTimer()
        }
        .gesture(
            DragGesture()
                .onChanged { _ in
                    stopTimer()
                }
                .onEnded { _ in
                    startTimer()
                }
        )
        
        .overlay(alignment: .bottom) {
            progressCircles
        }
    }
    
    private var progressCircles: some View {
        HStack(spacing: 48) {
            ForEach(0..<Trip.allCases.count, id: \.self) { step in
                Group {
                    if step == currentIndex {
                        RoundedRectangle(cornerRadius: 5)
                            .foregroundStyle(Color.LabelColors.labelWhite)
                            .transition(.scale)
                        
                    } else {
                        RoundedRectangle(cornerRadius: 5)
                            .foregroundStyle(Color.LabelColors.labelWhite.opacity(0.2))
                            .transition(.scale)
                        
                    }
                }
                .frame(width: 60, height: 10)
                .contentShape(Rectangle())
                .onTapGesture {
                    withAnimation(.easeInOut) {
                        currentIndex = step
                    }
                }
            }
        }
        .animation(.easeInOut, value: currentIndex)
        .padding(.bottom, 8)
    }
    
    private func startTimer() {
        stopTimer()
        timer = Timer.scheduledTimer(withTimeInterval: 5, repeats: true) { _ in
            withAnimation {
                currentIndex = (currentIndex + 1) % Trip.allCases.count
            }
        }
    }
    
    private func stopTimer() {
        timer?.invalidate()
        timer = nil
    }
    
}
#Preview {
    TripScroller()
        .environmentObject(AccessibilityManager())
}
