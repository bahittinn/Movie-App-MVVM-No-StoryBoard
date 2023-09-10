//
//  Movie.swift
//  Movie-App
//
//  Created by Bahittin on 6.09.2023.
//

import Foundation

struct Movie: Codable {
    let results: [MovieResult]?
}

struct MovieResult: Codable {
    let id: Int?
    let posterPath: String?
    let overview, releaseDate,title : String?
    
    
    enum CodingKeys: String, CodingKey {
        case id
        case posterPath = "poster_path"
        case overview, title
        case releaseDate = "release_date"
    }
    
    var _id: Int {
        id ?? Int.min
    }
    
    var _posterPath: String {
        posterPath ?? ""
    }
}
