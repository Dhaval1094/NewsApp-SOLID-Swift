//
//  NewsRowView.swift
//  NewsApp
//
//  Created by Dhaval Upendrakumar Trivedi on 11/08/25.
//

import SwiftUI

struct NewsRowView: View {
    let article: Article

    var body: some View {
        HStack(alignment: .top, spacing: 12) {
            // Thumbnail (if URL available, else placeholder)
            if let imageUrlString = article.image_url, // assuming your Article model has image_url
               let url = URL(string: imageUrlString) {
                AsyncImage(url: url) { phase in
                    switch phase {
                    case .empty:
                        ProgressView()
                            .frame(width: 80, height: 80)
                    case .success(let image):
                        image
                            .resizable()
                            .scaledToFill()
                            .frame(width: 80, height: 80)
                            .clipped()
                            .cornerRadius(8)
                    case .failure(_):
                        Image(systemName: "photo")
                            .resizable()
                            .scaledToFit()
                            .frame(width: 80, height: 80)
                            .foregroundColor(.gray)
                    @unknown default:
                        EmptyView()
                    }
                }
            } else {
                // Placeholder if no image URL
                Image(systemName: "photo")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 80, height: 80)
                    .foregroundColor(.gray)
                    .opacity(0.5)
                    .cornerRadius(8)
            }

            // Text content
            VStack(alignment: .leading, spacing: 6) {
                Text(article.title)
                    .font(.headline)
                    .lineLimit(2)

                if let description = article.description {
                    Text(description)
                        .font(.subheadline)
                        .foregroundColor(.secondary)
                        .lineLimit(5) // show up to 5 lines here
                        .multilineTextAlignment(.leading)
                }
            }
        }
        .padding(.vertical, 8)
    }
}

