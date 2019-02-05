//
//  ImageEditorInteractor.swift
//  MemeMe
//
//  Created by Davit Mirzoyan on 2/3/19.
//  Copyright © 2019 Udacity. All rights reserved.
//

import UIKit

final class ImageEditorInteractor: ImageEditorInteracting {
    
    private let router: ImageEditorInternalRouting
    
    init(router: ImageEditorInternalRouting) {
        self.router = router
    }
    
    func share(_ image: UIImage) {
        router.share(image) { [weak self] success in
            if success {
                self?.save(originalImage: image, editedImage: image)
            }
        }
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
