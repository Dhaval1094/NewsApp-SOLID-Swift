//
//  NewsListView.swift
//  NewsApp
//
//  Created by Dhaval Upendrakumar Trivedi on 11/08/25.
//

import SwiftUI

struct NewsListView: View {
    @StateObject var viewModel: NewsListViewModel

    var body: some View {
        NavigationView {
            Group {
                if viewModel.isLoading {
                    ProgressView("Loading...")
                } else if let error = viewModel.errorMessage {
                    Text("Error: \(error)")
                        .foregroundColor(.red)
                        .multilineTextAlignment(.center)
                        .padding()
                } else {
                    List(viewModel.articles) { article in
                        NavigationLink(destination: NewsDetailView(article: article)) {
                            NewsRowView(article: article)
                        }
                    }
                }
            }
            .navigationTitle("News")
            .onAppear {
                viewModel.fetchNews()
            }
        }
    }
}
