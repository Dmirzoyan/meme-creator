//
//  SharedImagesGridInteractor.swift
//  MemeMe
//
//  Created by Davit Mirzoyan on 2/26/19.
//  Copyright © 2019 Udacity. All rights reserved.
//

import UIKit

protocol SharedImagesGridPresenting {
    func present(_ sharedimages: [SharedImage])
}

final class SharedImagesGridInteractor: SharedImagesGridInteracting {
    
    private let router: SharedImagesGridInternalRoute
    private let presenter: SharedImagesGridPresenting
    private let imageProvider: ImageStorageManaging
    
    init(
        router: SharedImagesGridInternalRoute,
        presenter: SharedImagesGridPresenting,
        imageProvider: ImageStorageManaging
    ) {
        self.router = router
        self.presenter = presenter
        self.imageProvider  = imageProvider
    }
    
    func loadImages() {
        DispatchQueue.global().async { [weak self] in
            guard let memes = self?.imageProvider.sharedMemes()
            else { return }
            
            self?.presenter.present(memes)
        }
    }
    
    func goToImageEditor() {
        router.goToImageEditor()
    }
    
    func goToImagePreview(for image: UIImage) {
        router.goToImagePreview(for: image)
    }
}
