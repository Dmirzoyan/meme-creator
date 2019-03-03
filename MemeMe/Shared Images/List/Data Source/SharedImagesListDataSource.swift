//
//  SharedImagesListDataSource.swift
//  MemeMe
//
//  Created by Davit Mirzoyan on 2/28/19.
//  Copyright © 2019 Udacity. All rights reserved.
//

import UIKit

protocol SharedImagesListDataProviding {
    func set(_ images: [Meme])
    func image(for indexPath: IndexPath) -> UIImage?
}

final class SharedImagesListDataSource: NSObject, UITableViewDataSource {
    
    private var sharedImages: [Meme]?
        
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return sharedImages?.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(
            withIdentifier: "SharedImagesListCell", for: indexPath
        ) as! SharedImagesListCell
        
        cell.sharedImageView.image = sharedImages?[indexPath.row].originalImage
        cell.topLabel.text = sharedImages?[indexPath.row].topText
        cell.bottomLabel.text = sharedImages?[indexPath.row].bottomText
        
        return cell
    }
}

extension SharedImagesListDataSource: SharedImagesListDataProviding {
    
    func set(_ images: [Meme]) {
        sharedImages = images
    }
    
    func image(for indexPath: IndexPath) -> UIImage? {
        return sharedImages?[indexPath.row].editedImage
    }
}
