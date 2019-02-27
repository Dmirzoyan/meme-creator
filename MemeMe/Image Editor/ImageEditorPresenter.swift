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
    
    private var defaultViewState = {
        return ImageEditorViewState(
            shareButtonIsEnabled: false,
            cancelButtonIsEnabled: true,
            topText: "TOP",
            bottomText: "BOTTOM",
            image: nil
        )
    }()
    
    init(display: ImageEditorDisplaying) {
        self.display = display
    }
    
    func presentInitialView() {
        display.apply(defaultViewState)
    }
        
    func present(_ image: UIImage) {
        display.apply(
            ImageEditorViewState(
                shareButtonIsEnabled: true,
                cancelButtonIsEnabled: true,
                topText: nil,
                bottomText: nil,
                image: image
            )
        )
    }
}
