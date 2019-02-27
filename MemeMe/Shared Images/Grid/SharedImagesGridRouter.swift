//
//  SharedImagesGridRouter.swift
//  MemeMe
//
//  Created by Davit Mirzoyan on 2/26/19.
//  Copyright © 2019 Udacity. All rights reserved.
//

import UIKit

protocol SharedImagesGridRoute {
    func start() -> UIViewController
}

protocol SharedImagesGridInternalRoute {
    func goToImageEditor()
}

final class SharedImagesGridRouter: SharedImagesGridRoute {
    
    private let navigationController: UINavigationController
    private let displayFactory: SharedImagesGridDisplayProducing
    
    init(
        navigationController: UINavigationController,
        displayFactory: SharedImagesGridDisplayProducing
    ) {
        self.navigationController = navigationController
        self.displayFactory =  displayFactory
    }
    
    func start() -> UIViewController {
        return displayFactory.make(router: self)
    }
}

extension SharedImagesGridRouter: SharedImagesGridInternalRoute {
    
    func goToImageEditor() {
        let imageEditorRouter = ImageEditorRouterFactory(navigationController: navigationController).make()
        imageEditorRouter.start()
    }
}
