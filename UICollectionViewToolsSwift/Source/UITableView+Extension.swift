//
//  UITableView+Extension.swift
//  Catalyst
//
//  Created by Jean Vinge on 05/05/16.
//  Copyright © 2016 Atlas Politico. All rights reserved.
//

import UIKit

extension UITableView {
    
    func dequeueReusableCell<T: UITableViewCell>(withCellClassType cellType: T.Type, atIndexPath indexPath: IndexPath) -> T {
        
        guard let cell = self.dequeueReusableCell(withIdentifier: cellType.className, for: indexPath) as? T else {
            fatalError("can't instantiate cell")
        }
        
        return cell
    }
    
    func dequeReusableCell<T: UITableViewCell>(withCellClassType cellType: T.Type) -> T {
        
        guard let cell = self.dequeueReusableCell(withIdentifier: cellType.className) as? T else {
            fatalError("can't instantiate cell")
        }
        
        return cell
    }
    
    func cell<T: UITableViewCell>(_ cellType: T.Type, atIndexPath indexPath: IndexPath, object: AnyObject?) -> T {
        
        let cell = dequeueReusableCell(withCellClassType: cellType, atIndexPath: indexPath)
        cell.configure(atIndexPath: indexPath, withObject: object)
        
        return cell
    }
    
    func initCell<T: UITableViewCell>(_ cellClass: T.Type, object: AnyObject?) -> T {
        
        let cell = dequeReusableCell(withCellClassType: cellClass)
        cell.configure(withObject: object)
        
        return cell
    }
    
    func registerNib<T: UITableViewCell>(_ cellClass: T.Type) {
        
        self.register(UINib(nibName: cellClass.className, bundle: nil), forCellReuseIdentifier: cellClass.className)
    }
    
    func cellForItemAtIndexPath<T: UITableViewCell>(_ cellClass: T.Type, atIndexPath indexPath: IndexPath) -> T {
        
        guard let cell = self.cellForRow(at: indexPath) as? T else {
            fatalError("Could not instantiate cell")
        }
        
        return cell
    }
}
