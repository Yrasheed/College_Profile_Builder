//
//  College.swift
//  College Profile Builder
//
//  Created by Yasoob  Rasheed on 7/6/15.
//  Copyright © 2015 Yasoob Rasheed. All rights reserved.
//

import UIKit

class College: NSObject {
    
    var name = ""
    var city = ""
    var state = ""
    var enrollment = 0.0
    //this is a percentage
    var image = UIImage(named: "Default")
    var webURL = NSURL(string: "Default")
    
    convenience init(name: String, city: String, state: String, enrollment: Double, image: UIImage, url: NSURL) {
        self.init()
        self.name = name
        self.city = city
        self.state = state
        self.enrollment = enrollment
        self.image = image
        self.webURL = url
    }
    
    convenience init(name: String) {
        self.init()
        self.name = name
    }

}
