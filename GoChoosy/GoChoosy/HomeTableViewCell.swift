//
//  HomeTableViewCell.swift
//  GoChoosy
//
//  Created by Jyoti Shankar Sahoo on 17/08/16.
//  Copyright © 2016 com.jyoti. All rights reserved.
//

import UIKit

class HomeTableViewCell: UITableViewCell {
    

    @IBOutlet weak var vendorThumnailImage: UIImageView!
    
    @IBOutlet weak var vendorNameLabel: UILabel!
    
    @IBOutlet weak var vendorDetailsLabel: UILabel!

    override func awakeFromNib() {
                super.awakeFromNib()
        // Initialization code
//        let gradient: CAGradientLayer = CAGradientLayer()
//        gradient.frame = self.bounds
//        gradient.colors = [UIColor.whiteColor().CGColor, UIColor.blackColor().CGColor]
//        self.layer.insertSublayer(gradient, atIndex: 0)

    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
