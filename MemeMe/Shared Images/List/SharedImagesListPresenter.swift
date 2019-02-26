//
//  SharedImagesListPresenter.swift
//  MemeMe
//
//  Created by Davit Mirzoyan on 2/26/19.
//  Copyright © 2019 Udacity. All rights reserved.
//

import UIKit

protocol SharedImagesListDisplaying {}

final class SharedImagesListPresenter: SharedImagesListPresenting {
    
    private let display: SharedImagesListDisplaying
    
    init(display: SharedImagesListDisplaying) {
        self.display = display
    }
}
