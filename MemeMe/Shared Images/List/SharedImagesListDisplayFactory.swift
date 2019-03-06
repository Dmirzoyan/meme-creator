//
//  SharedImagesListDisplayFactory.swift
//  MemeMe
//
//  Created by Davit Mirzoyan on 2/26/19.
//  Copyright © 2019 Udacity. All rights reserved.
//

import UIKit

protocol SharedImagesListDisplayProducing {
    func make(router: SharedImagesListInternalRoute) -> UIViewController
}

final class SharedImagesListDisplayFactory: SharedImagesListDisplayProducing {
    
    func make(router: SharedImagesListInternalRoute) -> UIViewController {
        let viewController = SharedImagesListViewController()
        let presenter = SharedImagesListPresenter(display: viewController)
        
        let interactor = SharedImagesListInteractor(
            router: router,
            presenter: presenter,
            storageManager: Dependencies.imageStorageManager
        )
        
        viewController.interactor = interactor
        viewController.dataSource = SharedImagesListDataSource()
        
        return viewController
    }
}
