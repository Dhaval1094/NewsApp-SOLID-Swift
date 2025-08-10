//
//  MockNewsRepository.swift
//  NewsApp
//
//  Created by Dhaval Upendrakumar Trivedi on 11/08/25.
//

import Foundation

class MockNewsRepository: NewsRepositoryProtocol {
    func fetchNews(completion: @escaping (Result<[Article], Error>) -> Void) {
        let mockArticles = [
            Article(title: "Mock Title 1", description: "Mock description 1", link: nil, source_id: "MockSource", category: ["Tech"], image_url: nil),
            Article(title: "Mock Title 2", description: "Mock description 2", link: nil, source_id: "MockSource", category: ["Health"], image_url: nil)
        ]
        completion(.success(mockArticles))
    }
}
