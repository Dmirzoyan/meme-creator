//
//  ImageEditorRouter.swift
//  MemeMe
//
//  Created by Davit Mirzoyan on 2/3/19.
//  Copyright © 2019 Udacity. All rights reserved.
//

import UIKit

protocol ImageEditorInternalRouting {
}

final class ImageEditorRouter: ImageEditorInternalRouting {
    
    private let display: UIViewController
    
    init(display: UIViewController) {
        self.display = display
    }
}
