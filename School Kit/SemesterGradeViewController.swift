//
//  SemesterGradeViewController.swift
//  School Kit
//
//  Created by Yasoob  Rasheed on 7/14/15.
//  Copyright © 2015 Yasoob Rasheed. All rights reserved.
//

import UIKit

class SemesterGradeViewController: UIViewController {
    
    @IBOutlet weak var addButton1: UIButton!
    @IBOutlet weak var addButton2: UIButton!
    @IBOutlet weak var addButton3: UIButton!
    @IBOutlet weak var addButton4: UIButton!
    @IBOutlet weak var updateButton: UIButton!
    @IBOutlet weak var recordYourGrades: UIButton!
    
    
    @IBOutlet weak var newGradeCorrectTF: UITextField!
    @IBOutlet weak var newGradeTotalTF: UITextField!
    @IBOutlet weak var overallCorrectLabel: UILabel!
    @IBOutlet weak var overallTotalLabel: UILabel!
    @IBOutlet weak var overallGradeLabel: UILabel!
    
    
    @IBOutlet weak var newGradeCorrectTF2: UITextField!
    @IBOutlet weak var newGradeTotalTF2: UITextField!
    @IBOutlet weak var overallCorrectLabel2: UILabel!
    @IBOutlet weak var overallTotalLabel2: UILabel!
    @IBOutlet weak var overallGradeLabel2: UILabel!
    
    
    @IBOutlet weak var homeworkWeightTF: UITextField!
    @IBOutlet weak var testsWeightTF: UITextField!
    @IBOutlet weak var classGradeLabel: UILabel!
    @IBOutlet weak var classGradeLabel2: UILabel!
    @IBOutlet weak var completeGradeLabel: UILabel!
    
    @IBOutlet weak var newGradeCorrectTF3: UITextField!
    @IBOutlet weak var newGradeTotalTF3: UITextField!
    @IBOutlet weak var overallCorrectLabel3: UILabel!
    @IBOutlet weak var overallTotalLabel3: UILabel!
    @IBOutlet weak var overallGradeLabel3: UILabel!
    
    @IBOutlet weak var newGradeCorrectTF4: UITextField!
    @IBOutlet weak var newGradeTotalTF4: UITextField!
    @IBOutlet weak var overallCorrectLabel4: UILabel!
    @IBOutlet weak var overallTotalLabel4: UILabel!
    @IBOutlet weak var overallGradeLabel4: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        buttonFormatter(addButton1)
        buttonFormatter(addButton2)
        buttonFormatter(addButton3)
        buttonFormatter(addButton4)
        buttonFormatter(updateButton)
        buttonFormatter(recordYourGrades)
    }
    
    func buttonFormatter(button: UIButton) {
        button.layer.borderColor = CGColorCreate(CGColorSpaceCreateDeviceRGB(), [51/225, 153/225, 1.0, 1.0])
        button.layer.borderWidth = CGFloat(1.5)
        button.layer.cornerRadius = 15
        //(red: 51, green: 153, blue: 255)
    }
    
    @IBAction func onGoButtonTapped(sender: UIButton) {
        let newGradeCorrect = Double(newGradeCorrectTF.text!)
        let overallCorrect  = Double(overallCorrectLabel.text!)
        let newGradeTotal = Double(newGradeTotalTF.text!)
        let overallTotal = Double(overallTotalLabel.text!)
        
        overallCorrectLabel.text! = "\(newGradeCorrect! + overallCorrect!)"
        
        overallTotalLabel.text! = "\(newGradeTotal! + overallTotal!)"
        
        let updatedOverallCorrect = Double(overallCorrectLabel.text!)
        let updatedOverallTotal = Double(overallTotalLabel.text!)
        let overallGradeLabelValue = ((updatedOverallCorrect! / updatedOverallTotal!) * 100)
        let formattedOverallGradeLabelValue = NSString(format: "%.2f", overallGradeLabelValue)
        
        overallGradeLabel.text! = "\(formattedOverallGradeLabelValue)%"
        
        newGradeCorrectTF.text! = ""
        newGradeTotalTF.text! = ""
        
        self.view.endEditing(true)
    }
    
    @IBAction func onGoButtonTapped2(sender: UIButton) {
        let newGradeCorrect2 = Double(newGradeCorrectTF2.text!)
        let overallCorrect2  = Double(overallCorrectLabel2.text!)
        let newGradeTotal2 = Double(newGradeTotalTF2.text!)
        let overallTotal2 = Double(overallTotalLabel2.text!)
        
        overallCorrectLabel2.text! = "\(newGradeCorrect2! + overallCorrect2!)"
        
        overallTotalLabel2.text! = "\(newGradeTotal2! + overallTotal2!)"
        
        let updatedOverallCorrect2 = Double(overallCorrectLabel2.text!)
        let updatedOverallTotal2 = Double(overallTotalLabel2.text!)
        let overallGradeLabelValue2 = ((updatedOverallCorrect2! / updatedOverallTotal2!) * 100)
        let formattedOverallGradeLabelValue2 = NSString(format: "%.2f", overallGradeLabelValue2)
        
        overallGradeLabel2.text! = "\(formattedOverallGradeLabelValue2)%"
        
        newGradeCorrectTF2.text! = ""
        newGradeTotalTF2.text! = ""
        
        self.view.endEditing(true)
    }
    
    @IBAction func onGoButtonTapped3(sender: UIButton) {
        
        let newGradeCorrect3 = Double(newGradeCorrectTF3.text!)
        let overallCorrect3  = Double(overallCorrectLabel3.text!)
        let newGradeTotal3 = Double(newGradeTotalTF3.text!)
        let overallTotal3 = Double(overallTotalLabel3.text!)
        
        overallCorrectLabel3.text! = "\(newGradeCorrect3! + overallCorrect3!)"
        
        overallTotalLabel3.text! = "\(newGradeTotal3! + overallTotal3!)"
        
        let updatedOverallCorrect3 = Double(overallCorrectLabel3.text!)
        let updatedOverallTotal3 = Double(overallTotalLabel3.text!)
        let overallGradeLabelValue3 = ((updatedOverallCorrect3! / updatedOverallTotal3!) * 100)
        let formattedOverallGradeLabelValue3 = NSString(format: "%.2f", overallGradeLabelValue3)
        
        overallGradeLabel3.text! = "\(formattedOverallGradeLabelValue3)%"
        
        newGradeCorrectTF3.text! = ""
        newGradeTotalTF3.text! = ""
        
        self.view.endEditing(true)
    }
    
    @IBAction func onGoButtonTapped4(sender: UIButton) {
        
        let newGradeCorrect4 = Double(newGradeCorrectTF4.text!)
        let overallCorrect4  = Double(overallCorrectLabel4.text!)
        let newGradeTotal4 = Double(newGradeTotalTF4.text!)
        let overallTotal4 = Double(overallTotalLabel4.text!)
        
        overallCorrectLabel4.text! = "\(newGradeCorrect4! + overallCorrect4!)"
        
        overallTotalLabel4.text! = "\(newGradeTotal4! + overallTotal4!)"
        
        let updatedOverallCorrect4 = Double(overallCorrectLabel4.text!)
        let updatedOverallTotal4 = Double(overallTotalLabel4.text!)
        let overallGradeLabelValue4 = ((updatedOverallCorrect4! / updatedOverallTotal4!) * 100)
        let formattedOverallGradeLabelValue4 = NSString(format: "%.2f", overallGradeLabelValue4)
        
        overallGradeLabel4.text! = "\(formattedOverallGradeLabelValue4)%"
        
        newGradeCorrectTF4.text! = ""
        newGradeTotalTF4.text! = ""
        
        self.view.endEditing(true)
    }
    
    
    
    @IBAction func calcGradeButton(sender: UIButton) {
        if Double(homeworkWeightTF.text!)! + Double(testsWeightTF.text!)! != 100 {
            completeGradeLabel.text = "ERR"
        }
        
        let homeworkWeightValue = Double(homeworkWeightTF.text!)
        let testsWeightValue = Double(testsWeightTF.text!)
        let updatedHomeworkValue = homeworkWeightValue! / 100
        let updatedTestsValue = testsWeightValue! / 100
        
        let updatedOverallCorrect = Double(overallCorrectLabel.text!)
        let updatedOverallTotal = Double(overallTotalLabel.text!)
        let overallGradeLabelValue = ((updatedOverallCorrect! / updatedOverallTotal!) * 100)
        
        let updatedOverallCorrect2 = Double(overallCorrectLabel2.text!)
        let updatedOverallTotal2 = Double(overallTotalLabel2.text!)
        let overallGradeLabelValue2 = ((updatedOverallCorrect2! / updatedOverallTotal2!) * 100)
        
        let classGradeValue = (updatedHomeworkValue * overallGradeLabelValue) + (updatedTestsValue * overallGradeLabelValue2)
        let formattedClassGradeValue = NSString(format: "%.2f", classGradeValue)
        
        let updatedOverallCorrect3 = Double(overallCorrectLabel3.text!)
        let updatedOverallTotal3 = Double(overallTotalLabel3.text!)
        let overallGradeLabelValue3 = ((updatedOverallCorrect3! / updatedOverallTotal3!) * 100)
        
        let updatedOverallCorrect4 = Double(overallCorrectLabel4.text!)
        let updatedOverallTotal4 = Double(overallTotalLabel4.text!)
        let overallGradeLabelValue4 = ((updatedOverallCorrect4! / updatedOverallTotal4!) * 100)
        
        let classGradeValue2 = (updatedHomeworkValue * overallGradeLabelValue3) + (updatedTestsValue * overallGradeLabelValue4)
        let formattedClassGradeValue2 = NSString(format: "%.2f", classGradeValue2)
        
        let completeGradeValue = (classGradeValue + classGradeValue2) / 2
        let formattedCompleteGradeValue = NSString(format: "%.2f", completeGradeValue)
        
        if (formattedClassGradeValue != "nan") {
            classGradeLabel.text! = "\(formattedClassGradeValue)%"
        }
        if (formattedClassGradeValue2 != "nan") {
            classGradeLabel2.text! = "\(formattedClassGradeValue2)%"
        }
        if (formattedCompleteGradeValue != "nan") {
            completeGradeLabel.text! = "\(formattedCompleteGradeValue)%"
        }
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
}
