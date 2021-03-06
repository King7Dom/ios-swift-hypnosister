//
//  HypnosisView.swift
//  Hypnosister-Swift
//
//  Created by Dominic Cheung on 7/10/2015.
//  Copyright © 2015 Big Nerd Ranch. All rights reserved.
//

import UIKit

class HypnosisView: UIView {
    
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
    }

}
