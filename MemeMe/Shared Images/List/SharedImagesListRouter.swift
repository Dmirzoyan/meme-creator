//
//  SharedImagesListRouter.swift
//  MemeMe
//
//  Created by Davit Mirzoyan on 2/26/19.
//  Copyright © 2019 Udacity. All rights reserved.
//

import UIKit

typealias ImageEditorCompletion = (Bool) -> Void

protocol SharedImagesListRoute {
    func start() -> UIViewController
}

protocol SharedImagesListInternalRoute {
    func goToImageEditor(completion: @escaping ImageEditorCompletion)
    func goToImagePreview(for image: UIImage)
}

final class SharedImagesListRouter: SharedImagesListRoute {
    
    private let navigationController: UINavigationController
    private let displayFactory: SharedImagesListDisplayProducing
    
    init(
        navigationController: UINavigationController,
        displayFactory: SharedImagesListDisplayProducing
    ) {
        self.navigationController = navigationController
        self.displayFactory =  displayFactory
    }
    
    func start() -> UIViewController {        
        return displayFactory.make(router: self)
    }
}

extension SharedImagesListRouter: SharedImagesListInternalRoute {
    
    func goToImageEditor(completion: @escaping ImageEditorCompletion) {
        let imageEditorRouter = ImageEditorRouterFactory(
            navigationController: navigationController
        ).make()
        imageEditorRouter.start(exitRoute: completion)
    }
    
    func goToImagePreview(for image: UIImage) {
        let sharedImagePreview = SharedImagePreviewRouterFactory(
            navigationController: navigationController,
            image: image
        ).make()
        sharedImagePreview.start()
    }
}
