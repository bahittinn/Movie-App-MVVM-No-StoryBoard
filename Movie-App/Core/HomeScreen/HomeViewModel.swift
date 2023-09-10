//
//  HomeViewModel.swift
//  Movie-App
//
//  Created by Bahittin on 7.09.2023.
//

import UIKit

protocol HomeViewModelInterFace {
    var view: HomeScreenInterface? { get set }
    
    func viewDidLoad()
    func getMovies()
}


final class HomeViewModel {
    weak var view: HomeScreenInterface?
    private let service = MovieService()
    var movies: [MovieResult] = []
}

extension HomeViewModel: HomeViewModelInterFace {
    func viewDidLoad() {
        view?.configureVC()
        view?.configureCollectionView()
        getMovies()
    }
    
    func getMovies() { 
        service.downloadMovies(page: 1) { [weak self] returnedMovies in
            guard let self = self else { return }
            guard let returnedMovies = returnedMovies else { return }
            
            self.movies = returnedMovies
        }
    }
}
