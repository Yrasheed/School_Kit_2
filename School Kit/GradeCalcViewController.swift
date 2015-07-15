//
//  GradeCalcViewController.swift
//  School Kit
//
//  Created by Yasoob  Rasheed on 7/13/15.
//  Copyright © 2015 Yasoob Rasheed. All rights reserved.
//

import UIKit

class GradeCalcViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    var calculators = ["Track Semester Grades", "Track Trimester Grades", "What do I need on the final?"]
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return calculators.count
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCellWithIdentifier("MyCell2", forIndexPath: indexPath)
        cell.textLabel?.text = calculators[indexPath.row]
        return cell
    }
    
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        let selectedIndex = indexPath.row
        if selectedIndex == 0 {
            performSegueWithIdentifier("semesterPush", sender: self)
        } else if selectedIndex == 1 {
            performSegueWithIdentifier("trimesterPush", sender: self)
        } else if selectedIndex == 2 {
            performSegueWithIdentifier("finalPush", sender: self)
        }
    }
    
    
}

