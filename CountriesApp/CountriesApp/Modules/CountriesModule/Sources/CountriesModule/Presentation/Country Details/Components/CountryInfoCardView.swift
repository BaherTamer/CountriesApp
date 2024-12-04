//
//  CountryInfoCardView.swift
//  CountriesApp
//
//  Created by Baher Tamer on 03/12/2024.
//

import SwiftUI

struct CountryInfoCardView<Content: View>: View {
    // MARK: - Inputs
    let title: LocalizedStringKey
    let systemImage: String
    @ViewBuilder let content: Content
    
    // MARK: - Body
    var body: some View {
        GroupBox {
            content
        } label: {
            Label(title, systemImage: systemImage)
        }
    }
}

// MARK: - Preview
#Preview {
    CountryInfoCardView(
        title: "Area",
        systemImage: "arrow.up.and.down.and.arrow.left.and.right"
    ) {}
}
