//
//  UIConfig.swift
//  LinguaCorsaSwift
//
//  Created by Francescu SANTONI on 12/07/2014.
//  Copyright (c) 2014 Francescu. All rights reserved.
//

import Foundation
import UIKit

struct UIConfig {
    static let mainColor = UIColor.blackColor()
    static let backgroundColor = UIColor.whiteColor()
    static let regularFontName = "HelveticaNeue-Thin"
    static let strongFontName = "Futura"
    static let regularFont = UIFont(name: regularFontName, size: 15)
    static let strongFont = UIFont(name: strongFontName, size: 20)
    
    static func apply() {
        RegularLabel.appearance().font = regularFont
        StrongLabel.appearance().font = strongFont
        UITextField.appearance().font = UIFont(name: regularFontName, size: 20)
        UINavigationBar.appearance().barTintColor = UIColor(white: 0, alpha: 0.8)
        UINavigationBar.appearance().titleTextAttributes = [NSFontAttributeName : strongFont,
            NSForegroundColorAttributeName : UIColor.whiteColor()]
        UITableView.appearance().backgroundColor = UIColor.clearColor()
        UIApplication.sharedApplication().statusBarStyle = UIStatusBarStyle.LightContent
    }
}