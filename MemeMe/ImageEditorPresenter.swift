//
//  ImageEditorPresenter.swift
//  MemeMe
//
//  Created by Davit Mirzoyan on 2/5/19.
//  Copyright © 2019 Udacity. All rights reserved.
//

import UIKit

protocol ImageEditorDisplaying {
    
    func apply(_ viewState: ImageEditorViewState)
}

final class ImageEditorPresenter: ImageEditorPresenting {
    
    private let display: ImageEditorDisplaying
    
    init(display: ImageEditorDisplaying) {
        self.display = display
    }
    
    func presentInitialView() {
        display.apply(
            ImageEditorViewState(
                shareButtonIsEnabled: false,
                cancelButtonIsEnabled: false,
                image: nil
            )
        )
    }
    
    func present(_ image: UIImage) {
        display.apply(
            ImageEditorViewState(
                shareButtonIsEnabled: true,
                cancelButtonIsEnabled: true,
                image: image
            )
        )
    }
    
    func clearImage() {
        display.apply(
            ImageEditorViewState(
                shareButtonIsEnabled: false,
                cancelButtonIsEnabled: false,
                image: nil
            )
        )
    }
}
