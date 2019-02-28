//
//  SharedImagesListCell.swift
//  MemeMe
//
//  Created by Davit Mirzoyan on 2/28/19.
//  Copyright © 2019 Udacity. All rights reserved.
//

import UIKit

final class SharedImagesListCell: UITableViewCell {
    
    @IBOutlet weak var sharedImageView: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        backgroundColor = UIColor.AppTheme.lightGrey
    }
}
