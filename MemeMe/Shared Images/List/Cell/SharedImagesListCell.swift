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
    @IBOutlet weak var topLabel: UILabel!
    @IBOutlet weak var bottomLabel: UILabel!
    @IBOutlet weak var chevronImageView: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        setCellHighlightColor()
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        backgroundColor = UIColor.AppTheme.lightGrey
    }
    
    private func setCellHighlightColor() {
        let customColorView = UIView()
        customColorView.backgroundColor = UIColor.AppTheme.darkGrey
        selectedBackgroundView = customColorView
    }
}
