//
//  Path.swift
//  FingerPaint
//
//  Created by yrom on 14-10-31.
//  Copyright (c) 2014年 yrom. All rights reserved.
//

import UIKit

class Path {
    var points: [CGPoint] = []
    let color: UIColor
    init(color: UIColor) {
        self.color = color
    }
    
    func add(point: CGPoint) {
        points.append(point)
    }
}
