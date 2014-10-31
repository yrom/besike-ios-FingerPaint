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
    var paths = [Path]()
    var currentColor: UIColor! = UIColor.blackColor() {
        didSet{
            if currentColor != oldValue {
                println("Set color \(currentColor) from \(oldValue)")
                setNeedsDisplay()
            }
        }
        
    }
    override func drawRect(rect: CGRect) {
        for path in paths {
            if path.points.isEmpty {
                continue
            }
            drawPath(path)
        }

        
//      ======
//        // Get the drawing context.
//        let context = UIGraphicsGetCurrentContext()
//        
//        CGContextBeginPath(context)
//        
//        CGContextMoveToPoint(context, CGFloat( zigzag.first!.0), CGFloat( zigzag.first!.1))
//        
//        for var index = 1; index < zigzag.count; ++index {
//            
//            CGContextAddLineToPoint(context, CGFloat(zigzag[index].0), CGFloat(zigzag[index].1))
//        }
//        
//        // Configure the drawing environment.
//        CGContextSetStrokeColorWithColor(context,UIColor.redColor().CGColor)
//        
//        // Request the system to draw.
//        CGContextStrokePath(context)
        
    }

    func drawPath(path: Path) {
        let context = UIGraphicsGetCurrentContext()
        CGContextBeginPath(context)
        CGContextMoveToPoint(context, path.points.first!.x, path.points.first!.y)
        
        for index in 1..<path.points.count {
            let point: CGPoint = path.points[index]
            CGContextAddLineToPoint(context, point.x, point.y)
        }
        CGContextSetStrokeColorWithColor(context, path.color.CGColor)
        CGContextStrokePath(context)
    }
    
    func clearPaths(){
        paths.removeAll(keepCapacity: false)
        // redrawn
        setNeedsDisplay()
    }
    
    override func touchesBegan(touches: NSSet, withEvent event: UIEvent) {
        let t = touches.anyObject() as UITouch
        let point = t.locationInView(self)
        println("touch: \(point)")
        let newPath = Path(color: currentColor)
        newPath.add(point)
        paths.append(newPath)
    }
    
    override func touchesMoved(touches: NSSet, withEvent event: UIEvent) {
        let t = touches.anyObject() as UITouch
        let point = t.locationInView(self)
        println("moved: \(point)")
        let path = paths.last
        path?.add(point)
        setNeedsDisplay()
    }

    override func touchesEnded(touches: NSSet, withEvent event: UIEvent) {
        let t = touches.anyObject() as UITouch
        let point = t.locationInView(self)
        println("ended: \(point)")
        let path = paths.last
        path?.add(point)
        setNeedsDisplay()
    }
}
