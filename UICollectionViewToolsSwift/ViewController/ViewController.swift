//
//  ViewController.swift
//  UICollectionViewToolsSwift
//
//  Created by Jean Vinge on 29/07/16.
//  Copyright © 2016 Jean Vinge. All rights reserved.
//

import UIKit
import ObjectMapper

class ViewController: UIViewController {
    
    //
    //MARK: Var and outlet declaration
    //
    
    @IBOutlet weak var collectionView: UICollectionView!
    @IBOutlet var collectionViewData: CollectionViewData!
    
    //
    //MARK: View life cicle methods
    //
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.collectionView.registerNib(CollectionViewCell.self)
        self.collectionView.registerNib(CollectionViewTwoCell.self)
        self.collectionView.registerNib(CollectionViewHeaderCell.self, forSuplementaryViewOfKind: UICollectionElementKindSectionHeader)
        
        if let path = Bundle.main.path(forResource: "flickr", ofType: "json") {
            do {
                let jsonData = try Data(contentsOf: URL(fileURLWithPath: path), options: Data.ReadingOptions.mappedIfSafe)
                
                do {
                    let array = try JSONSerialization.jsonObject(with: jsonData, options: JSONSerialization.ReadingOptions.mutableContainers) as? NSArray
                    
                    let flickr = Mapper<FlickrModel>().mapArray(JSONObject: array)
                    
                    self.collectionViewData.list = flickr
                    self.collectionView.reloadData()
                    
                } catch let error as NSError {
                    // error.description
                    print(error.description)
                }
            } catch let error as NSError {
                // error.description
                print(error.description)
            }
        }
    }
}

