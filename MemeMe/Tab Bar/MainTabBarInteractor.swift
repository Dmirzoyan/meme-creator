//
//  MainTabBarInteractor.swift
//  MemeMe
//
//  Created by Davit Mirzoyan on 2/26/19.
//  Copyright © 2019 Udacity. All rights reserved.
//

import UIKit

protocol MainTabBarPresenting {}

final class MainTabBarInteractor: MainTabBarInteracting {
    
    private let router: MainTabBarInternalRoute
    private let presenter: MainTabBarPresenting
    
    init(
        router: MainTabBarInternalRoute,
        presenter: MainTabBarPresenting
    ) {
        self.router = router
        self.presenter = presenter
    }
}
