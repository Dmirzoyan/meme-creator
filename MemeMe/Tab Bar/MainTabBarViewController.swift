//
//  MainTabBarViewController.swift
//  MemeMe
//
//  Created by Davit Mirzoyan on 2/26/19.
//  Copyright © 2019 Udacity. All rights reserved.
//

import UIKit

final class MainTabBarViewController: UITabBarController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        applyStyle()
    }
    
    private func applyStyle() {
        tabBar.tintColor = .white
        tabBar.barTintColor = UIColor.AppTheme.darkGrey
    }
}
