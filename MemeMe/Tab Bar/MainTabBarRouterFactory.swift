//
//  MainTabBarRouterFactory.swift
//  MemeMe
//
//  Created by Davit Mirzoyan on 2/26/19.
//  Copyright © 2019 Udacity. All rights reserved.
//

import UIKit

protocol MainTabBarRouterProducing {
    func make() -> MainTabBarRoute
}

final class MainTabBarRouterFactory: MainTabBarRouterProducing {
    
    private let navigationController: UINavigationController
    
    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }
    
    func make() -> MainTabBarRoute {
        let sharedImagesListRouter = SharedImagesListRouterFactory(navigationController: navigationController).make()
        let sharedImagesListViewController = sharedImagesListRouter.start()
        
        let sharedImagesGridRouter = SharedImagesGridRouterFactory(navigationController: navigationController).make()
        let sharedImagesGridViewController = sharedImagesGridRouter.start()
        
        return MainTabBarRouter(
            navigationController: navigationController,
            displayFactory: MainTabBarDisplayFactory(
                sharedImagesListViewController: sharedImagesListViewController as! SharedImagesListViewController,
                sharedImagesGridViewController: sharedImagesGridViewController as! SharedImagesGridViewController
            )
        )
    }
}
