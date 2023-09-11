//
//  DetailScreen.swift
//  Movie-App
//
//  Created by Bahittin on 10.09.2023.
//

import UIKit

protocol DetailScreenInterface: AnyObject {
    func configureVC()
    func configurePosterImageView()
    func dowloadPosterImage()
    func configureTitleLabel()
    func configureDateLabel()
    func configureOverviewLabel()
}

class DetailScreen: UIViewController {
    
    private let movie: MovieResult
    private let viewModel = DetailViewModel()
    
    private let padding: CGFloat = 16
    
    private var posterImageView: PosterImageView!
    private var titleLabel: UILabel!
    private var dateLabel: UILabel!
    private var overviewLabel: UILabel!
    
    
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
    }
}

extension DetailScreen: DetailScreenInterface {
    func configureVC() {
        view.backgroundColor = .systemBackground
    }
    func configurePosterImageView() {
        posterImageView = PosterImageView(frame: .zero)
        view.addSubview(posterImageView)
        
        posterImageView.layer.cornerRadius = 16
        posterImageView.clipsToBounds = true
        
        let posterWidth = CGFloat.dWidth
        NSLayoutConstraint.activate([
            posterImageView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            posterImageView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: padding),
            posterImageView.trailingAnchor.constraint(equalTo: view.trailingAnchor,constant: -padding),
            posterImageView.widthAnchor.constraint(equalToConstant: posterWidth),
            posterImageView.heightAnchor.constraint(equalToConstant: CGFloat.dWidth * 1.2),
        ])
        
        posterImageView.backgroundColor = .red
    }
    
    func dowloadPosterImage() {
        posterImageView.downloadImage(movie: movie)
    }
    
    func configureTitleLabel() {
        titleLabel = UILabel()
        view.addSubview(titleLabel)
        
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        
        titleLabel.text = movie._title
        titleLabel.font = .boldSystemFont(ofSize: 24)
        titleLabel.numberOfLines = 0
        
        NSLayoutConstraint.activate([
            titleLabel.topAnchor.constraint(equalTo: posterImageView.bottomAnchor, constant: padding),
            titleLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor,constant: padding),
            titleLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -padding)
        ])
    }
    
    func configureDateLabel() {
        dateLabel = UILabel(frame: .zero)
        view.addSubview(dateLabel)
        
        dateLabel.translatesAutoresizingMaskIntoConstraints = false
        
        dateLabel.text = movie._releaseDate
        dateLabel.font = .systemFont(ofSize: 18)
        
        NSLayoutConstraint.activate([
            dateLabel.topAnchor.constraint(equalTo: titleLabel.bottomAnchor,constant: padding),
            dateLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor,constant: padding),
            dateLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -padding)
        ])
        
        
    }
    
    func configureOverviewLabel() {
        overviewLabel = UILabel(frame: .zero)
        view.addSubview(overviewLabel)
        
        overviewLabel.translatesAutoresizingMaskIntoConstraints = false
        
        overviewLabel.text = movie._overview
        overviewLabel.font = .systemFont(ofSize: 18)
        overviewLabel.numberOfLines = 0
        
        NSLayoutConstraint.activate([
            overviewLabel.topAnchor.constraint(equalTo: dateLabel.bottomAnchor,constant: padding),
            overviewLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor,constant: padding),
            overviewLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -padding)
        ])
    }
}
