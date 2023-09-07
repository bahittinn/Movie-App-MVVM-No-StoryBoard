//
//  HomeScreen.swift
//  Movie-App
//
//  Created by Bahittin on 5.09.2023.
//

import UIKit

protocol HomeScreenInterface: AnyObject {
    func configureVC()
}

class HomeScreen: UIViewController {

    private let viewModel = HomeViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        viewModel.view = self
        viewModel.viewDidLoad()
    }
}

extension HomeScreen: HomeScreenInterface {
    func configureVC() {
        view.backgroundColor = .blue
    }
}
