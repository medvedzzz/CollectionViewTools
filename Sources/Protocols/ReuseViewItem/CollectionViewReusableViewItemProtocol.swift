//
//  CollectionViewReusableViewItemProtocol.swift
//
//  Copyright © 2017 Rosberry. All rights reserved.
//

import UIKit.UICollectionView

public protocol CollectionViewReusableViewItemProtocol {
    
    var kind: String { get set }
    
    func size(for collectionView: UICollectionView, with layout: UICollectionViewLayout) -> CGSize
    func view(for collectionView: UICollectionView, at indexPath: IndexPath) -> UICollectionReusableView
    func register(for collectionView: UICollectionView)
}
