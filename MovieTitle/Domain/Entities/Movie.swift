//
//  PopularMovie.swift
//  MovieTitle
//
//  Created by Abdullah on 17/09/2022.
//

import Foundation

// MARK: - MovieRespose
struct MovieResponse: Codable {
    let page: Int?
    let results: [Movie]?
    let totalPages, totalResults: Int?

    enum CodingKeys: String, CodingKey {
        case page, results
        case totalPages = "total_pages"
        case totalResults = "total_results"
    }
}

// MARK: - MovieResult
struct Movie: Codable {
    let id: Int?
    let overview, title, posterPath: String?
    
    enum CodingKeys: String, CodingKey {
        case id
        case overview, title
        case posterPath = "poster_path"
    }
}
