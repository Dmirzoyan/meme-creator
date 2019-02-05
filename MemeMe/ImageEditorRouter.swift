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
    func share(_ image: UIImage, completion: @escaping ShareCompletion)
}

final class ImageEditorRouter: ImageEditorInternalRouting {
    
    private let display: UIViewController
    
    init(display: UIViewController) {
        self.display = display
    }
    
    func share(_ image: UIImage, completion: @escaping ShareCompletion) {
        let activityViewController = UIActivityViewController(activityItems: [image], applicationActivities: nil)
        
        activityViewController.completionWithItemsHandler = { _, success, _, _ in
            completion(success)
        }
        
        display.present(activityViewController, animated: true, completion: nil)
    }
}
