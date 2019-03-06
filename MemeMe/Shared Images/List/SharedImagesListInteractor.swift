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
    private let storageManager: ImageStorageManaging
    
    init(
        router: SharedImagesListInternalRoute,
        presenter: SharedImagesListPresenting,
        storageManager: ImageStorageManaging
    ) {
        self.router = router
        self.presenter = presenter
        self.storageManager = storageManager
    }
    
    func loadImages() {
        presenter.present(storageManager.sharedImages)
    }
    
    func removeImage(at index: Int) {
        storageManager.deleteImage(at: index)
    }
    
    func goToImageEditor() {
        router.goToImageEditor { [weak self] isImageShared in
            guard
                isImageShared,
                let strongSelf = self
            else { return }
            
            strongSelf.presenter.present(strongSelf.storageManager.sharedImages)
            strongSelf.presenter.reloadData()
        }
    }
    
    func goToImagePreview(for image: UIImage) {
        router.goToImagePreview(for: image)
    }
}
