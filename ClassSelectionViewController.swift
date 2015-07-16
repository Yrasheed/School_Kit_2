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
    
    var classes = [NSManagedObject]()
    let managedContext = (UIApplication.sharedApplication().delegate as! AppDelegate).managedObjectContext
    
    override func viewDidLoad() {
        self.navigationController?.navigationBar.hidden = false
        super.viewDidLoad()
        optionsButton.tag = 0
        classSelectionTableView.tableFooterView = UIView(frame: CGRectZero)
    }
    
    override func viewWillAppear(animated: Bool) {
        let appDelegate = UIApplication.sharedApplication().delegate as! AppDelegate
        let fetchResult = NSFetchRequest(entityName: "Class")
        do {
            let fetchResults = try self.managedContext.executeFetchRequest(fetchResult) as! [NSManagedObject]
            classes = fetchResults
        } catch let fetchError as NSError {
            print(fetchError)
        }
        classSelectionTableView.reloadData()
    }
    
    override func viewWillDisappear(animated: Bool) {
        self.navigationController?.navigationBar.hidden = true
    }
    
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
        let oneClass = classes[indexPath.row]
        cell.textLabel!.text = oneClass.valueForKey("classes") as? String
        let blueSwiftColor = UIColor(red: 51, green: 153, blue: 255)
        if indexPath.row % 2 == 0 {
            cell.backgroundColor = blueSwiftColor
            cell.textLabel?.textColor = UIColor.whiteColor()
        } else {
            cell.backgroundColor = UIColor.whiteColor()
            cell.textLabel?.textColor = blueSwiftColor
        }
        
        return cell
    }
  
    func tableView(tableView: UITableView, commitEditingStyle editingStyle: UITableViewCellEditingStyle, forRowAtIndexPath indexPath: NSIndexPath) {
        if editingStyle == UITableViewCellEditingStyle.Delete {
            let removeOneClass = classes[indexPath.row] 
            managedContext.deleteObject(removeOneClass)
            do {
                try managedContext.save()
            } catch {}
            classes.removeAtIndex(indexPath.row)
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
        let addAction = UIAlertAction(title: "Add Class", style: UIAlertActionStyle.Default, handler: {(action) -> Void in
            let classTextField = alert.textFields![0] as UITextField
            self.saveTableCellClass(classTextField.text!)
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
