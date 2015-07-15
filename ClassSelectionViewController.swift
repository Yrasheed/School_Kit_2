//
//  ClassSelectionViewController.swift
//  School Kit
//
//  Created by Yasoob  Rasheed on 7/11/15.
//  Copyright © 2015 Yasoob Rasheed. All rights reserved.
//

import UIKit

class ClassSelectionViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {

    @IBOutlet weak var optionsButton: UIBarButtonItem!
    @IBOutlet weak var classSelectionTableView: UITableView!
    
    var classes = ["Math", "Chemistry", "Economics"]
    var teachers = ["Mr. Calvin", "Mrs. Leroy", "Mr. Fox"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        optionsButton.tag = 0    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return classes.count
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("MyCell", forIndexPath: indexPath) as UITableViewCell
        cell.textLabel?.text = classes[indexPath.row]
        cell.detailTextLabel?.text = teachers[indexPath.row]
        return cell
    }
    
    func tableView(tableView: UITableView, commitEditingStyle editingStyle: UITableViewCellEditingStyle, forRowAtIndexPath indexPath: NSIndexPath) {
        if editingStyle == UITableViewCellEditingStyle.Delete {
            classes.removeAtIndex(indexPath.row)
            teachers.removeAtIndex(indexPath.row)
            tableView.reloadData()
        }
    }
    
    func tableView(tableView: UITableView, canMoveRowAtIndexPath indexPath: NSIndexPath) -> Bool {
        return true
    }
    
    func tableView(tableView: UITableView, moveRowAtIndexPath sourceIndexPath: NSIndexPath, toIndexPath destinationIndexPath: NSIndexPath) {
        let oneClass = classes[sourceIndexPath.row]
        classes.removeAtIndex(sourceIndexPath.row)
        classes.insert(oneClass, atIndex: destinationIndexPath.row)
    }
    
    @IBAction func onTappedOptionsButton(sender: UIBarButtonItem) {
        let alert = UIAlertController(title: "Add Class or Edit Order?", message: nil, preferredStyle: UIAlertControllerStyle.Alert)
        alert.addTextFieldWithConfigurationHandler { (textField) -> Void in
            textField.placeholder = "Enter Class Name"
        }
        alert.addTextFieldWithConfigurationHandler { (textField) -> Void in
            textField.placeholder = "Enter Teacher Name"
        }
        let addAction = UIAlertAction(title: "Add Class", style: UIAlertActionStyle.Default, handler: {(action) -> Void in
            let classTextField = alert.textFields![0] as UITextField
            self.classes.append(classTextField.text!)
            let teacherTextField = alert.textFields![1] as UITextField
            self.teachers.append(teacherTextField.text!)
            self.classSelectionTableView.reloadData()
        })
        alert.addAction(addAction)
        let editAction = UIAlertAction(title: "Edit Order", style: UIAlertActionStyle.Default) { (action) -> Void in
            if sender.tag == 0 {
                self.classSelectionTableView.editing = true
                self.optionsButton.tag = 1
            } else {
                self.classSelectionTableView.editing = false
                self.optionsButton.tag = 0
            }
        }
        alert.addAction(editAction)
        
        self.presentViewController(alert, animated: true, completion: nil)
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        let dvc = segue.destinationViewController as! GradeCalcViewController
        let index = classSelectionTableView.indexPathForSelectedRow?.row
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
}
