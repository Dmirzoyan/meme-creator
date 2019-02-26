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
        return MainTabBarRouter(
            navigationController: navigationController,
            displayFactory: MainTabBarDisplayFactory()
        )
    }
}
