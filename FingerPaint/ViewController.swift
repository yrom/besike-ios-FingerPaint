//
//  ViewController.swift
//  FingerPaint
//
//  Created by yrom on 14-10-31.
//  Copyright (c) 2014年 yrom. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var canvasView: CanvasView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let canvasView = CanvasView(frame: self.view.bounds)
        self.canvasView = canvasView
        self.canvasView.backgroundColor = UIColor.whiteColor()
        self.view.addSubview(self.canvasView)
        
        setupColorPickers()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    
    func setupColorPickers() {
        // Colors for the pickers.
        // Or you can choose a color scheme you like: https://kuler.adobe.com/explore/most-popular/
        let colors : [UIColor] = [
            // 0x000000
            UIColor(red: 0, green: 0, blue: 0, alpha: 1),
            // 0x17A3A5
            UIColor(red: 0x17/255.0, green: 0xA3/255.0, blue: 0xA5/255.0, alpha: 1),
            // 0x8DBF67
            UIColor(red: 0x8D/255.0, green: 0xBF/255.0, blue: 0x67/255.0, alpha: 1),
            // 0xFCCB5F
            UIColor(red: 0xFC/255.0, green: 0xCB/255.0, blue: 0x5F/255.0, alpha: 1),
            // 0xFC6E59
            UIColor(red: 0xFC/255.0, green: 0x6E/255.0, blue: 0x59/255.0, alpha: 1),
        ]
        
        
        // (x,y)
        let positions = [
            (33,43),(86,43),(138,43),(190,43),(242,43)
        ]
        
        // size
        let size = (44,44)
        
        
        for i in 0..<positions.count {
            let (x,y) = positions[i]
            let color = colors[i]
            let button = UIButton(frame: CGRect(x: x, y: y, width: size.0, height: size.1))
            button.backgroundColor = color
            button.layer.shadowColor = UIColor(white: 0.4, alpha: 1).CGColor
            button.layer.shadowOffset = CGSize(width: 0, height: 0)
            button.layer.shadowRadius = 0
            button.layer.shadowOpacity = 1
            button.addTarget(self, action: "colorPickerTapped:", forControlEvents: UIControlEvents.TouchUpInside)
            self.view.addSubview(button)
        }
    }
    var tappedBtn: UIButton?
    func colorPickerTapped(button: UIButton) {
        println("tapped: \(button.backgroundColor)")
        self.canvasView.currentColor = button.backgroundColor!
        button.layer.shadowRadius = 3
        tappedBtn?.layer.shadowRadius = 0
        tappedBtn = button
    }

}

