//
//  ImageEditorRouter.swift
//  MemeMe
//
//  Created by Davit Mirzoyan on 2/3/19.
//  Copyright © 2019 Udacity. All rights reserved.
//

import UIKit

typealias ShareCompletion = (Bool) -> Void

protocol ImageEditorInternalRouting {
    
    func openImagePicker(with sourceType: UIImagePickerController.SourceType)
    func closeImagePicker()
    func share(_ image: UIImage, completion: @escaping ShareCompletion)
}

final class ImageEditorRouter: ImageEditorInternalRouting {
    
    private let display: UIViewController
    private let imagePickerDelegate: UIImagePickerControllerDelegate & UINavigationControllerDelegate
    
    init(
        display: UIViewController,
        imagePickerDelegate: UIImagePickerControllerDelegate & UINavigationControllerDelegate
    ) {
        self.display = display
        self.imagePickerDelegate = imagePickerDelegate
    }
    
    func openImagePicker(with sourceType: UIImagePickerController.SourceType) {
        let imagePickerController = UIImagePickerController()
        imagePickerController.sourceType = sourceType
        imagePickerController.delegate = imagePickerDelegate
        
        display.present(imagePickerController, animated: true, completion: nil)
    }
    
    func closeImagePicker() {
        display.dismiss(animated: true, completion: nil)
    }
    
    func share(_ image: UIImage, completion: @escaping ShareCompletion) {
        let activityViewController = UIActivityViewController(activityItems: [image], applicationActivities: nil)
        
        activityViewController.completionWithItemsHandler = { _, success, _, _ in
            completion(success)
        }
        
        display.present(activityViewController, animated: true, completion: nil)
    }
}
