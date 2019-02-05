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
    
    func share(_ image: UIImage) {
        router.share(image) { [weak self] success in
            if success {
                self?.save(originalImage: image, editedImage: image)
            }
        }
    }
    
    func setSelected(_ image: UIImage) {
        presenter.present(image)
    }
    
    private func save(
        originalImage: UIImage,
        editedImage: UIImage
    ) {
        let meme = Meme(
            topText: "", // topTextField.text!,
            bottomText: "", // bottomTextField.text!,
            originalImage: originalImage,
            editedImage: editedImage
        )
    }
}
