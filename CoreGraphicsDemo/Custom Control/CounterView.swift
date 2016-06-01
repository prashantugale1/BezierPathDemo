//
//  CounterView.swift
//  CoreGraphicsDemo
//
//  Created by Prashant Ugale on 01/06/16.
//  Copyright © 2016 Leftshift Technologies. All rights reserved.
//

import UIKit

let π:CGFloat = CGFloat(M_PI)

@IBDesignable class CounterView: UIView {
    
    let noOfPercentage = 20
    
    @IBInspectable var counter: Int = 5 {
        didSet {
            if counter <= noOfPercentage {
                setNeedsDisplay()
            }
        }
        
        willSet {
            
        }
    }
    @IBInspectable var outlineColor: UIColor = UIColor.blueColor()
    @IBInspectable var counterColor: UIColor = UIColor.orangeColor()
    
    override func drawRect(rect: CGRect) {
        // Get center of view
        let center = CGPoint(x:bounds.width/2, y: bounds.height/2)
        
        // Get radius for arc
        let radius: CGFloat = max(bounds.width, bounds.height)
        
        // Set width for arc
        let arcWidth: CGFloat = 70
        
        // Set starting point
        let startAngle: CGFloat =  3 * π / 4
        
        // Set end point
        let endAngle: CGFloat = π / 4
        
        // Draw path
        let path = UIBezierPath(arcCenter: center, radius: radius/2 - arcWidth/2, startAngle: startAngle, endAngle: endAngle, clockwise: true)
        
        path.lineWidth = arcWidth
        counterColor.setStroke()
        path.stroke()
        
        // Get total length
        let angleDiffrence:CGFloat = 2 * π - startAngle + endAngle
        
        // Get lenth per Percentage
        let arcLengthPerPercentage = angleDiffrence / CGFloat(noOfPercentage)
        
        // Get angle for total selected percentage
        let outlineEndAngle = arcLengthPerPercentage * CGFloat(counter) + startAngle
        
        // Draw outer arc
        let outlinePath = UIBezierPath(arcCenter: center, radius: bounds.width/2 - 2.5, startAngle: startAngle, endAngle: outlineEndAngle, clockwise: true)
        
        // Draw inner arc
        outlinePath.addArcWithCenter(center, radius: bounds.width/2 - arcWidth + 3, startAngle: outlineEndAngle, endAngle: startAngle, clockwise: false)
        
        // Close path
        outlinePath.closePath()
        
        outlineColor.setStroke()
        outlinePath.lineWidth = 5.0
        outlinePath.stroke()
        
    }

}
