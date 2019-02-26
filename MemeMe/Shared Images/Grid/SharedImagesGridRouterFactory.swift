//
//  SharedImagesGridRouterFactory.swift
//  MemeMe
//
//  Created by Davit Mirzoyan on 2/26/19.
//  Copyright © 2019 Udacity. All rights reserved.
//

import UIKit

protocol SharedImagesGridRouterProducing {
    func make() -> SharedImagesGridRoute
}

final class SharedImagesGridRouterFactory: SharedImagesGridRouterProducing {
    
    private let navigationController: UINavigationController
    
    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }
    
    func make() -> SharedImagesGridRoute {
        return SharedImagesGridRouter(
            navigationController: navigationController,
            displayFactory: SharedImagesGridDisplayFactory()
        )
    }
}
