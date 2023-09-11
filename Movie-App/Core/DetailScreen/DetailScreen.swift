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
    func configureOverviewTitle()
    func configureDateTitle()
}

class DetailScreen: UIViewController {
    
    private let movie: MovieResult
    private let viewModel = DetailViewModel()
    
    private let padding: CGFloat = 16
    
    private var posterImageView: PosterImageView!
    private var titleLabel: UILabel!
    private var dateLabel: UILabel!
    private var overviewLabel: UILabel!
    private var overviewTitleLabel: UILabel!
    private var dateTitleLabel: UILabel!
    
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
        
        let posterWidth = CGFloat.dWidth * 0.4
        NSLayoutConstraint.activate([
            posterImageView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            posterImageView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: padding),
            posterImageView.widthAnchor.constraint(equalToConstant: posterWidth),
            posterImageView.heightAnchor.constraint(equalToConstant: posterWidth * 1.5),
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
            titleLabel.topAnchor.constraint(equalTo: posterImageView.topAnchor),
            titleLabel.leadingAnchor.constraint(equalTo: posterImageView.trailingAnchor, constant: padding),
            titleLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -padding)
        ])
    }
    
    func configureDateTitle() {
        dateTitleLabel = UILabel()
        view.addSubview(dateTitleLabel)
        
        dateTitleLabel.translatesAutoresizingMaskIntoConstraints = false
        dateTitleLabel.text = "Release Date"
        dateTitleLabel.font = .boldSystemFont(ofSize: 18)
        
        NSLayoutConstraint.activate([
            dateTitleLabel.topAnchor.constraint(equalTo: titleLabel.bottomAnchor,constant: padding),
            dateTitleLabel.leadingAnchor.constraint(equalTo: posterImageView.trailingAnchor, constant: padding)
        ])
    }
    
    func configureDateLabel() {
        dateLabel = UILabel(frame: .zero)
        view.addSubview(dateLabel)
        
        dateLabel.translatesAutoresizingMaskIntoConstraints = false
        
        dateLabel.text = movie._releaseDate
        dateLabel.font = .systemFont(ofSize: 18)
        dateLabel.textColor = .secondaryLabel
        
        NSLayoutConstraint.activate([
            dateLabel.topAnchor.constraint(equalTo: dateTitleLabel.bottomAnchor),
            dateLabel.leadingAnchor.constraint(equalTo: posterImageView.trailingAnchor, constant: padding)
        ])
        
        
    }
    
    func configureOverviewTitle() {
        overviewTitleLabel = UILabel()
        view.addSubview(overviewTitleLabel)
        
        overviewTitleLabel.translatesAutoresizingMaskIntoConstraints = false
        overviewTitleLabel.text = "Movie Overview"
        overviewTitleLabel.font = .boldSystemFont(ofSize: 22)
        
        NSLayoutConstraint.activate([
            overviewTitleLabel.topAnchor.constraint(equalTo: posterImageView.bottomAnchor,constant: padding),
            overviewTitleLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: padding)
        ])
    }
    
    func configureOverviewLabel() {
        overviewLabel = UILabel()
        view.addSubview(overviewLabel)
        
        overviewLabel.translatesAutoresizingMaskIntoConstraints = false
        
        overviewLabel.text = movie._overview
        overviewLabel.font = .systemFont(ofSize: 20)
        overviewLabel.numberOfLines = 0
        
        NSLayoutConstraint.activate([
            overviewLabel.topAnchor.constraint(equalTo: overviewTitleLabel.bottomAnchor,constant: padding),
            overviewLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: padding),
            overviewLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor,constant: -padding),
        ])
    }
}
