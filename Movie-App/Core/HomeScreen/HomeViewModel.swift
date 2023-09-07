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
}


final class HomeViewModel {
    weak var view: HomeScreenInterface?
}

extension HomeViewModel: HomeViewModelInterFace {
    func viewDidLoad() {
        view?.configureVC()
        view?.configureCollectionView()
    }
}
