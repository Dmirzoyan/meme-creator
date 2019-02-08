//
//  ImageEditorDisplayFactory.swift
//  MemeMe
//
//  Created by Davit Mirzoyan on 2/7/19.
//  Copyright © 2019 Udacity. All rights reserved.
//

import UIKit

protocol ImageEditorDisplayProducing {
    func make(router: ImageEditorInternalRouting) -> UIViewController
}

final class ImageEditorDisplayFactory: ImageEditorDisplayProducing {
    
    func make(router: ImageEditorInternalRouting) -> UIViewController {
        let viewController = ImageEditorViewController()
        let presenter = ImageEditorPresenter(display: viewController)
        
        let interactor = ImageEditorInteractor(
            router: router,
            presenter: presenter
        )
        
        viewController.interactor = interactor
        
        return viewController
    }
}
