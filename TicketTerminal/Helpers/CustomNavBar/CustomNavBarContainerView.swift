//
//  CustomNavBarContainerView.swift
//  TicketTerminal
//
//  Created by Roman Tverdokhleb on 03/05/2025.
//

import SwiftUI

/// A container view that provides a customizable navigation bar at the top,
/// and displays a content view underneath.
struct CustomNavBarContainerView<Content: View>: View {
    
    // MARK: - Properties
    
    /// The content view displayed below the navigation bar.
    private let content: Content
    
    // MARK: - Initializer
    
    /// Initializes the container view with the given content.
    /// - Parameter content: A closure returning the `Content` view to be embedded.
    init(@ViewBuilder content: () -> Content) {
        self.content = content()
    }
    
    // MARK: - Body
    
    internal var body: some View {
        content
            .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .top)
    }
}

// MARK: - Preview

#Preview {
    CustomNavBarContainerView {
        Text("Content")
    }
}
