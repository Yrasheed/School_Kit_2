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
        let blueSwiftColor = UIColor(red: 51, green: 153, blue: 255)
        textView.textColor = blueSwiftColor
        self.navigationController?.navigationBar.hidden = false
        imagePicker.delegate = self
    }
    
    override func viewWillDisappear(animated: Bool) {
        self.navigationController?.navigationBar.hidden = true
    }
    
    
    @IBAction func cameraButtonTapped(sender: UIBarButtonItem) {
        imagePicker.delegate = self
        let actionSheet = UIAlertController(title: nil, message: nil, preferredStyle: .ActionSheet)
        
        let cameraAction = UIAlertAction(title: "Take your own photo", style: .Default) { (action) -> Void in
            if UIImagePickerController.isSourceTypeAvailable(UIImagePickerControllerSourceType.Camera) {
                self.imagePicker.sourceType = .Camera
                self.presentViewController(self.imagePicker, animated: true, completion: { () -> Void in
                    self.navigationController?.navigationBar.hidden = false
                })
            }
        }
        
        let libraryAction = UIAlertAction(title: "Access the photo library", style: .Default) { (action) -> Void in
            self.imagePicker.sourceType = .PhotoLibrary
            self.presentViewController(self.imagePicker, animated: true, completion: { (action) -> Void in
                self.navigationController?.navigationBar.hidden = false
            })
        }
        
        let cancelAction = UIAlertAction(title: "Cancel", style: .Cancel) { (action) -> Void in
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


