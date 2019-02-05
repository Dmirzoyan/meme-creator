//
//  ImageEditorInteractor.swift
//  MemeMe
//
//  Created by Davit Mirzoyan on 2/3/19.
//  Copyright © 2019 Udacity. All rights reserved.
//

import UIKit

protocol ImageEditorPresenting {
    
    func present(_ image: UIImage)
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
    
    func openImagePicker() {
        router.openImagePicker()
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
            }
        }
    }
    
    func setSelected(_ image: UIImage) {
        originalImage = image
        presenter.present(image)
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
