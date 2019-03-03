//
//  SharedImagesGridDataSource.swift
//  MemeMe
//
//  Created by Davit Mirzoyan on 3/3/19.
//  Copyright © 2019 Udacity. All rights reserved.
//

import UIKit

protocol SharedImagesGridDataProviding {
    func set(_ images: [UIImage])
    func image(for indexPath: IndexPath) -> UIImage?
}

final class SharedImagesGridDataSource: NSObject, UICollectionViewDataSource {
    
    private var sharedImages: [UIImage]?
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return sharedImages?.count ?? 0
    }
    
    func collectionView(
        _ collectionView: UICollectionView,
        cellForItemAt indexPath: IndexPath
    ) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(
            withReuseIdentifier: "SharedImagesGridCell", for: indexPath
        ) as! SharedImagesGridCell
        
        cell.sharedImageView.image = sharedImages?[indexPath.row]
        
        return cell
    }
}

extension SharedImagesGridDataSource: SharedImagesGridDataProviding {
 
    func set(_ images: [UIImage]) {
        sharedImages = images
    }
    
    func image(for indexPath: IndexPath) -> UIImage? {
        return sharedImages?[indexPath.row]
    }
}
