//
//  CanvasView.swift
//  FingerPaint
//
//  Created by yrom on 14-10-31.
//  Copyright (c) 2014年 yrom. All rights reserved.
//

import UIKit

class CanvasView: UIView {
    let zigzag = [(100,100),
                  (100,150),(150,150),
                            (150,200)]

    var currentColor: UIColor! = UIColor.blackColor() {
        willSet(color){
            println("will set \(color)")
        }
        didSet{
            if currentColor != oldValue {
                println("Set color \(currentColor) from \(oldValue)")
                setNeedsDisplay()
            }
        }
        
    }
    override func drawRect(rect: CGRect) {
       
        // Get the drawing context.
        let context = UIGraphicsGetCurrentContext()
        
        CGContextBeginPath(context)
        
        CGContextMoveToPoint(context, CGFloat( zigzag.first!.0), CGFloat( zigzag.first!.1))
        
        for var index = 1; index < zigzag.count; ++index {
            
            CGContextAddLineToPoint(context, CGFloat(zigzag[index].0), CGFloat(zigzag[index].1))
        }
        
        // Configure the drawing environment.
        CGContextSetStrokeColorWithColor(context,UIColor.redColor().CGColor)
        
        // Request the system to draw.
        CGContextStrokePath(context)
        
    }

    
}
