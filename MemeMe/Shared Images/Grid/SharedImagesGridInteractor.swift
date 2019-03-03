//
//  SharedImagesGridInteractor.swift
//  MemeMe
//
//  Created by Davit Mirzoyan on 2/26/19.
//  Copyright © 2019 Udacity. All rights reserved.
//

import UIKit

protocol SharedImagesGridPresenting {
    func present(_ sharedimages: [Meme])
}

final class SharedImagesGridInteractor: SharedImagesGridInteracting {
    
    private let router: SharedImagesGridInternalRoute
    private let presenter: SharedImagesGridPresenting
    private let imagesProvider: ImagesProviding
    
    init(
        router: SharedImagesGridInternalRoute,
        presenter: SharedImagesGridPresenting,
        imagesProvider: ImagesProviding
    ) {
        self.router = router
        self.presenter = presenter
        self.imagesProvider  = imagesProvider
    }
    
    func loadImages() {
        presenter.present(imagesProvider.sharedImages)
    }
    
    func goToImageEditor() {
        router.goToImageEditor()
    }
}
