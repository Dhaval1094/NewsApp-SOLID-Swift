//
//  Article.swift
//  NewsApp
//
//  Created by Dhaval Upendrakumar Trivedi on 11/08/25.
//

import Foundation

struct Article: Identifiable, Decodable {
    let id = UUID()
    let title: String
    let description: String?
    let link: String?
    let source_id: String?
    let category: [String]?
    let image_url: String?    
}
