//
//  HypnosisView.swift
//  Hypnosister-Swift
//
//  Created by Dominic Cheung on 7/10/2015.
//  Copyright © 2015 Big Nerd Ranch. All rights reserved.
//

import UIKit

class HypnosisView: UIView {
    
    let logoImage = UIImage(named: "logo")
    
    override required init(frame: CGRect) {
        super.init(frame: frame)
        self.backgroundColor = UIColor.clearColor()
    }

    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }

    override func drawRect(rect: CGRect) {
        let bounds = self.bounds
        
        let center = CGPoint(x: bounds.origin.x + bounds.size.width / 2.0, y: bounds.origin.y + bounds.size.height / 2.0)
        let maxRadius = hypot(bounds.size.width, bounds.size.height) / 2.0
        
        let path = UIBezierPath()
        path.lineWidth = 5
        UIColor.lightGrayColor().setStroke()
        
        for var radius = CGFloat(5); radius <= maxRadius; radius += 10 {
            path.moveToPoint(CGPoint(x: center.x + radius, y: center.y))
            path.addArcWithCenter(center, radius: radius, startAngle: 0.0, endAngle: CGFloat(M_PI) * 2.0, clockwise: true)
        }
        path.stroke()
        
        let imageRect = CGRectMake(bounds.origin.x + bounds.size.width/4, bounds.origin.y + bounds.size.height/4, bounds.size.width/2, bounds.size.height/2)
        
        let currentContent = UIGraphicsGetCurrentContext()
        
        // Draw Gradient
        CGContextSaveGState(currentContent)
        
        // Draw triangle path for gradient
        let trianglePath = UIBezierPath()
        trianglePath.moveToPoint(CGPoint(x: bounds.origin.x + bounds.size.width/2.0, y: bounds.origin.x + bounds.size.height/4.0))
        trianglePath.addLineToPoint(CGPoint(x: bounds.origin.x + bounds.size.width/4.0, y: bounds.origin.x + bounds.size.height/4.0*3.0))
        trianglePath.addLineToPoint(CGPoint(x: bounds.origin.x + bounds.size.width/4.0*3.0, y: bounds.origin.x + bounds.size.height/4.0*3.0))
        trianglePath.closePath()
        trianglePath.addClip()
        
        let locations: [CGFloat] = [0.0, 1.0]
        let components: [CGFloat] = [
            1.0, 0.0, 0.0, 1.0,
            1.0, 1.0, 0.0, 1.0]
        let colorSpace = CGColorSpaceCreateDeviceRGB()
        let gradient = CGGradientCreateWithColorComponents(colorSpace, components, locations, 2)
        let startPoint = CGPoint(x: bounds.origin.x + bounds.width/4, y: bounds.origin.y + bounds.height/4)
        let endPoint = CGPoint(x: bounds.origin.x + bounds.width/4*3, y: bounds.origin.y + bounds.height/4*3)
        
        CGContextDrawLinearGradient(currentContent, gradient, startPoint, endPoint, CGGradientDrawingOptions(rawValue: 0))
        
        CGContextRestoreGState(currentContent)
        
        // Draw Drop Shadow
        CGContextSaveGState(currentContent)
        CGContextSetShadow(currentContent, CGSizeMake(4, 7), 3)
        
        self.logoImage?.drawInRect(imageRect)
        
        CGContextRestoreGState(currentContent)
    }

}
