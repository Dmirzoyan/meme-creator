//
//  SplashScreenViewController.swift
//  MemeMe
//
//  Created by Davit Mirzoyan on 3/5/19.
//  Copyright © 2019 Udacity. All rights reserved.
//

import UIKit

protocol SplashScreenInteracting {
    func initializeServicesAndStart()
}

final class SplashScreenViewController: UIViewController {

    var interactor: SplashScreenInteracting!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        applyStyle()
        interactor.initializeServicesAndStart()
    }
    
    private func applyStyle() {
        view.backgroundColor = UIColor.AppTheme.darkGrey
    }
}
