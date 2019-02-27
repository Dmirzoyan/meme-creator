//
//  ViewController.swift
//  MemeMe
//
//  Created by Davit Mirzoyan on 2/3/19.
//  Copyright © 2019 Udacity. All rights reserved.
//

import UIKit

protocol ImageEditorInteracting {
    
    func setInitialView()
    func openImagePicker(
        with sourceType: UIImagePickerController.SourceType,
        delegate: UIImagePickerControllerDelegate & UINavigationControllerDelegate
    )
    func closeImagePicker()
    func share(_ image: UIImage)
    func save(_ userText: UserText)
    func setSelected(_ image: UIImage)
    func dismiss()
}

final class ImageEditorViewController: UIViewController {

    @IBOutlet weak var topTextField: UITextField!
    @IBOutlet weak var bottomTextField: UITextField!
    @IBOutlet weak var imagePickerView: UIImageView!
    @IBOutlet weak var toolbar: UIToolbar!
    @IBOutlet weak var cameraButton: UIBarButtonItem!

    var interactor: ImageEditorInteracting!
    
    private var textAttributes: [NSAttributedString.Key: Any] {
        return [
            NSAttributedString.Key.strokeColor: UIColor.black,
            NSAttributedString.Key.strokeWidth: -2,
            NSAttributedString.Key.foregroundColor: UIColor.white,
            NSAttributedString.Key.font: UIFont(name: "HelveticaNeue-CondensedBlack", size: 40)!
        ]
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        cameraButton.isEnabled = UIImagePickerController.isSourceTypeAvailable(.camera) ? true : false
        applyStyle()
        setup(topTextField)
        setup(bottomTextField)
        addNavigationBarButtons()
        
        interactor.setInitialView()
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
        view.backgroundColor = UIColor.AppTheme.darkGrey
        applyNavigationBarStyle()
    }
    
    private func applyNavigationBarStyle() {
        guard let navigationBar = navigationController?.navigationBar
        else { return }
        
        navigationBar.barStyle = .blackTranslucent
        navigationBar.barTintColor = UIColor.AppTheme.darkGrey
    }
    
    private func setup(_ textField: UITextField) {
        textField.defaultTextAttributes = textAttributes
        textField.textAlignment = .center
        textField.delegate = self
    }
    
    private func addNavigationBarButtons() {
        addShareButton()
        addCancelButton()
    }
    
    private func addShareButton() {
        let shareButton = UIBarButtonItem(
            barButtonSystemItem: .action,
            target: self,
            action: #selector(share(_:))
        )
        shareButton.tintColor = .white
        navigationItem.leftBarButtonItem = shareButton
    }
    
    private func addCancelButton() {
        let cancelButton = UIBarButtonItem(
            barButtonSystemItem: .cancel,
            target: self,
            action: #selector(cancel(_:))
        )
        cancelButton.tintColor = .white
        navigationItem.rightBarButtonItem = cancelButton
    }
    
    @IBAction func selectAnImageFromLibrary(_ sender: Any) {
        interactor.openImagePicker(with: .photoLibrary, delegate: self)
    }
    
    @IBAction func takeAPhoto(_ sender: Any) {
        interactor.openImagePicker(with: .camera, delegate: self)
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

extension ImageEditorViewController {
    
    @objc private func share(_ sender: Any) {
        if let image = generateEditedImage() {
            interactor.save(UserText(top: topTextField.text, bottom: bottomTextField.text))
            interactor.share(image)
        }
    }
    
    @objc private func cancel(_ sender: Any) {
        interactor.dismiss()
    }
    
    private func generateEditedImage() -> UIImage? {
        toolbar.isHidden = true
        
        UIGraphicsBeginImageContext(self.view.frame.size)
        view.drawHierarchy(in: self.view.frame, afterScreenUpdates: true)
        let editedImage = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        
        toolbar.isHidden = false
        
        return editedImage
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

extension ImageEditorViewController: ImageEditorDisplaying {
    
    func apply(_ viewState: ImageEditorViewState) {
        imagePickerView.image = viewState.image
        
        navigationItem.leftBarButtonItem?.isEnabled = viewState.shareButtonIsEnabled
        navigationItem.rightBarButtonItem?.isEnabled = viewState.cancelButtonIsEnabled
        
        if let topText = viewState.topText {
            topTextField.text = topText
        }
        if let bottomText = viewState.bottomText {
            bottomTextField.text = bottomText
        }
    }
}
