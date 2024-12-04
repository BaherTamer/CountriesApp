//
//  EmptyScreen.swift
//  CountriesApp
//
//  Created by Baher Tamer on 25/11/2024.
//

import SwiftUI

public struct EmptyContent {
    var icon: String
    var title: String.LocalizationValue
    
    public init(icon: String, title: String.LocalizationValue) {
        self.icon = icon
        self.title = title
    }
}

public struct EmptyScreen: View {
    // MARK: - Inputs
    private let content: EmptyContent
    
    // MARK: - Life Cycle
    public init(content: EmptyContent) {
        self.content = content
    }
    
    // MARK: - Body
    public var body: some View {
        ContentUnavailableView(
            label: contentLabel
        )
    }
}

// MARK: - Components
extension EmptyScreen {
    private func contentLabel() -> some View {
        Label(
            String(localized: content.title),
            systemImage: content.icon
        )
    }
}

// MARK: - Preview
#Preview {
    EmptyScreen(
        content: EmptyContent(
            icon: "globe.europe.africa.fill",
            title: "No countries was found"
        )
    )
}
