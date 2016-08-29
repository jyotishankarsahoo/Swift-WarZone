//
//  ItemCell.swift
//  Homepwner
//
//  Created by jyotishankar sahoo on 29/08/16.
//  Copyright © 2016 jyotishankar sahoo. All rights reserved.
//

import UIKit

class ItemCell: UITableViewCell {

    @IBOutlet weak var nameLabel : UILabel!
    @IBOutlet weak var serialNumberLabel : UILabel!
    @IBOutlet weak var valueLabel : UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func updateFont(){
        let bodyFont =  UIFont.preferredFontForTextStyle(UIFontTextStyleBody)
        nameLabel.font = bodyFont
        valueLabel.font = bodyFont
        let captionFont = UIFont.preferredFontForTextStyle(UIFontTextStyleCaption1)
        serialNumberLabel.font = captionFont
    }
    
    func updateValueLabel(value : Double){
        if value < 50 {
            valueLabel.textColor = UIColor.greenColor()
        }else{
            valueLabel.textColor = UIColor.redColor()
        }
    }

}
