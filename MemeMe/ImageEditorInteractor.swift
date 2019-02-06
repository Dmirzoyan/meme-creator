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
    func clearImage()
}

final class ImageEditorInteractor: ImageEditorInteracting {
    
    private let router: ImageEditorInternalRouting
    private let presenter: ImageEditorPresenting
    private var originalImage: UIImage?
    private var userText: UserText?
    
    init(router: ImageEditorInternalRouting, presenter: ImageEditorPresenting) {
        self.router = router
        self.presenter = presenter
    }
    
    func setInitialView() {
        presenter.presentInitialView()
    }
    
    func openImagePicker(with sourceType: UIImagePickerController.SourceType) {
        router.openImagePicker(with: sourceType)
    }
    
    func closeImagePicker() {
        router.closeImagePicker()
    }
    
    func save(_ userText: UserText) {
        self.userText?.top = userText.top
        self.userText?.bottom = userText.bottom
    }
    
    func share(_ image: UIImage) {
        router.share(image) { [weak self] success in
            if success {
                self?.saveMeme(editedImage: image)
                self?.presenter.clearImage()
            }
        }
    }
    
    func setSelected(_ image: UIImage) {
        originalImage = image
        presenter.present(image)
    }
    
    func clearImage() {
        presenter.clearImage()
    }
    
    private func saveMeme(editedImage: UIImage) {
        let meme = Meme(
            topText: userText?.top,
            bottomText: userText?.bottom,
            originalImage: originalImage,
            editedImage: editedImage
        )
    }
}
