//
//  SplashScreenRouterFactory.swift
//  MemeMe
//
//  Created by Davit Mirzoyan on 3/5/19.
//  Copyright © 2019 Udacity. All rights reserved.
//

import UIKit

protocol SplashScreenRouterProducing {
    func make() -> SplashScreenRoute
}

final class SplashScreenRouterFactory: SplashScreenRouterProducing {
    
    private let navigationController: UINavigationController
    
    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }
    
    func make() -> SplashScreenRoute {
        return SplashScreenRouter(
            navigationController: navigationController,
            displayFactory: SplashScreenDisplayFactory()
        )
    }
}
