//
//  ViewController.swift
//  MemeMe
//
//  Created by Davit Mirzoyan on 2/3/19.
//  Copyright © 2019 Udacity. All rights reserved.
//

import UIKit

protocol ImageEditorInteracting {
}

class ImageEditorViewController: UIViewController {

    @IBOutlet weak var topTextField: UITextField!
    @IBOutlet weak var bottomTextField: UITextField!
    @IBOutlet weak var imagePickerView: UIImageView!
    @IBOutlet weak var toolbar: UIToolbar!
    @IBOutlet weak var cameraButton: UIBarButtonItem!
    
    private let isCameraAvailable = UIImagePickerController.isSourceTypeAvailable(.camera) ? true : false
    private var interactor: ImageEditorInteracting {
        return ImageEditorInteractor(router: ImageEditorRouter(display: self))
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        cameraButton.isEnabled = isCameraAvailable
    }
    
    @IBAction func selectAnImageFromLibrary(_ sender: Any) {
        openImagePicker()
    }
    
    @IBAction func takeAPhoto(_ sender: Any) {
    }
    
    private func openImagePicker() {
        let imagePickerController = UIImagePickerController()
        imagePickerController.sourceType = .photoLibrary
        imagePickerController.delegate = self
        
        present(imagePickerController, animated: true, completion: nil)
    }
}
