//
//  CountryInfoView.swift
//  CountriesApp
//
//  Created by Baher Tamer on 03/12/2024.
//

import SwiftUI

struct CountryInfoView: View {
    // MARK: - Input
    let country: Country?
    
    // MARK: - Variables
    private static let spacing: CGFloat = 16
    private let columns: [GridItem] = Array(
        repeating: GridItem(.flexible(), spacing: Self.spacing),
        count: 2
    )
    
    // MARK: - Body
    var body: some View {
        VStack(spacing: Self.spacing) {
            LazyVGrid(columns: columns, spacing: Self.spacing)  {
                countryArea
                countryPopulation
                countryRegion
                countryCode
            }
            
            countryCapital
            countryLanguages
            countryCurrencies
        }
    }
}

// MARK: - SubViews
extension CountryInfoView {
    @ViewBuilder
    private var countryArea: some View {
        if let area = country?.area {
            CountryInfoCardView(
                title: "Area",
                systemImage: "arrow.up.and.down.and.arrow.left.and.right"
            ) {
                numberFormattedText(area)
            }
        }
    }
    
    @ViewBuilder
    private var countryPopulation: some View {
        if let population = country?.population {
            CountryInfoCardView(
                title: "Population",
                systemImage: "person.3.fill"
            ) {
                numberFormattedText(population)
            }
        }
    }
    
    @ViewBuilder
    private var countryRegion: some View {
        if let region = country?.region {
            CountryInfoCardView(
                title: "Region",
                systemImage: "map.fill"
            ) {
                contentText(region)
            }
        }
    }
    
    @ViewBuilder
    private var countryCode: some View {
        if let code = country?.code {
            CountryInfoCardView(
                title: "ISO Code",
                systemImage: "globe"
            ) {
                contentText(code)
            }
        }
    }
    
    @ViewBuilder
    private var countryCapital: some View {
        if let capital = country?.capitalFormatted {
            CountryInfoCardView(
                title: "Capital",
                systemImage: "mappin.and.ellipse"
            ) {
                contentText(capital)
            }
        }
    }
    
    @ViewBuilder
    private var countryLanguages: some View {
        if let languages = country?.languagesFormatted {
            CountryInfoCardView(
                title: "Languages",
                systemImage: "speaker.wave.2.bubble.fill"
            ) {
                contentText(languages)
            }
        }
    }
    
    @ViewBuilder
    private var countryCurrencies: some View {
        if let currencies = country?.currenciesFormatted {
            CountryInfoCardView(
                title: "Currencies",
                systemImage: "banknote.fill"
            ) {
                contentText(currencies)
            }
        }
    }
}

// MARK: - Private Helpers
extension CountryInfoView {
    private func numberFormattedText(_ number: Int) -> some View {
        Text(number, format: .number.grouping(.automatic))
            .frame(maxWidth: .infinity, alignment: .leading)
    }
    
    private func contentText(_ text: String) -> some View {
        Text(verbatim: text)
            .frame(maxWidth: .infinity, alignment: .leading)
    }
}

// MARK: - Preview
#Preview {
    CountryInfoView(
        country: Country(name: "Palestine")
    )
}
