//
//  SharedImagePreviewRouterFactory.swift
//  MemeMe
//
//  Created by Davit Mirzoyan on 3/3/19.
//  Copyright © 2019 Udacity. All rights reserved.
//

import UIKit

protocol SharedImagePreviewRouterProducing {
    func make() -> SharedImagePreviewRoute
}

final class SharedImagePreviewRouterFactory: SharedImagePreviewRouterProducing {
    
    private let navigationController: UINavigationController
    private let image: UIImage
    
    init(navigationController: UINavigationController, image: UIImage) {
        self.navigationController = navigationController
        self.image = image
    }
    
    func make() -> SharedImagePreviewRoute {
        return SharedImagePreviewRouter(
            navigationController: navigationController,
            displayFactory: SharedImagePreviewDisplayFactory(image: image)
        )
    }
}
