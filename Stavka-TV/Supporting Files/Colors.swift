//
//  Colors.swift
//  StavkaTV
//
//  Created by MacBook Air on 22/11/2019.
//  Copyright © 2019 StavkaTV. All rights reserved.
//

import UIKit


extension UIColor {
    static func randomColor() -> UIColor {
        let random = {CGFloat(arc4random_uniform(255)) / 255.0}
        return UIColor(red: random(), green: random(), blue: random(), alpha: 1)
    }
    
    static var gray: UIColor {
        return UIColor(red: 234.0 / 255.0,
                       green: 234.0 / 255.0,
                       blue: 234.0 / 255.0,
                       alpha: 1.0)
    }
    
    static var lightGray: UIColor {
        return UIColor(red: 112.0 / 255.0,
                       green: 114.0 / 255.0,
                       blue: 129.0 / 255.0,
                       alpha: 1.0)
    }
    
    static var lightGray2: UIColor {
        return UIColor(red: 248.0 / 255.0,
                green: 249.0 / 255.0,
                blue: 251.0 / 255.0,
                alpha: 1.0)
    }
    
    static var yellow: UIColor {
        return UIColor(red: 238.0 / 255.0,
                       green: 169.0 / 255.0,
                       blue: 42.0 / 255.0,
                       alpha: 1.0)
    }
    
    static var blue: UIColor {
        return UIColor(red: 1.0 / 255.0,
                       green: 97.0 / 255.0,
                       blue: 218.0 / 255.0,
                       alpha: 1.0)
    }
    
    static var darkBlue: UIColor {
        return UIColor(red: 1.0 / 255.0,
                       green: 74.0 / 255.0,
                       blue: 167.0 / 255.0,
                       alpha: 1.0)
    }
    
    static var red: UIColor {
        return UIColor(red: 211.0 / 255.0,
                       green: 37.0 / 255.0,
                       blue: 58.0 / 255.0,
                       alpha: 1.0)
    }
    
    static var green: UIColor {
        return UIColor(red: 37.0 / 255.0,
                       green: 186.0 / 255.0,
                       blue: 113.0 / 255.0,
                       alpha: 1.0)
    }
}
