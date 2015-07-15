//
//  NotesViewController.swift
//  School Kit
//
//  Created by mia willett on 7/15/15.
//  Copyright © 2015 Yasoob Rasheed. All rights reserved.
//

import UIKit

class NotesViewController: UIViewController, UINavigationControllerDelegate, UIImagePickerControllerDelegate,
UITextFieldDelegate{
    
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var textView: UITextView!
    
    var imagePicker = UIImagePickerController()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.navigationController?.navigationBar.hidden = false
        
        imagePicker.delegate = self
        
        // Do any additional setup after loading the view.
    }
    
    
    

    @IBAction func cameraButtonTapped(sender: UIBarButtonItem) {
        
        //let picker = UIImagePickerController()
        imagePicker.delegate = self
        let actionSheet = UIAlertController(title: "camera", message: "camera or photo library", preferredStyle: .ActionSheet)
        
        let cameraAction = UIAlertAction(title: "camera", style: .Default) { (action) -> Void in
            if UIImagePickerController.isSourceTypeAvailable(UIImagePickerControllerSourceType.Camera) {
                self.imagePicker.sourceType = .Camera
                self.presentViewController(self.imagePicker, animated: true, completion: nil)
            }
        }
        
        let libraryAction = UIAlertAction(title: "library", style: .Default) { (action) -> Void in
            self.imagePicker.sourceType = .PhotoLibrary
            self.presentViewController(self.imagePicker, animated: true, completion: nil)
        }
        
        let cancelAction = UIAlertAction(title: "cancel", style: .Cancel) { (action) -> Void in
            self.dismissViewControllerAnimated(true, completion: nil)
        }
        
        actionSheet.addAction(cameraAction)
        actionSheet.addAction(libraryAction)
        actionSheet.addAction(cancelAction)
        self.presentViewController(actionSheet, animated: true, completion: nil)
    }
    
    func imagePickerController(picker: UIImagePickerController, didFinishPickingImage image: UIImage, editingInfo: [String : AnyObject]?) {
        
        self.imageView.image = image
        picker.dismissViewControllerAnimated(true, completion: nil)
    }
    
    @IBAction func onScreenTapped(sender: AnyObject) {
        view.endEditing(true)
    }
}


