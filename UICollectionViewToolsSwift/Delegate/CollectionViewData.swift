//
//  CollectionViewData.swift
//  UICollectionViewToolsSwift
//
//  Created by Jean Vinge on 30/07/16.
//  Copyright © 2016 Jean Vinge. All rights reserved.
//

import UIKit

class CollectionViewData: NSObject, UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout {

    //
    //MARK: Var and outlets declaration
    //
    
    var list: [FlickrModel]?
    
    //
    //MARK: UICollectionViewDatasource
    //
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        
        if let list = self.list {
            
            return list.count
        } else {
            
            return 0
        }
    }
    
    //
    //MARK: UICollectionViewDelegate
    //
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        guard let list = self.list else {
            
            fatalError("list can't be nil")
        }
        
        if (indexPath as NSIndexPath).row % 2 == 0 {
            
            return collectionView.cell(CollectionViewTwoCell.self, atIndexPath: indexPath, object: list[(indexPath as NSIndexPath).row])
        } else {
            
            return collectionView.cell(CollectionViewCell.self, atIndexPath: indexPath, object: list[(indexPath as NSIndexPath).row])
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        
        guard let list = self.list else {
            
            fatalError("list can't be nil")
        }
        
        if kind == UICollectionElementKindSectionHeader {
         
            return collectionView.cell(cellClassTypeForHeader: CollectionViewHeaderCell.self, atIndexPath: indexPath, object: list[(indexPath as NSIndexPath).row])
        }
        
        return UICollectionReusableView()
    }
    
    //
    //MARK: UICollectionViewDelegateFlowLayout
    //
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        guard let list = self.list else {
            
            fatalError("list can't be nil")
        }
        
        
        if (indexPath as NSIndexPath).row % 3 == 0 {
            
            return collectionView.cellSize(CollectionViewTwoCell.self, atIndexPath: indexPath, object: list[(indexPath as NSIndexPath).row])
        } else {
            
            return collectionView.cellSize(CollectionViewCell.self, atIndexPath: indexPath, object: list[(indexPath as NSIndexPath).row])
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, referenceSizeForHeaderInSection section: Int) -> CGSize {
        
        guard let list = self.list else {
            
            fatalError("list can't be nil")
        }
        
        return collectionView.cellSize(CollectionViewHeaderCell.self, object: list[section])
        
    }
}
