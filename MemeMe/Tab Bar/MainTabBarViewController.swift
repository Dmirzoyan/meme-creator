//
//  MainTabBarViewController.swift
//  MemeMe
//
//  Created by Davit Mirzoyan on 2/26/19.
//  Copyright © 2019 Udacity. All rights reserved.
//

import UIKit

protocol MainTabBarInteracting {}

final class MainTabBarViewController: UITabBarController {

    var interactor: MainTabBarInteracting!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
}

extension MainTabBarViewController: MainTabBarDisplaying {}
