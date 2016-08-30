//
//  CustomCrossHairView.swift
//  Homepwner
//
//  Created by jyotishankar sahoo on 30/08/16.
//  Copyright © 2016 jyotishankar sahoo. All rights reserved.
//

import UIKit

class CustomCrossHairView: UIView {

    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
   convenience required init?(coder aDecoder: NSCoder) {
    self.init(frame : CGRectZero)
    }
    // Only override drawRect: if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func drawRect(rect: CGRect) {
        let path = UIBezierPath()
        
        // Vertical
        path.moveToPoint(CGPointMake(center.x, center.y - 20))
        path.addLineToPoint(CGPointMake(center.x, center.y + 20))
        
        // Horizontal
        path.moveToPoint(CGPointMake(center.x - 20, center.y))
        path.addLineToPoint(CGPointMake(center.x + 20, center.y))
        
        UIColor.blueColor().setStroke()
        path.stroke()
    }

}
