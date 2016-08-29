//
//  CusomTextField.swift
//  Homepwner
//
//  Created by jyotishankar sahoo on 29/08/16.
//  Copyright © 2016 jyotishankar sahoo. All rights reserved.
//

import UIKit

class CusomTextField: UITextField {

    /*
    // Only override drawRect: if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func drawRect(rect: CGRect) {
        // Drawing code
    }
    */
    override func becomeFirstResponder() -> Bool {
        super.becomeFirstResponder()
        self.borderStyle = .Line
        return true
    }
    
    override func resignFirstResponder() -> Bool {
        super.resignFirstResponder()
        self.borderStyle = .RoundedRect
        return true
    }
}
