//
//  NewsListViewModel.swift
//  NewsApp
//
//  Created by Dhaval Upendrakumar Trivedi on 11/08/25.
//

import Foundation
import Combine

class NewsListViewModel: ObservableObject {
    @Published var articles: [Article] = []
    @Published var isLoading = false
    @Published var errorMessage: String?

    private let repository: NewsRepositoryProtocol

    init(repository: NewsRepositoryProtocol) {
        self.repository = repository
    }

    func fetchNews() {
        isLoading = true
        errorMessage = nil
        repository.fetchNews { [weak self] result in
            DispatchQueue.main.async {
                self?.isLoading = false
                switch result {
                case .success(let articles):
                    self?.articles = articles
                case .failure(let error):
                    self?.errorMessage = error.localizedDescription
                }
            }
        }
    }
}
