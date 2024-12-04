//
//  CountryFlagView.swift
//  CountriesApp
//
//  Created by Baher Tamer on 03/12/2024.
//

import SwiftUI

struct CountryFlagView: View {
    // MARK: - Inputs
    let urlString: String?
    
    // MARK: - Variables
    private var flagURL: URL? {
        URL(string: urlString ?? "")
    }
    
    // MARK: - Body
    var body: some View {
        if let flagURL {
            asyncImage(with: flagURL)
        }
    }
}

// MARK: - Components
extension CountryFlagView {
    private func asyncImage(with url: URL) -> some View {
        AsyncImage(url: url) { phase in
            switch phase {
            case .success(let image):
                loadImage(image)
            case .failure(_):
                placeholderImage
            default:
                progressView
            }
        }
    }
    
    private func loadImage(_ fetchedImage: Image) -> some View {
        fetchedImage
            .resizable()
            .scaledToFit()
    }
    
    private var placeholderImage: some View {
        Image(.placeholder)
            .resizable()
            .scaledToFill()
    }
    
    private var progressView: some View {
        placeholderImage // This used for resizable modifier
            .overlay(.white)
            .overlay { ProgressView() }
    }
}

// MARK: - Preview
#Preview {
    CountryFlagView(urlString: "https://mainfacts.com/media/images/coats_of_arms/ps.png")
}
