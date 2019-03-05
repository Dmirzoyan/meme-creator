//
//  ImageEditorInteractor.swift
//  MemeMe
//
//  Created by Davit Mirzoyan on 2/3/19.
//  Copyright © 2019 Udacity. All rights reserved.
//

import UIKit

protocol ImageEditorPresenting {
    func presentInitialView()
    func present(_ image: UIImage)
}

final class ImageEditorInteractor: ImageEditorInteracting {
    
    private let router: ImageEditorInternalRouting
    private let presenter: ImageEditorPresenting
    private let storageManager: ImageStorageManaging
    private var originalImage = UIImage()
    private var userText = UserText(top: "TOP", bottom: "BOTTOM")
    
    init(
        router: ImageEditorInternalRouting,
        presenter: ImageEditorPresenting,
        storageManager: ImageStorageManaging
    ) {
        self.router = router
        self.presenter = presenter
        self.storageManager = storageManager
    }
    
    func setInitialView() {
        presenter.presentInitialView()
    }
    
    func openImagePicker(
        with sourceType: UIImagePickerController.SourceType,
        delegate: UIImagePickerControllerDelegate & UINavigationControllerDelegate
    ) {
        router.openImagePicker(with: sourceType, delegate: delegate)
    }
    
    func closeImagePicker() {
        router.closeImagePicker()
    }
    
    func save(_ userText: UserText) {
        self.userText.top = userText.top
        self.userText.bottom = userText.bottom
    }
    
    func share(_ image: UIImage) {
        router.share(image) { [weak self] success in
            if success {
                self?.storeSharedImage(editedImage: image)
                self?.router.dismiss(isImageShared: true)
            }
        }
    }
    
    func setSelected(_ image: UIImage) {
        originalImage = image
        presenter.present(image)
    }
    
    func dismiss() {
        router.dismiss(isImageShared: false)
    }
    
    private func storeSharedImage(editedImage: UIImage) {
        storageManager.store(
            SharedImage(
                topText: userText.top,
                bottomText: userText.bottom,
                originalImage: originalImage,
                editedImage: editedImage
            )
        )
    }
}
