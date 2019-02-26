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
        
        addCreateImageButton()
        view.backgroundColor = .gray
    }
    
    private func addCreateImageButton() {
        let createImageButton = UIBarButtonItem(
            barButtonSystemItem: .add,
            target: self,
            action: #selector(createImageButtonTaped(_:))
        )
        navigationItem.rightBarButtonItem = createImageButton
    }
    
    @objc private func createImageButtonTaped(_ sender: Any) {
        interactor.goToImageEditor()
    }
}

extension SharedImagesListViewController: SharedImagesListDisplaying {}
