//
//  DrawView.swift
//  TouchTracker
//
//  Created by jyotishankar sahoo on 13/01/17.
//  Copyright © 2017 jyotishankar sahoo. All rights reserved.
//

import Foundation
import UIKit

class DrawView: UIView {
    
    var currentLine : Line?
    var finishedLine = [Line]()
    
    func strokeLine(line : Line){
        let path = UIBezierPath()
        path.lineWidth = 5
        path.lineCapStyle = CGLineCap.round
        path.move(to: line.begin)
        path.addLine(to: line.end)
        path.stroke()
    }
    
    override func draw(_ rect: CGRect) {
        UIColor.black.setStroke()
        for line in finishedLine {
            self.strokeLine(line: line)
        }
        if let line = currentLine{
            UIColor.red.setStroke()
            self.strokeLine(line: line)
        }
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        let touch = touches.first!
        let location = touch.location(in: self)
        currentLine = Line(begin: location, end: location)
        setNeedsDisplay()
    }
    
    override func touchesMoved(_ touches: Set<UITouch>, with event: UIEvent?) {
        let touch = touches.first!
        let location = touch.location(in: self)
        currentLine?.end = location
        setNeedsDisplay()
    }
    
    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        if var line = currentLine{
            let touch = touches.first!
            let location = touch.location(in: self)
            line.end = location
            finishedLine.append(line)
        }
        currentLine = nil
        setNeedsDisplay()
    }
}
