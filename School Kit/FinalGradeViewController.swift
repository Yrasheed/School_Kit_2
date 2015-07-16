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
    @IBOutlet weak var calculateButton: UIButton!
    @IBOutlet weak var textView: UITextView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        buttonFormatter(calculateButton)
    }
    
    func buttonFormatter(button: UIButton) {
        button.layer.borderColor = CGColorCreate(CGColorSpaceCreateDeviceRGB(), [51/225, 153/225, 1.0, 1.0])
        button.layer.borderWidth = CGFloat(1.5)
        button.layer.cornerRadius = 15
        //(red: 51, green: 153, blue: 255)
    }
    
    @IBAction func calcGradeButton(sender: UIButton) {
        
        let x = Double(classGradeTF.text!)
        let y = Double(gradeWantedTF.text!)
        let a = Double(finalWeightTF.text!)! / 100
        let ax = a*x!
        let topPart = ax - x! + y!
        let z = topPart / a
        let formattedZ = NSString(format: "%.2f", z)
        
        textView.text = "You need a \(formattedZ)% on the final to get a \(gradeWantedTF.text!)% in the class!"
        
        self.view.endEditing(true)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
}
