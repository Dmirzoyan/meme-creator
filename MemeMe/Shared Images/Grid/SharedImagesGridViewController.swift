//
//  SharedImagesGridViewController.swift
//  MemeMe
//
//  Created by Davit Mirzoyan on 2/26/19.
//  Copyright © 2019 Udacity. All rights reserved.
//

import UIKit

protocol SharedImagesGridInteracting {}

final class SharedImagesGridViewController: UIViewController {

    var interactor: SharedImagesGridInteracting!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .blue
    }
}

extension SharedImagesGridViewController: SharedImagesGridDisplaying {}
