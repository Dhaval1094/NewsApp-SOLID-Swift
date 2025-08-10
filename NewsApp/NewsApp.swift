//
//  NewsApp.swift
//  NewsApp
//
//  Created by Dhaval Upendrakumar Trivedi on 11/08/25.
//

import SwiftUI

@main
struct NewsApp: App {
    var body: some Scene {
        WindowGroup {
            let repository = NewsRepository() // swap with MockNewsRepository() for testing
            NewsListView(viewModel: NewsListViewModel(repository: repository))
        }
    }
}
