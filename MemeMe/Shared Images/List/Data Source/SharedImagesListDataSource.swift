//
//  SharedImagesListDataSource.swift
//  MemeMe
//
//  Created by Davit Mirzoyan on 2/28/19.
//  Copyright © 2019 Udacity. All rights reserved.
//

import UIKit

protocol SharedImagesListDataProviding {
    func set(_ images: [SharedImage])
    func image(for indexPath: IndexPath) -> UIImage?
}

final class SharedImagesListDataSource: NSObject, UITableViewDataSource {
    
    private var sharedImages: [SharedImage]?
        
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
        setImageTintColor(for: cell)
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            sharedImages?.remove(at: indexPath.row)
            tableView.deleteRows(at: [indexPath], with: .bottom)
        }
    }
    
    private func setImageTintColor(for cell: SharedImagesListCell) {
        let templateImage = cell.chevronImageView.image?.withRenderingMode(.alwaysTemplate)
        cell.chevronImageView.image = templateImage
        cell.chevronImageView.tintColor = .white
    }
}

extension SharedImagesListDataSource: SharedImagesListDataProviding {
    
    func set(_ images: [SharedImage]) {
        sharedImages = images
    }
    
    func image(for indexPath: IndexPath) -> UIImage? {
        return sharedImages?[indexPath.row].editedImage
    }
}
