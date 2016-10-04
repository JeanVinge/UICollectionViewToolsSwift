//
//  UICollectionView+Extension.swift
//  Catalyst
//
//  Created by Jean Vinge on 27/04/16.
//  Copyright © 2016 Atlas Politico. All rights reserved.
//

import UIKit

extension UICollectionView {

    func dequeueReusableCell<T: UICollectionViewCell>(_ cellType: T.Type, atIndexPath indexPath: IndexPath) -> T {
        
        guard let cell = self.dequeueReusableCell(withReuseIdentifier: cellType.className, for: indexPath) as? T else {
            fatalError("can't instantiate cell")
        }
        
        return cell
    }
    
    func dequeueReusableCell<T: UICollectionViewCell>(_ cellType: T.Type, suplementaryViewOfKind kind: String, atIndexPath indexPath: IndexPath) -> T {
        
        guard let cell = self.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: cellType.className, for: indexPath) as? T else {
            fatalError("can't instantiate cell")
        }
        
        return cell
    }
    
    func cell<T: UICollectionViewCell>(_ cellType: T.Type, atIndexPath indexPath: IndexPath, object: AnyObject? = nil) -> T {
        
        let cell = self.dequeueReusableCell(cellType, atIndexPath: indexPath)
        cell.configure(atIndexPath: indexPath, withObject: object)
        
        return cell
    }
    
    func cell<T: UICollectionViewCell>(cellClassTypeForFooter cellType: T.Type, atIndexPath indexPath: IndexPath, object: AnyObject? = nil) -> T {
        
        let cell = self.cell(cellType, atIndexPath: indexPath, suplementaryViewOfKind: UICollectionElementKindSectionFooter, object: object)
        cell.configure(atIndexPath: indexPath, withObject: object)
        
        return cell
    }
    
    func cell<T: UICollectionViewCell>(cellClassTypeForHeader cellType: T.Type, atIndexPath indexPath: IndexPath, object: AnyObject? = nil) -> T {
        
        let cell = self.cell(cellType, atIndexPath: indexPath, suplementaryViewOfKind: UICollectionElementKindSectionHeader, object: object)
        cell.configure(atIndexPath: indexPath, withObject: object)
        
        return cell
    }
    
    func cell<T: UICollectionViewCell>(_ cellType: T.Type, atIndexPath indexPath: IndexPath, suplementaryViewOfKind kind: String, object: AnyObject? = nil) -> T {
        
        let cell = dequeueReusableCell(cellType, suplementaryViewOfKind: kind, atIndexPath: indexPath)
        cell.configure(atIndexPath: indexPath, withObject: object)
        
        return cell
    }
    
    func registerNib<T: UICollectionViewCell>(_ cellType: T.Type) {
        
        self.register(UINib(nibName: cellType.className, bundle: nil), forCellWithReuseIdentifier: cellType.className)
    }
    
    func registerNib<T: UICollectionViewCell>(_ cellType: T.Type, forSuplementaryViewOfKind kind: String) {
        
        self.register(UINib(nibName: cellType.className, bundle: nil), forSupplementaryViewOfKind: kind, withReuseIdentifier: cellType.className)
    }
    
    func registerNib<T: UICollectionViewCell>(forHeaderCellClass cellClass: T.Type) {
        
        self.registerNib(cellClass, forSuplementaryViewOfKind: UICollectionElementKindSectionHeader)
    }
    
    func registerNib<T: UICollectionViewCell>(forFooterCellClass cellClass: T.Type) {
        
        self.registerNib(cellClass, forSuplementaryViewOfKind: UICollectionElementKindSectionFooter)
    }
    
    func cellForItemAtIndexPath<T: UICollectionViewCell>(_ cellClass: T.Type, atIndexPath indexPath: IndexPath) -> T {
        
        guard let cell = self.cellForItem(at: indexPath) as? T else {
            fatalError("Could not instantiate cell")
        }
        
        return cell
    }
    
    func nib<T: UICollectionViewCell>(withCollectionViewCellType cellType: T.Type) -> T? {
        
        let sizingNibNew = Bundle.main.loadNibNamed("\(cellType)", owner: cellType.self, options: nil)! as NSArray
        
        return sizingNibNew.object(at: 0) as? T
    }
    
    func cellSize<T: UICollectionViewCell>(_ cellClass: T.Type, atIndexPath indexPath: IndexPath? = nil, object: AnyObject? = nil) -> CGSize {
        
        let cell = self.nib(withCollectionViewCellType: cellClass)
        
        if let mCell = cell {
            
            return mCell.sizeAtIndexPath(atIndexPath: indexPath, withObject: object)
        } else {

            return CGSize.zero
        }
    }
}
