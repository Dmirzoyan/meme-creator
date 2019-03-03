//
//  SharedImagePreviewInteractor.swift
//  MemeMe
//
//  Created by Davit Mirzoyan on 3/3/19.
//  Copyright © 2019 Udacity. All rights reserved.
//

import UIKit

protocol SharedImagePreviewPresenting {
    func present(_ image: UIImage)
}

final class SharedImagePreviewInteractor: SharedImagePreviewInteracting {
    
    private let router: SharedImagePreviewInternalRoute
    private let presenter: SharedImagePreviewPresenting
    private let image: UIImage
    
    init(
        router: SharedImagePreviewInternalRoute,
        presenter: SharedImagePreviewPresenting,
        image: UIImage
    ) {
        self.router = router
        self.presenter = presenter
        self.image = image
    }
    
    func presentImage() {
        presenter.present(image)
    }
}
