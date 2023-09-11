//
//  DetailViewModel.swift
//  Movie-App
//
//  Created by Bahittin on 11.09.2023.
//

import Foundation

protocol DetailViewModelInterface {
    var view: DetailScreenInterface? {get set}
    
    func viewDidLoad()
}

final class DetailViewModel {
    weak var view: DetailScreenInterface?
}

extension DetailViewModel: DetailViewModelInterface {
    func viewDidLoad() {
        
    }
}
