//
//  NSObject+Extension.swift
//  Catalyst
//
//  Created by Jean Vinge on 19/04/16.
//  Copyright © 2016 Atlas Politico. All rights reserved.
//

import Foundation

extension NSObject {
    
    class var className: String! {
        let classString: String = NSStringFromClass(self.classForCoder())
        return classString.components(separatedBy: ".").last
    }
}
