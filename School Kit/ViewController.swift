//
//  ViewController.swift
//  School Kit
//
//  Created by Yasoob  Rasheed on 7/10/15.
//  Copyright © 2015 Yasoob Rasheed. All rights reserved.
//

import UIKit

extension UIColor {
    convenience init(red: Int, green: Int, blue: Int) {
        let newRed = CGFloat(red)/255
        let newGreen = CGFloat(green)/255
        let newBlue = CGFloat(blue)/255
        
        self.init(red: newRed, green: newGreen, blue: newBlue, alpha: 0.9)
    }
}

class ViewController: UIViewController {
    
    @IBOutlet weak var getStartedButton: UIButton!

    var animator : UIDynamicAnimator!
    var gravity : UIGravityBehavior!
    var cgWhite : CGColor!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        getStartedButton.layer.borderColor = CGColorCreate(CGColorSpaceCreateDeviceRGB(), [1.0, 1.0, 1.0, 1.0])
        getStartedButton.layer.borderWidth = CGFloat(2)
        getStartedButton.layer.cornerRadius = 30
        
        let block = UIView(frame: CGRect(x: 0, y: -700, width: 380, height: 668))
        let greenSwiftColor = UIColor(red: 160, green: 235, blue: 75)
        block.backgroundColor = greenSwiftColor
        view.addSubview(block)
        view.sendSubviewToBack(block)
        
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
        
        //borderwidth
        //bordercolor
        //green r188 g255 b121
        //blue r179 g242 b252
        //yellow r242 g242 b99
        // Dispose of any resources that can be recreated.
    }


}

