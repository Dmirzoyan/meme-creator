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

final class ImageEditorViewController: UIViewController {

    @IBOutlet weak var topTextField: UITextField!
    @IBOutlet weak var bottomTextField: UITextField!
    @IBOutlet weak var imagePickerView: UIImageView!
    @IBOutlet weak var toolbar: UIToolbar!
    @IBOutlet weak var cameraButton: UIBarButtonItem!
    
    private let isCameraAvailable = UIImagePickerController.isSourceTypeAvailable(.camera) ? true : false
    
    private var interactor: ImageEditorInteracting {
        return ImageEditorInteractor(router: ImageEditorRouter(display: self))
    }
    
    private var textAttributes: [NSAttributedString.Key: Any] {
        return [
            NSAttributedString.Key.strokeColor: UIColor.black,
            NSAttributedString.Key.strokeWidth: 2,
            NSAttributedString.Key.foregroundColor: UIColor.white,
            NSAttributedString.Key.font: UIFont(name: "HelveticaNeue-CondensedBlack", size: 40)!
        ]
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        cameraButton.isEnabled = isCameraAvailable
        topTextField.delegate = self
        bottomTextField.delegate = self
        
        applyStyle()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        registerForKeyboardNotifications()
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        
        resignFromKeyboardNotifications()
    }
    
    private func applyStyle() {
        applyTextFieldStyle()
    }
    
    private func applyTextFieldStyle() {
        topTextField.defaultTextAttributes = textAttributes
        bottomTextField.defaultTextAttributes = textAttributes
        topTextField.textAlignment = .center
        bottomTextField.textAlignment = .center
        topTextField.text = "TOP"
        bottomTextField.text = "BOTTOM"
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
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        view.endEditing(true)
    }
}

extension ImageEditorViewController: UITextFieldDelegate {
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
    
    func textFieldDidBeginEditing(_ textField: UITextField) {
        if textField.text == "TOP" || textField.text == "BOTTOM" {
            textField.text = ""
        }
    }
}
