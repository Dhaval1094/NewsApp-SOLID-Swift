//
//  NewsRepository.swift
//  NewsApp
//
//  Created by Dhaval Upendrakumar Trivedi on 11/08/25.
//

import Foundation

class NewsRepository: NewsRepositoryProtocol {
    private let apiService: NewsAPIService

    init(apiService: NewsAPIService = NewsAPIService()) {
        self.apiService = apiService
    }

    func fetchNews(completion: @escaping (Result<[Article], Error>) -> Void) {
        apiService.fetchNews(completion: completion)
    }
}
