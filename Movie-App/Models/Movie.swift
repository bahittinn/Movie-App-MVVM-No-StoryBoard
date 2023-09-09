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
    
    enum CodingKeys: String, CodingKey {
        case id
        case posterPath = "poster_path"
    }
    
    var _id: Int {
        id ?? Int.min
    }
    
    var _posterPath: String {
        posterPath ?? ""
    }
}
