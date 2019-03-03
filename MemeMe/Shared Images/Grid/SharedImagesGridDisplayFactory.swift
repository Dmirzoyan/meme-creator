//
//  SharedImagesGridDisplayFactory.swift
//  MemeMe
//
//  Created by Davit Mirzoyan on 2/26/19.
//  Copyright © 2019 Udacity. All rights reserved.
//

import UIKit

protocol SharedImagesGridDisplayProducing {
    func make(router: SharedImagesGridInternalRoute) -> UIViewController
}

final class SharedImagesGridDisplayFactory: SharedImagesGridDisplayProducing {
    
    func make(router: SharedImagesGridInternalRoute) -> UIViewController {
        let viewController = SharedImagesGridViewController()
        let presenter = SharedImagesGridPresenter(display: viewController)
        
        let interactor = SharedImagesGridInteractor(
            router: router,
            presenter: presenter,
            imagesProvider: Dependencies.imageStorageManager
        )
        
        viewController.interactor = interactor
        viewController.dataSource = SharedImagesGridDataSource()
        
        return viewController
    }
}
