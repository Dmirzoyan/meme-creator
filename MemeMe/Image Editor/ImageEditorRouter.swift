//
//  ImageEditorRouter.swift
//  MemeMe
//
//  Created by Davit Mirzoyan on 2/3/19.
//  Copyright © 2019 Udacity. All rights reserved.
//

import UIKit

typealias ShareCompletion = (Bool) -> Void

protocol ImageEditorRouting {
    func start()
}

protocol ImageEditorInternalRouting {
    
    func openImagePicker(
        with sourceType: UIImagePickerController.SourceType,
        delegate: UIImagePickerControllerDelegate & UINavigationControllerDelegate
    )
    func closeImagePicker()
    func share(_ image: UIImage, completion: @escaping ShareCompletion)
    func dismiss()
}

final class ImageEditorRouter: ImageEditorRouting {
    
    private let navigationController: UINavigationController
    private let displayFactory: ImageEditorDisplayProducing
    private var viewController: UIViewController?
    
    init(
        navigationController: UINavigationController,
        displayFactory: ImageEditorDisplayProducing
    ) {
        self.navigationController = navigationController
        self.displayFactory =  displayFactory
    }
    
    func start() {
        viewController = displayFactory.make(router: self)
        
        guard let viewController = viewController
        else { return }
        
        let navigationControllerWrapper = UINavigationController(rootViewController: viewController)
        navigationController.present(navigationControllerWrapper, animated: true, completion: nil)
    }
}

extension ImageEditorRouter: ImageEditorInternalRouting {
    
    func openImagePicker(
        with sourceType: UIImagePickerController.SourceType,
        delegate: UIImagePickerControllerDelegate & UINavigationControllerDelegate
    ) {
        let imagePickerController = UIImagePickerController()
        imagePickerController.sourceType = sourceType
        imagePickerController.delegate = delegate
        
        viewController?.present(imagePickerController, animated: true, completion: nil)
    }
    
    func closeImagePicker() {
        viewController?.dismiss(animated: true, completion: nil)
    }
    
    func share(_ image: UIImage, completion: @escaping ShareCompletion) {
        let activityViewController = UIActivityViewController(activityItems: [image], applicationActivities: nil)
        
        activityViewController.completionWithItemsHandler = { _, success, _, _ in
            completion(success)
        }
        
        viewController?.present(activityViewController, animated: true, completion: nil)
    }
    
    func dismiss() {
        viewController?.dismiss(animated: true, completion: nil)
    }
}
