//
//  ViewController.swift
//  School Kit
//
//  Created by Yasoob  Rasheed on 7/10/15.
//  Copyright © 2015 Yasoob Rasheed. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
//    var block1 = UIView()
//    
//    var animator : UIDynamicAnimator? = nil
//    let gravity = UIGravityBehavior()
//    let collider = UICollisionBehavior()
    
    var animator : UIDynamicAnimator!
    var gravity : UIGravityBehavior!
    
//    func createAnimatorStuff() {
//        animator = UIDynamicAnimator(referenceView: self.view)
//        animator?.addBehavior(collider)
//        collider.addItem(block1)
//        //collider.translatesReferenceBoundsIntoBoundary = true
//
//        gravity.addItem(block1)
//        gravity.gravityDirection = CGVectorMake(0, 1)
//        animator?.addBehavior(gravity)
//    }
//    
//    
//    func addBox(location: CGRect) {
//        let newBlock = UIView(frame: location)
//        newBlock.backgroundColor = UIColor.redColor()
//        view.insertSubview(newBlock, atIndex: 0)
//        block1 = newBlock
//    }


    override func viewDidLoad() {
        super.viewDidLoad()
        //self.barrier.removeFromSuperview()
//        addBox(CGRectMake(0, -700, 380, 668))
//        createAnimatorStuff()
//        let block = UIView(frame: CGRect(x: 0, y: -700, width: 380, height: 668))
//        block.backgroundColor = UIColor.magentaColor()
//        view.addSubview(block)
//        animator = UIDynamicAnimator(referenceView: view)
//        gravity = UIGravityBehavior(items: [block])
//        gravity.gravityDirection = CGVectorMake(0, 2)
//        animator.addBehavior(gravity)
//        let collision = UICollisionBehavior(items: [block, barrier])
//        collision.collisionMode = .Everything
//        collision.addBoundaryWithIdentifier("bottomCollision", fromPoint: CGPointMake(0, self.view.frame.height + 200), toPoint: CGPointMake(self.view.frame.width, self.view.frame.height + 200))
//        collision.translatesReferenceBoundsIntoBoundary = false
//        animator.addBehavior(collision)
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

