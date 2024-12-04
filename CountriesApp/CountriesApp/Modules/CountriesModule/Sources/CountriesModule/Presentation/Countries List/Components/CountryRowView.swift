//
//  CountryRowView.swift
//  CountriesApp
//
//  Created by Baher Tamer on 25/11/2024.
//

import SwiftUI

struct CountryRowView: View {
    // MARK: - Inputs
    let country: Country
    let action: () -> Void
    
    // MARK: - Body
    var body: some View {
        Button(
            action: action,
            label: contentView
        )
        .tint(.primary)
    }
}

// MARK: - Components
extension CountryRowView {
    private func contentView() -> some View {
        HStack {
            countryFlag
            countryName
            Spacer()
            disclosureIcon
        }
    }
    
    private var countryName: some View {
        Text(verbatim: country.name)
            .font(.headline)
    }
    
    private var countryFlag: some View {
        Text(verbatim: country.flagEmoji)
            .font(.largeTitle)
    }
    
    private var disclosureIcon: some View {
        Image(systemName: "chevron.right")
            .font(.footnote)
            .foregroundStyle(.secondary)
    }
}

// MARK: - Preview
#Preview {
    CountryRowView(
        country: Country(name: "Palestine", flagEmoji: "🇵🇸"),
        action: {}
    )
}
