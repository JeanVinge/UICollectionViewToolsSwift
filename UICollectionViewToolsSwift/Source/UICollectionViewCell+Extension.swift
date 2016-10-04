//
//  UICollectionViewCell+Extension.swift
//  Catalyst
//
//  Created by Jean Vinge on 02/06/16.
//  Copyright © 2016 Atlas Politico. All rights reserved.
//

import UIKit

extension UICollectionViewCell {
    
    func configure(atIndexPath indexPath: IndexPath?, withObject object: AnyObject? = nil) {
        
    }
    
    func sizeAtIndexPath(atIndexPath indexPath: IndexPath? = nil, withObject object: AnyObject? = nil) -> CGSize {
        self.configure(atIndexPath: indexPath, withObject: object)
        
        self.bounds = UIScreen.main.bounds
        self.contentView.bounds = self.bounds
        
        // Layout subviews, this will let labels on this cell to set preferredMaxLayoutWidth
        self.setNeedsLayout()
        self.layoutIfNeeded()
        
        var size = self.contentView.systemLayoutSizeFitting(UILayoutFittingCompressedSize)
        size = self.desirableSize(size)
        
        return size
    }
    
    func desirableSize(_ size: CGSize) -> CGSize {
        
        var mutableSize = size
        mutableSize.width = UIScreen.main.bounds.size.width
        
        return mutableSize
    }
}
