//
//  NewsAPIService.swift
//  NewsApp
//
//  Created by Dhaval Upendrakumar Trivedi on 11/08/25.
//

import Foundation

class NewsAPIService {
    private let networkService: NetworkServiceProtocol
    private let apiKey = "API_KEY"

    init(networkService: NetworkServiceProtocol = NetworkManager()) {
        self.networkService = networkService
    }

    func fetchNews(completion: @escaping (Result<[Article], Error>) -> Void) {
        guard let url = URL(string: "https://newsdata.io/api/1/news?apikey=\(apiKey)&language=en") else {
            completion(.failure(NSError(domain: "Invalid URL", code: -1)))
            return
        }

        networkService.request(url: url) { result in
            switch result {
            case .success(let data):
                do {
                    let apiResponse = try JSONDecoder().decode(APIResponse.self, from: data)
                    completion(.success(apiResponse.results))
                } catch {
                    completion(.failure(error))
                }
            case .failure(let error):
                completion(.failure(error))
            }
        }
    }
}
