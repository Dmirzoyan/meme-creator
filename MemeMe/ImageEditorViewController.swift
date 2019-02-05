//
//  ViewController.swift
//  MemeMe
//
//  Created by Davit Mirzoyan on 2/3/19.
//  Copyright © 2019 Udacity. All rights reserved.
//

import UIKit

protocol ImageEditorInteracting {
    
    func openImagePicker()
    func closeImagePicker()
    func share(_ image: UIImage)
    func setSelected(_ image: UIImage)
}

final class ImageEditorViewController: UIViewController {

    @IBOutlet weak var topTextField: UITextField!
    @IBOutlet weak var bottomTextField: UITextField!
    @IBOutlet weak var imagePickerView: UIImageView!
    @IBOutlet weak var toolbar: UIToolbar!
    @IBOutlet weak var cameraButton: UIBarButtonItem!
    
    private let isCameraAvailable = UIImagePickerController.isSourceTypeAvailable(.camera) ? true : false
    
    private var interactor: ImageEditorInteracting {
        return ImageEditorInteractor(
            router: ImageEditorRouter(display: self, imagePickerDelegate: self),
            presenter: ImageEditorPresenter(display: self)
        )
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
        addShareButton()
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
    
    private func addShareButton() {
        let shareButton = UIBarButtonItem(
            barButtonSystemItem: .action,
            target: self,
            action: #selector(share)
        )
        navigationItem.leftBarButtonItem = shareButton
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
        interactor.openImagePicker()
    }
    
    @IBAction func takeAPhoto(_ sender: Any) {}
    
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

extension ImageEditorViewController {
    
    @objc func share() {
        if let image = generateEditedImage() {
            interactor.share(image)
        }
    }
    
    func generateEditedImage() -> UIImage? {
        toolbar.isHidden = true
        
        UIGraphicsBeginImageContext(self.view.frame.size)
        view.drawHierarchy(in: self.view.frame, afterScreenUpdates: true)
        let editedImage = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        
        toolbar.isHidden = false
        
        return editedImage
    }
}

extension ImageEditorViewController: ImageEditorDisplaying {
    func display(_ image: UIImage) {
        imagePickerView.image = image
    }
}

extension ImageEditorViewController: UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    
    func imagePickerController(
        _ picker: UIImagePickerController,
        didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]
        ) {
        if let image = info[.originalImage] as? UIImage {
            interactor.setSelected(image)
            interactor.closeImagePicker()
        }
    }
    
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        interactor.closeImagePicker()
    }
}
