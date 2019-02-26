//
//  MainTabBarDisplayFactory.swift
//  MemeMe
//
//  Created by Davit Mirzoyan on 2/26/19.
//  Copyright © 2019 Udacity. All rights reserved.
//

import UIKit

protocol MainTabBarDisplayProducing {
    func make(router: MainTabBarInternalRoute) -> UIViewController
}

final class MainTabBarDisplayFactory: MainTabBarDisplayProducing {
    
    private let sharedImagesListViewController: SharedImagesListViewController
    private let sharedImagesGridViewController: SharedImagesGridViewController
    
    init(
        sharedImagesListViewController: SharedImagesListViewController,
        sharedImagesGridViewController: SharedImagesGridViewController
    ) {
        self.sharedImagesListViewController = sharedImagesListViewController
        self.sharedImagesGridViewController = sharedImagesGridViewController
    }
    
    func make(router: MainTabBarInternalRoute) -> UIViewController {
        let viewController = MainTabBarViewController()
        
        sharedImagesListViewController.tabBarItem = UITabBarItem(tabBarSystemItem: .more, tag: 0)
        sharedImagesGridViewController.tabBarItem = UITabBarItem(tabBarSystemItem: .history, tag: 1)
        
        viewController.viewControllers = [sharedImagesListViewController, sharedImagesGridViewController]
        
        return viewController
    }
}
