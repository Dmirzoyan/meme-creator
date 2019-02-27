//
//  SharedImagesListViewController.swift
//  MemeMe
//
//  Created by Davit Mirzoyan on 2/26/19.
//  Copyright © 2019 Udacity. All rights reserved.
//

import UIKit

protocol SharedImagesListInteracting {
    func goToImageEditor()
}

final class SharedImagesListViewController: UIViewController {

    var interactor: SharedImagesListInteracting!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        applyStyle()
        addCreateImageButton()
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
    
    private func addCreateImageButton() {
        let createImageButton = UIBarButtonItem(
            barButtonSystemItem: .add,
            target: self,
            action: #selector(createImageButtonTaped(_:))
        )
        createImageButton.tintColor = .white
        navigationItem.rightBarButtonItem = createImageButton
    }
    
    @objc private func createImageButtonTaped(_ sender: Any) {
        interactor.goToImageEditor()
    }
    
    override var preferredStatusBarStyle: UIStatusBarStyle {
        return .lightContent
    }
}

extension SharedImagesListViewController: SharedImagesListDisplaying {}
