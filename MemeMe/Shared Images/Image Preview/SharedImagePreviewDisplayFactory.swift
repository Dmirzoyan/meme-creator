//
//  SharedImagePreviewDisplayFactory.swift
//  MemeMe
//
//  Created by Davit Mirzoyan on 3/3/19.
//  Copyright © 2019 Udacity. All rights reserved.
//

import UIKit

protocol SharedImagePreviewDisplayProducing {
    func make(router: SharedImagePreviewInternalRoute) -> UIViewController
}

final class SharedImagePreviewDisplayFactory: SharedImagePreviewDisplayProducing {
    
    private let image: UIImage
    
    init(image: UIImage) {
        self.image = image
    }
    
    func make(router: SharedImagePreviewInternalRoute) -> UIViewController {
        let viewController = SharedImagePreviewViewController()
        let presenter = SharedImagePreviewPresenter(display: viewController)
        
        let interactor = SharedImagePreviewInteractor(
            router: router,
            presenter: presenter,
            image: image
        )
        
        viewController.interactor = interactor
        
        return viewController
    }
}
