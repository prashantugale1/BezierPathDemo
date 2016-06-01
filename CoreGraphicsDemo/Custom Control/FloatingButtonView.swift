//
//  FloatingButtonView.swift
//  CoreGraphicsDemo
//
//  Created by Prashant Ugale on 01/06/16.
//  Copyright © 2016 Leftshift Technologies. All rights reserved.
//

import UIKit

@IBDesignable class FloatingButtonView: UIButton {
    
    @IBInspectable var buttonColor:UIColor = UIColor.orangeColor()
    @IBInspectable var plusPathColor:UIColor = UIColor.whiteColor()
    @IBInspectable var plusPathThickness:CGFloat = 3
    @IBInspectable var showPlus:Bool = true

    override func drawRect(rect: CGRect) {
        let path = UIBezierPath(ovalInRect: rect)
        buttonColor.setFill()
        path.fill()
        
        let width:CGFloat = min(bounds.width, bounds.height) * 0.6
        
        let plusPath = UIBezierPath()
        plusPath.lineWidth = plusPathThickness
        
        
        plusPath.moveToPoint(CGPoint(x: bounds.width/2 - width/2, y: bounds.height/2))
        plusPath.addLineToPoint(CGPoint(x: bounds.width/2 + width/2, y: bounds.height/2))
        
        if showPlus {
            plusPath.moveToPoint(CGPoint(x: bounds.width/2, y: bounds.width/2 - width/2))
            plusPath.addLineToPoint(CGPoint(x: bounds.width/2, y: bounds.width/2 + width/2))
        }
        
        plusPathColor.setStroke()
        plusPath.stroke()
    }

}
