//
//  PosterImageView.swift
//  Movie-App
//
//  Created by Bahittin on 8.09.2023.
//

import UIKit

class PosterImageView: UIImageView {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        translatesAutoresizingMaskIntoConstraints = false
    }
     
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func downloadImage(movie: MovieResult) {
        guard let url = URL(string: APIURLs.imageURL(posterPath: movie._posterPath)) else { return }
        
        URLSession.shared.dataTask(with: url) { data, _ , error  in
            guard let data = data else { return }

            DispatchQueue.main.async {
                self.image = UIImage(data: data)
            }

        }.resume()
    }
}
