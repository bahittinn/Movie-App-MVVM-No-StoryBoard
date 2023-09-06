//
//  MovieService.swift
//  Movie-App
//
//  Created by Bahittin on 6.09.2023.
//

import Foundation

class MovieService {
    
    func downloadMovies() {
        guard let url = URL(string: API_URL) else { return }
        
        NetworkManager.shared.download(url: url) { [weak self] result in
            guard let self = self else { return }
            
            switch result {
            case .success(let data):
                self.handleWithData(data)
            case .failure(let error):
                self.handleWithError(error)
            }
        }
        
    }
    
    private func handleWithError(_ error: Error) {
        print(error.localizedDescription)
    }
    
    private func handleWithData(_ data: Data) {
        print(data)
    }
        
}
