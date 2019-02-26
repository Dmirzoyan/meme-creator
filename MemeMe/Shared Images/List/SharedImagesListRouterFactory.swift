//
//  SharedImagesListRouterFactory.swift
//  MemeMe
//
//  Created by Davit Mirzoyan on 2/26/19.
//  Copyright © 2019 Udacity. All rights reserved.
//

import UIKit

protocol SharedImagesListRouterProducing {
    func make() -> SharedImagesListRoute
}

final class SharedImagesListRouterFactory: SharedImagesListRouterProducing {
    
    private let navigationController: UINavigationController
    
    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }
    
    func make() -> SharedImagesListRoute {
        return SharedImagesListRouter(
            navigationController: navigationController,
            displayFactory: SharedImagesListDisplayFactory()
        )
    }
}
