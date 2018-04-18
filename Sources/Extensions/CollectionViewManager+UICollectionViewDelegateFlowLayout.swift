//
//  CollectionViewManager+UICollectionViewDelegateFlowLayout.swift
//
//  Copyright © 2017 Rosberry. All rights reserved.
//

import UIKit.UICollectionView

extension CollectionViewManager: UICollectionViewDelegateFlowLayout {
    
    open func collectionView(_ collectionView: UICollectionView,
                             layout collectionViewLayout: UICollectionViewLayout,
                             sizeForItemAt indexPath: IndexPath) -> CGSize {
        guard let cellItem = cellItem(for: indexPath) else {
            return .zero
        }
        return cellItem.size(for: collectionView, with: collectionViewLayout, at: indexPath)
    }
    
    open func collectionView(_ collectionView: UICollectionView,
                             layout collectionViewLayout: UICollectionViewLayout,
                             insetForSectionAt section: Int) -> UIEdgeInsets {
        let sectionItem = _sectionItems[section]
        return sectionItem.inset(for: collectionView, with: collectionViewLayout)
    }
    
    open func collectionView(_ collectionView: UICollectionView,
                             layout collectionViewLayout: UICollectionViewLayout,
                             minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        let sectionItem = _sectionItems[section]
        return sectionItem.minimumLineSpacing(for: collectionView, with: collectionViewLayout)
    }
    
    open func collectionView(_ collectionView: UICollectionView,
                             layout collectionViewLayout: UICollectionViewLayout,
                             minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        let sectionItem = _sectionItems[section]
        return sectionItem.minimumInteritemSpacing(for: collectionView, with: collectionViewLayout)
    }
    
    open func collectionView(_ collectionView: UICollectionView,
                             layout collectionViewLayout: UICollectionViewLayout,
                             referenceSizeForHeaderInSection section: Int) -> CGSize {
        let optionalItem = _sectionItems[section].reusableViewItems.filter { $0.kind == UICollectionElementKindSectionHeader }.first
        guard let item = optionalItem else { return .zero }
        return item.size(for: collectionView, with: collectionViewLayout)
    }
    
    open func collectionView(_ collectionView: UICollectionView,
                             layout collectionViewLayout: UICollectionViewLayout,
                             referenceSizeForFooterInSection section: Int) -> CGSize {
        let optionalItem = _sectionItems[section].reusableViewItems.filter { $0.kind == UICollectionElementKindSectionFooter }.first
        guard let item = optionalItem else { return .zero }
        return item.size(for: collectionView, with: collectionViewLayout)
    }
}
