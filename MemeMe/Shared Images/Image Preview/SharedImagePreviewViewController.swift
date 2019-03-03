//
//  SharedImagePreviewViewController.swift
//  MemeMe
//
//  Created by Davit Mirzoyan on 3/3/19.
//  Copyright © 2019 Udacity. All rights reserved.
//

import UIKit

protocol SharedImagePreviewInteracting {
    func presentImage()
}

final class SharedImagePreviewViewController: UIViewController {
    
    @IBOutlet weak var imageView: UIImageView!
    var interactor: SharedImagePreviewInteracting!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        applyStyle()
        applyNavigationBarStyle()
        
        interactor.presentImage()
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
        navigationBar.tintColor = .white
    }
}

extension SharedImagePreviewViewController: SharedImagePreviewDisplaying {
    
    func display(_ image: UIImage) {
        imageView.image = image
    }
}
