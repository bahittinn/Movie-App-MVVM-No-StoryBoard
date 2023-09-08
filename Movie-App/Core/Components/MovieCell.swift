//
//  MovieCell.swift
//  Movie-App
//
//  Created by Bahittin on 8.09.2023.
//

import UIKit

class MovieCell: UICollectionViewCell {
    static let reuseID = "MovieCell"
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        configureCell()  
    }
 
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func configureCell() {
        backgroundColor = .systemGray5
        layer.cornerRadius = 16
    }
}
