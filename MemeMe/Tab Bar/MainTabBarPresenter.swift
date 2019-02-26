//
//  MainTabBarPresenter.swift
//  MemeMe
//
//  Created by Davit Mirzoyan on 2/26/19.
//  Copyright © 2019 Udacity. All rights reserved.
//

import UIKit

protocol MainTabBarDisplaying {}

final class MainTabBarPresenter: MainTabBarPresenting {
    
    private let display: MainTabBarDisplaying
    
    init(display: MainTabBarDisplaying) {
        self.display = display
    }
}
