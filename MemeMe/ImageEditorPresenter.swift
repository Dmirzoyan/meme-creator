//
//  ImageEditorPresenter.swift
//  MemeMe
//
//  Created by Davit Mirzoyan on 2/5/19.
//  Copyright © 2019 Udacity. All rights reserved.
//

import UIKit

protocol ImageEditorDisplaying {
    
    func display(_ image: UIImage)
}

final class ImageEditorPresenter: ImageEditorPresenting {
    
    private let display: ImageEditorDisplaying
    
    init(display: ImageEditorDisplaying) {
        self.display = display
    }
    
    func present(_ image: UIImage) {
        display.display(image)
    }
}
