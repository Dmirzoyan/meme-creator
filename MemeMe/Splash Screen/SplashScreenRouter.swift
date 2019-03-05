//
//  SplashScreenRouter.swift
//  MemeMe
//
//  Created by Davit Mirzoyan on 3/5/19.
//  Copyright © 2019 Udacity. All rights reserved.
//

import UIKit

protocol SplashScreenRoute {
    func start()
}

protocol SplashScreenInternalRoute {
    func goToTabBar()
}

final class SplashScreenRouter: SplashScreenRoute {
    
    private let navigationController: UINavigationController
    private let displayFactory: SplashScreenDisplayProducing
    
    init(
        navigationController: UINavigationController,
        displayFactory: SplashScreenDisplayProducing
    ) {
        self.navigationController = navigationController
        self.displayFactory =  displayFactory
    }
    
    func start() {
        navigationController.setNavigationBarHidden(true, animated: false)
        let viewController = displayFactory.make(router: self)
        navigationController.pushViewController(viewController, animated: true)
    }
}

extension SplashScreenRouter: SplashScreenInternalRoute {
    
    func goToTabBar() {
        let mainTabBarRouter = MainTabBarRouterFactory(navigationController: navigationController).make()
        mainTabBarRouter.start()
    }
}
