//
//  SharedImagePreviewPresenter.swift
//  MemeMe
//
//  Created by Davit Mirzoyan on 3/3/19.
//  Copyright © 2019 Udacity. All rights reserved.
//

import UIKit

protocol SharedImagePreviewDisplaying {
    func display(_ image: UIImage)
}

final class SharedImagePreviewPresenter: SharedImagePreviewPresenting {
    
    private let display: SharedImagePreviewDisplaying
    
    init(display: SharedImagePreviewDisplaying) {
        self.display = display
    }
    
    func present(_ image: UIImage) {
        display.display(image)
    }
}
