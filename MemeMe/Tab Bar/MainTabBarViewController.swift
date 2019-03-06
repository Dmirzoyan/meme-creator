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
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
//        addBarBorder()
    }
    
    private func addBarBorder() {
        UITabBar.appearance().shadowImage = UIImage()
        UITabBar.appearance().backgroundImage = UIImage()
        
        let lineView = UIView(frame: CGRect(x: 0, y: 0, width: UIScreen.main.bounds.width, height: 0.5))
        lineView.backgroundColor = .gray
        tabBar.addSubview(lineView)
    }
}
