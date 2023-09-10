//
//  DetailScreen.swift
//  Movie-App
//
//  Created by Bahittin on 10.09.2023.
//

import UIKit

class DetailScreen: UIViewController {

    let movie: MovieResult
    
    init(movie: MovieResult) {
        self.movie = movie
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        view.backgroundColor = .white
        print(movie.title ?? "")
    }
}
