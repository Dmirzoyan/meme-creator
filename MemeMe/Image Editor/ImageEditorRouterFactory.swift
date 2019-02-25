//
//  ImageEditorRouterFactory.swift
//  MemeMe
//
//  Created by Davit Mirzoyan on 2/7/19.
//  Copyright © 2019 Udacity. All rights reserved.
//

import UIKit

protocol ImageEditorRouterProducing {
    func make() -> ImageEditorRouting
}

final class ImageEditorRouterFactory: ImageEditorRouterProducing {
    
    private let navigationController: UINavigationController
    
    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }
    
    func make() -> ImageEditorRouting {
        return ImageEditorRouter(
            navigationController: navigationController,
            displayFactory: ImageEditorDisplayFactory()
        )
    }
}
