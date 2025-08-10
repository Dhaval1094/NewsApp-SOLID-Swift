//
//  NetworkServiceProtocol.swift
//  NewsApp
//
//  Created by Dhaval Upendrakumar Trivedi on 11/08/25.
//

import Foundation

protocol NetworkServiceProtocol {
    func request(url: URL, completion: @escaping (Result<Data, Error>) -> Void)
}
