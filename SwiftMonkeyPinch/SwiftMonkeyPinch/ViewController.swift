//
//  ViewController.swift
//  SwiftMonkeyPinch
//
//  Created by Jafhar Sharief B on 04/01/17.
//  Copyright © 2017 Jafhar Sharief B. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var obj2ImgView: UIImageView!

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func handlePanGesture(_ sender: UIPanGestureRecognizer) {
        if let view = sender.view {
            let translation = sender.translation(in: self.view)

            view.center = CGPoint(x: view.center.x + translation.x, y: view.center.y + translation.y)
            sender.setTranslation(CGPoint.zero, in: self.view)
            let isObjIntersected = view.frame.intersects(obj2ImgView.frame)
            if isObjIntersected == true {
                hideSecondObject()
            }
            else {
                showSecondObject()
            }
        }
    }
    
    func hideSecondObject() {
        self.obj2ImgView.isHidden = true
    }
    
    func showSecondObject() {
        self.obj2ImgView.isHidden = false
    }
}

