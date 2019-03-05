//
//  SharedImagesListInteractor.swift
//  MemeMe
//
//  Created by Davit Mirzoyan on 2/26/19.
//  Copyright © 2019 Udacity. All rights reserved.
//

import UIKit

protocol SharedImagesListPresenting {
    func present(_ sharedImages: [SharedImage])
    func reloadData()
}

final class SharedImagesListInteractor: SharedImagesListInteracting {
    
    private let router: SharedImagesListInternalRoute
    private let presenter: SharedImagesListPresenting
    private let imagesProvider: ImagesProviding
    
    init(
        router: SharedImagesListInternalRoute,
        presenter: SharedImagesListPresenting,
        imagesProvider: ImagesProviding
    ) {
        self.router = router
        self.presenter = presenter
        self.imagesProvider = imagesProvider
    }
    
    func loadImages() {
        presenter.present(imagesProvider.sharedImages)
    }
    
    func removeImage(at index: Int) {
        
    }
    
    func goToImageEditor() {
        router.goToImageEditor { [weak self] isImageShared in
            guard
                isImageShared,
                let strongSelf = self
            else { return }
            
            strongSelf.presenter.present(strongSelf.imagesProvider.sharedImages)
            strongSelf.presenter.reloadData()
        }
    }
    
    func goToImagePreview(for image: UIImage) {
        router.goToImagePreview(for: image)
    }
}
