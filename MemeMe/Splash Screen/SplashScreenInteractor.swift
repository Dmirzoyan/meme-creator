//
//  SplashScreenInteractor.swift
//  MemeMe
//
//  Created by Davit Mirzoyan on 3/5/19.
//  Copyright © 2019 Udacity. All rights reserved.
//

import UIKit

final class SplashScreenInteractor: SplashScreenInteracting {
    
    private let router: SplashScreenInternalRoute
    
    init(router: SplashScreenInternalRoute) {
        self.router = router
    }
    
    func initializeServicesAndStart() {
        loadImagesFromStore()
        router.goToTabBar()
    }
    
    private func loadImagesFromStore() {
        Dependencies.imageStorageManager.loadImagesFromStore()
    }
}
