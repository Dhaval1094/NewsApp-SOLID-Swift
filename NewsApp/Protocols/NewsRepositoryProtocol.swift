//
//  NewsRepositoryProtocol.swift
//  NewsApp
//
//  Created by Dhaval Upendrakumar Trivedi on 11/08/25.
//

import Foundation

protocol NewsRepositoryProtocol {
    func fetchNews(completion: @escaping (Result<[Article], Error>) -> Void)
}
