//
//  DetailScreen.swift
//  Movie-App
//
//  Created by Bahittin on 10.09.2023.
//

import UIKit

protocol DetailScreenInterface: AnyObject {
    
}

class DetailScreen: UIViewController {

    private let movie: MovieResult
    
    private let viewModel = DetailViewModel()
    
    init(movie: MovieResult) {
        self.movie = movie
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        viewModel.view = self
        viewModel.viewDidLoad()
        
        view.backgroundColor = .white
    }
}

extension DetailScreen: DetailScreenInterface {
    
}
