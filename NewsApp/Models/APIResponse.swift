//
//  APIResponse.swift
//  NewsApp
//
//  Created by Dhaval Upendrakumar Trivedi on 11/08/25.
//

import Foundation

struct APIResponse: Decodable {
    let results: [Article]
}
