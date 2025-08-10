//
//  NewsDetailView.swift
//  NewsApp
//
//  Created by Dhaval Upendrakumar Trivedi on 11/08/25.
//

import Foundation
import SwiftUI

struct NewsDetailView: View {
    let article: Article

    var body: some View {
        VStack(alignment: .leading, spacing: 10) {
            Text(article.title)
                .font(.title)
                .bold()
            if let description = article.description {
                Text(description)
                    .font(.body)
            }
            Spacer()
            if let urlString = article.link, let url = URL(string: urlString) {
                Link("Read full article", destination: url)
                    .foregroundColor(.blue)
            }
        }
        .padding()
        .navigationTitle("Details")
    }
}
