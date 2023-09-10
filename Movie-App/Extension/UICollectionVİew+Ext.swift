//
//  UICollectionVİew+Ext.swift
//  Movie-App
//
//  Created by Bahittin on 10.09.2023.
//

import UIKit

extension UICollectionView {
    func reloadOnMainThread() {
        DispatchQueue.main.async {
            self.reloadData()
        }
    }
}
