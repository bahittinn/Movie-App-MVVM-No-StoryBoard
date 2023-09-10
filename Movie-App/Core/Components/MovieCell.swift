//
//  MovieCell.swift
//  Movie-App
//
//  Created by Bahittin on 8.09.2023.
//

import UIKit

final class MovieCell: UICollectionViewCell {
    static let reuseID = "MovieCell"
    
    private var posterImageView: PosterImageView!
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        configureCell()
        configurePosterImageView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
        
        posterImageView.image = nil
        posterImageView.cancelDownLoading()
    }
    
    func setCell(movie: MovieResult) {
        posterImageView.downloadImage(movie: movie)
    }
    
    private func configureCell() {
        backgroundColor = .systemGray5
        layer.cornerRadius = 16
        clipsToBounds = true
    }
    
    private func configurePosterImageView() {
        posterImageView = PosterImageView(frame: .zero)
        addSubview(posterImageView)
        
        posterImageView.pinToEdgesOf(view: self)
    }
}
