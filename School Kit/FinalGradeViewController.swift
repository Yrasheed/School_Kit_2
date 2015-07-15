//
//  FinalGradeViewController.swift
//  School Kit
//
//  Created by Yasoob  Rasheed on 7/14/15.
//  Copyright © 2015 Yasoob Rasheed. All rights reserved.
//

import UIKit

class FinalGradeViewController: UIViewController {
    
    @IBOutlet weak var finalWeightTF: UITextField!
    
    @IBOutlet weak var classGradeTF: UITextField!
    
    @IBOutlet weak var gradeWantedTF: UITextField!
    
    @IBOutlet weak var gradeNeededLabel: UILabel!

    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction func calcGradeButton(sender: UIButton) {
        
        let x = Double(classGradeTF.text!)
        let y = Double(gradeWantedTF.text!)
        let a = Double(finalWeightTF.text!)! / 100
        let ax = a*x!
        let topPart = ax - x! + y!
        let z = topPart / a
        let formattedZ = NSString(format: "%.2f", z)
        
        gradeNeededLabel.text = "You need a \(formattedZ)% on the final!"
        
        self.view.endEditing(true)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
}
