//
//  BaseCollectionViewCell.swift
//  UICollectionViewToolsSwift
//
//  Created by Jean Vinge on 30/07/16.
//  Copyright © 2016 Jean Vinge. All rights reserved.
//

import UIKit
import Kingfisher

class BaseCollectionViewCell: UICollectionViewCell {

    //
    //MARK: Var and outlet declaration
    //
    
    @IBOutlet weak var titleLabel: UILabel?
    @IBOutlet weak var imageView: UIImageView?
    @IBOutlet weak var authorNameLabel: UILabel?
    
    //
    //MARK: Init methods
    //
    
    override func configure(atIndexPath indexPath: IndexPath?, withObject object: AnyObject?) {
        
        if let flickr = object as? FlickrModel {
            
            if let titleLabel = self.titleLabel {
                
                titleLabel.text = flickr.title
            }
            
            if let imageView = self.imageView {
                
                imageView.kf.setImage(with: flickr.mediaURL as Resource?)
                
            }
            
            if let authorNameLabel = self.authorNameLabel {
                
                authorNameLabel.text = flickr.author
            }
            
        }
    }
}
