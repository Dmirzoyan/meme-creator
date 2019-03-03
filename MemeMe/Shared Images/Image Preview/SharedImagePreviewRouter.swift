//
//  SharedImagePreviewRouter.swift
//  MemeMe
//
//  Created by Davit Mirzoyan on 3/3/19.
//  Copyright © 2019 Udacity. All rights reserved.
//

import UIKit

protocol SharedImagePreviewRoute {
    func start()
}

protocol SharedImagePreviewInternalRoute {}

final class SharedImagePreviewRouter: SharedImagePreviewRoute {
    
    private let navigationController: UINavigationController
    private let displayFactory: SharedImagePreviewDisplayProducing
    
    init(
        navigationController: UINavigationController,
        displayFactory: SharedImagePreviewDisplayProducing
    ) {
        self.navigationController = navigationController
        self.displayFactory =  displayFactory
    }
    
    func start() {
        let viewController = displayFactory.make(router: self)
        navigationController.pushViewController(viewController, animated: true)
    }
}

extension SharedImagePreviewRouter: SharedImagePreviewInternalRoute {}
