//
//  SharedImagesGridInteractor.swift
//  MemeMe
//
//  Created by Davit Mirzoyan on 2/26/19.
//  Copyright © 2019 Udacity. All rights reserved.
//

import UIKit

protocol SharedImagesGridPresenting {}

final class SharedImagesGridInteractor: SharedImagesGridInteracting {
    
    private let router: SharedImagesGridInternalRoute
    private let presenter: SharedImagesGridPresenting
    
    init(
        router: SharedImagesGridInternalRoute,
        presenter: SharedImagesGridPresenting
    ) {
        self.router = router
        self.presenter = presenter
    }
}
