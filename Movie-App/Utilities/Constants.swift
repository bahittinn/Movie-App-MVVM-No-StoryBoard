//
//  Constants.swift
//  Movie-App
//
//  Created by Bahittin on 6.09.2023.
//

import Foundation

let API_TOKEN = "eyJhbGciOiJIUzI1NiJ9.eyJhdWQiOiIzZjFjNzlmMDY5YjM4ZDI1NmMzYmExOTY2MDlkNDQ3ZCIsInN1YiI6IjY0Zjc2N2I1MWI3MjJjMDEzYTI1NjQyZSIsInNjb3BlcyI6WyJhcGlfcmVhZCJdLCJ2ZXJzaW9uIjoxfQ.vgMLzRMlTPrFzjc1HJqaphrO4UMJaMCvCMfkpFr1Xls"

let API_URL = "https://api.themoviedb.org/3/movie/popular?language=en-US&page=1"

enum APIURLs {
    static func movies(page: Int) -> String {
        "https://api.themoviedb.org/3/movie/popular?language=en-US&page=\(page)"
    }
}

