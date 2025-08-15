//
//  NetworkManager.swift
//  NewsApp
//
//  Created by Dhaval Upendrakumar Trivedi on 11/08/25.
//

import Foundation

final class NetworkManager: NetworkServiceProtocol {
    func request(url: URL, completion: @escaping (Result<Data, Error>) -> Void) {
        URLSession.shared.dataTask(with: url) { data, resp, err in
            if let err = err {
                completion(.failure(err))
                return
            }
            guard let data = data else {
                completion(.failure(NetworkError.noData))
                return
            }
            completion(.success(data))
        }.resume()
    }
}

enum NetworkError: Error {
    case noData
}
