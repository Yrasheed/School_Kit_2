//
//  ClassSelectionViewController.swift
//  School Kit
//
//  Created by Yasoob  Rasheed on 7/11/15.
//  Copyright © 2015 Yasoob Rasheed. All rights reserved.
//

import UIKit
import CoreData

class ClassSelectionViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    @IBOutlet weak var optionsButton: UIBarButtonItem!
    @IBOutlet weak var classSelectionTableView: UITableView!
    
    //var classes = ["Math", "Chemistry", "Economics"]
    //var teachers = ["Mr. Calvin", "Mrs. Leroy", "Mr. Fox"]
    var classes = [NSManagedObject]()
    //var teachers = [NSManagedObject]()
    let managedContext = (UIApplication.sharedApplication().delegate as! AppDelegate).managedObjectContext
    
    override func viewDidLoad() {
        self.navigationController?.navigationBar.hidden = false
        super.viewDidLoad()
        optionsButton.tag = 0
    }
    
    override func viewWillAppear(animated: Bool) {
        let appDelegate = UIApplication.sharedApplication().delegate as! AppDelegate
        let fetchResult = NSFetchRequest(entityName: "Class")
        //let secondFetchResult = NSFetchRequest(entityName: "Class")
        do {
            let fetchResults = try self.managedContext.executeFetchRequest(fetchResult) as! [NSManagedObject]
            //let secondFetchResults = try self.managedContext.executeFetchRequest(secondFetchResult) as! [NSManagedObject]
            classes = fetchResults
            //teachers = secondFetchResults
        } catch let fetchError as NSError {
            print(fetchError)
        }
        classSelectionTableView.reloadData()
    }
    
//    func saveTableCellTeacher(name: String) {
//        let appDelegate = UIApplication.sharedApplication().delegate as! AppDelegate
//        let entity = NSEntityDescription.entityForName("Class", inManagedObjectContext: managedContext)
//        let teacher = NSManagedObject(entity: entity!, insertIntoManagedObjectContext: managedContext)
//        do {
//            teacher.setValue(name, forKey: "teachers")
//            try self.managedContext.save()
//        } catch {
//            print(error)
//        }
//        classes.append(teacher)
//    }
    
    
    func saveTableCellClass(name: String) {
        let appDelegate = UIApplication.sharedApplication().delegate as! AppDelegate
        let entity = NSEntityDescription.entityForName("Class", inManagedObjectContext: managedContext)
        let oneClass = NSManagedObject(entity: entity!, insertIntoManagedObjectContext: managedContext)
        do {
            oneClass.setValue(name, forKey: "classes")
            try self.managedContext.save()
        } catch {
            print(error)
        }
        classes.append(oneClass)
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return classes.count
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("MyCell", forIndexPath: indexPath) as UITableViewCell
        //        cell.textLabel?.text = classes[indexPath.row]
        //        cell.detailTextLabel?.text = teachers[indexPath.row]
        //        return cell
        let Oneclass = classes[indexPath.row]
        //let teacher = teachers[indexPath.row]
        cell.textLabel!.text = Oneclass.valueForKey("classes") as? String
        //cell.detailTextLabel!.text = teacher.valueForKey("teachers") as? String
        return cell
    }
    
    func tableView(tableView: UITableView, commitEditingStyle editingStyle: UITableViewCellEditingStyle, forRowAtIndexPath indexPath: NSIndexPath) {
        if editingStyle == UITableViewCellEditingStyle.Delete {
            classes.removeAtIndex(indexPath.row)
            //teachers.removeAtIndex(indexPath.row)
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
//        alert.addTextFieldWithConfigurationHandler { (textField) -> Void in
//            textField.placeholder = "Enter Teacher Name"
//        }
        let addAction = UIAlertAction(title: "Add Class", style: UIAlertActionStyle.Default, handler: {(action) -> Void in
            let classTextField = alert.textFields![0] as UITextField
            ////self.classes.append(classTextField.text!)
            //let teacherTextField = alert.textFields![1] as UITextField
            ////self.teachers.append(teacherTextField.text!)
            self.saveTableCellClass(classTextField.text!)
            //self.saveTableCellTeacher(teacherTextField.text!)
            
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
