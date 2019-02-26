//
//  SharedImagesListRouter.swift
//  MemeMe
//
//  Created by Davit Mirzoyan on 2/26/19.
//  Copyright © 2019 Udacity. All rights reserved.
//

import UIKit

protocol SharedImagesListRoute {
    func start()
}

protocol SharedImagesListInternalRoute {}

final class SharedImagesListRouter: SharedImagesListRoute {
    
    private let navigationController: UINavigationController
    private let displayFactory: SharedImagesListDisplayProducing
    private var viewController: UIViewController?
    
    init(
        navigationController: UINavigationController,
        displayFactory: SharedImagesListDisplayProducing
    ) {
        self.navigationController = navigationController
        self.displayFactory =  displayFactory
    }
    
    func start() {
        viewController = displayFactory.make(router: self)
        
        guard let viewController = viewController
        else { return }
        
        navigationController.pushViewController(viewController, animated: true)
    }
}

extension SharedImagesListRouter: SharedImagesListInternalRoute {}
