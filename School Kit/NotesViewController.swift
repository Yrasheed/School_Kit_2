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
    
    var imagePicker: UIImagePickerController!

    override func viewDidLoad() {
        super.viewDidLoad()
        
        imagePicker = UIImagePickerController()
        imagePicker.delegate = self

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */
    @IBAction func cameraButtonTapped(sender: UIBarButtonItem) {
        
        let actionSheet = UIAlertController(title: "camera", message: "camera or photo library", preferredStyle: .ActionSheet)
        let cameraAction = UIAlertAction(title: "camera", style: .Default) { (action) -> Void in
            if UIImagePickerController.isSourceTypeAvailable(UIImagePickerControllerSourceType.Camera) {
                self.imagePicker.sourceType = .Camera
                self.presentViewController(self.imagePicker, animated: true, completion: nil)
            }
        }
        let libraryAction = UIAlertAction(title: "Library", style: .Default) { (action) -> Void in
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
        
        
        func imagePickerController(picker: UIImagePickerController, didFinishPickingImage info: [String : AnyObject]) {
            dismissViewControllerAnimated(true) { () -> Void in
                if let image = info[UIImagePickerControllerOriginalImage] as? UIImage {
                    self.imageView.image = image
                }
            }
        }
    }
    @IBAction func onScreenTapped(sender: AnyObject) {
        view.endEditing(true)
    }

}
