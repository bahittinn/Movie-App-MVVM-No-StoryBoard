//
//  UIHelper.swift
//  Movie-App
//
//  Created by Bahittin on 8.09.2023.
//

import UIKit

enum UIHelper {
    static func createHomeFlowLayout() -> UICollectionViewFlowLayout {
        let layout = UICollectionViewFlowLayout()
        let itemWidth = CGFloat.dWidth
        
        layout.scrollDirection = .vertical
        layout.itemSize = CGSize(width: itemWidth - 20, height: itemWidth * 1.5)
        layout.minimumLineSpacing = 40
        
        return layout
    }
}
