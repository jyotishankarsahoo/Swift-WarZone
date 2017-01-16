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
    var currentLines = [NSValue : Line]()
    
    func strokeLine(line : Line){
        let path = UIBezierPath()
        path.lineWidth = 5
        path.lineCapStyle = CGLineCap.round
        path.move(to: line.begin)
        path.addLine(to: line.end)
        path.stroke()
    }
    
    override func draw(_ rect: CGRect) {
        // For Single touch
        /*
        UIColor.black.setStroke()
        for line in finishedLine {
            self.strokeLine(line: line)
        }
        if let line = currentLine{
            UIColor.red.setStroke()
            self.strokeLine(line: line)
        }
         */
        // Multiple touches
        UIColor.black.setStroke()
        for line in finishedLine {
            self.strokeLine(line: line)
        }
        UIColor.red.setStroke()
        for ( _,line) in currentLines{
            self.strokeLine(line: line)
        }
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        // For Single touch
        /*
        let touch = touches.first!
        let location = touch.location(in: self)
        currentLine = Line(begin: location, end: location)
        setNeedsDisplay()
         */
        
        // Multiple touches
        for touch in touches {
            let location = touch.location(in: self)
            let newLine = Line(begin: location, end: location)
            let key = NSValue(nonretainedObject: touch)
            currentLines[key] = newLine
        }
        setNeedsDisplay()
    }
    
    override func touchesMoved(_ touches: Set<UITouch>, with event: UIEvent?) {
        // For Single touch
        /*
        let touch = touches.first!
        let location = touch.location(in: self)
        currentLine?.end = location
        setNeedsDisplay()
         */
        
        // Multiple touches
        for touch in touches {
            let location = touch.location(in: self)
            let key = NSValue(nonretainedObject : touch)
            currentLines[key]?.end = location
        }
        setNeedsDisplay()
    }
    
    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        //For Single Touch
        /*
        if var line = currentLine{
            let touch = touches.first!
            let location = touch.location(in: self)
            line.end = location
            finishedLine.append(line)
        }
        currentLine = nil
        setNeedsDisplay()
         */
        
        //For multiple touches
        for touch in touches {
            let key = NSValue(nonretainedObject : touch)
            if var line = currentLines[key]{
                line.end = touch.location(in: self)
                finishedLine.append(line)
                currentLines.removeValue(forKey: key)
            }
            setNeedsDisplay()
        }
    }
 
    override func touchesCancelled(_ touches: Set<UITouch>, with event: UIEvent?) {
        currentLines.removeAll()
        setNeedsDisplay()
    }
        
}
