//
//  MainTabBarRouter.swift
//  MemeMe
//
//  Created by Davit Mirzoyan on 2/26/19.
//  Copyright © 2019 Udacity. All rights reserved.
//

import UIKit

protocol MainTabBarRoute {
    func start()
}

protocol MainTabBarInternalRoute {}

final class MainTabBarRouter: MainTabBarRoute {
    
    private let navigationController: UINavigationController
    private let displayFactory: MainTabBarDisplayProducing
    
    init(
        navigationController: UINavigationController,
        displayFactory: MainTabBarDisplayProducing
    ) {
        self.navigationController = navigationController
        self.displayFactory =  displayFactory
    }
    
    func start() {
        let viewController = displayFactory.make(router: self)
        navigationController.present(viewController, animated: false, completion: nil)
    }
}

extension MainTabBarRouter: MainTabBarInternalRoute {}
