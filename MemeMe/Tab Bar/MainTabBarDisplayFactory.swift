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
    
    func make(router: MainTabBarInternalRoute) -> UIViewController {
        let viewController = MainTabBarViewController()
        
        viewController.viewControllers = [
            sharedImageListNavigationController(),
            sharedImageGridNavigationController()
        ]
        
        return viewController
    }
    
    private func sharedImageListNavigationController() -> UINavigationController {
        let navigationController = UINavigationController()
        let router = SharedImagesListRouterFactory(navigationController: navigationController).make()
        let viewController = router.start()
        
        viewController.tabBarItem = UITabBarItem(tabBarSystemItem: .more, tag: 0)
        navigationController.viewControllers = [viewController]
        
        return navigationController
    }
    
    private func sharedImageGridNavigationController() -> UINavigationController {
        let navigationController = UINavigationController()
        let router = SharedImagesGridRouterFactory(navigationController: navigationController).make()
        let viewController = router.start()
        
        viewController.tabBarItem = UITabBarItem(tabBarSystemItem: .more, tag: 1)
        navigationController.viewControllers = [viewController]
        
        return navigationController
    }
}
