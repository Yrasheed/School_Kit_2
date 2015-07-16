//
//  ViewController.swift
//  School Kit
//
//  Created by Yasoob  Rasheed on 7/10/15.
//  Copyright © 2015 Yasoob Rasheed. All rights reserved.
//

import UIKit

extension UIColor {
    convenience init(red: Float, green: Float, blue: Float) {
        let newRed = CGFloat(red)/255
        let newGreen = CGFloat(green)/255
        let newBlue = CGFloat(blue)/255
        
        self.init(red: newRed, green: newGreen, blue: newBlue, alpha: 0.9)
    }
}

class ViewController: UIViewController {
    
    @IBOutlet weak var getStartedButton: UIButton!
    @IBOutlet weak var notesButton: UIButton!

    var animator : UIDynamicAnimator!
    var gravity : UIGravityBehavior!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationController?.navigationBar.hidden = true
        
        notesButton.layer.borderColor = CGColorCreate(CGColorSpaceCreateDeviceRGB(), [1.0, 1.0, 1.0, 1.0])
        notesButton.layer.borderWidth = CGFloat(2)
        notesButton.layer.cornerRadius = 30
        
        getStartedButton.layer.borderColor = CGColorCreate(CGColorSpaceCreateDeviceRGB(), [1.0, 1.0, 1.0, 1.0])
        getStartedButton.layer.borderWidth = CGFloat(2)
        getStartedButton.layer.cornerRadius = 30
        
        let block = UIView(frame: CGRect(x: 0, y: -700, width: 380, height: 668))
        let blueSwiftColor = UIColor(red: 51, green: 153, blue: 255)
        block.backgroundColor = blueSwiftColor
        view.addSubview(block)
        view.sendSubviewToBack(block)
        //51 153 255 for blue color
        animator = UIDynamicAnimator(referenceView: view)
        gravity = UIGravityBehavior(items: [block])
        gravity.gravityDirection = CGVectorMake(0, 2)
        animator.addBehavior(gravity)
        
        let collision = UICollisionBehavior(items: [block])
        collision.collisionMode = .Everything
        collision.addBoundaryWithIdentifier("bottomCollision", fromPoint: CGPointMake(0, self.view.frame.height + 2), toPoint: CGPointMake(self.view.frame.width, self.view.frame.height + 2))
        animator.addBehavior(collision)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}

