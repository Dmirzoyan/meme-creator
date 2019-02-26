//
//  SharedImagesListViewController.swift
//  MemeMe
//
//  Created by Davit Mirzoyan on 2/26/19.
//  Copyright © 2019 Udacity. All rights reserved.
//

import UIKit

protocol SharedImagesListInteracting {}

final class SharedImagesListViewController: UIViewController {

    var interactor: SharedImagesListInteracting!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .gray
    }
}

extension SharedImagesListViewController: SharedImagesListDisplaying {}
