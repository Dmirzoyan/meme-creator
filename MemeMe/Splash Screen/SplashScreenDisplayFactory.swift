//
//  SplashScreenDisplayFactory.swift
//  MemeMe
//
//  Created by Davit Mirzoyan on 3/5/19.
//  Copyright © 2019 Udacity. All rights reserved.
//

import UIKit

protocol SplashScreenDisplayProducing {
    func make(router: SplashScreenInternalRoute) -> UIViewController
}

final class SplashScreenDisplayFactory: SplashScreenDisplayProducing {
    
    func make(router: SplashScreenInternalRoute) -> UIViewController {
        let viewController = SplashScreenViewController()
        let interactor = SplashScreenInteractor(router: router)
        viewController.interactor = interactor
        
        return viewController
    }
}
