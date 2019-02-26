//
//  SharedImagesListInteractor.swift
//  MemeMe
//
//  Created by Davit Mirzoyan on 2/26/19.
//  Copyright © 2019 Udacity. All rights reserved.
//

import UIKit

protocol SharedImagesListPresenting {}

final class SharedImagesListInteractor: SharedImagesListInteracting {
    
    private let router: SharedImagesListInternalRoute
    private let presenter: SharedImagesListPresenting
    
    init(
        router: SharedImagesListInternalRoute,
        presenter: SharedImagesListPresenting
    ) {
        self.router = router
        self.presenter = presenter
    }
}
