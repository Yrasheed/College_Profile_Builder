//
//  DetailViewController.swift
//  College Profile Builder
//
//  Created by Yasoob  Rasheed on 7/6/15.
//  Copyright © 2015 Yasoob Rasheed. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController, UINavigationControllerDelegate, UIImagePickerControllerDelegate {
    
    @IBOutlet weak var myImageView: UIImageView!
    @IBOutlet weak var nameTextField: UITextField!
    @IBOutlet weak var cityTextField: UITextField!
    @IBOutlet weak var stateTextField: UITextField!
    @IBOutlet weak var enrollmentTextField: UITextField!
    @IBOutlet weak var urlTextField: UITextField!
    
    var college : College!
    var imagePicker : UIImagePickerController!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        nameTextField.text = college.name
        cityTextField.text = college.city
        stateTextField.text = college.state
        enrollmentTextField.text = String(college.enrollment)
        myImageView.image = college.image
        urlTextField.text = String(college.webURL!)
        imagePicker = UIImagePickerController()
        imagePicker.delegate = self
    }
    
    @IBAction func onTappedLinkButton(sender: UIButton) {
        UIApplication.sharedApplication().openURL(NSURL(string: urlTextField.text!)!)
    }
    
    @IBAction func onTappedSaveButton(sender: UIButton) {
        college.name = nameTextField.text!
        college.city = cityTextField.text!
        college.state = stateTextField.text!
        college.enrollment = Double(enrollmentTextField.text!)!
        college.webURL = NSURL(string: urlTextField.text!)!
    }
    
    @IBAction func onTappedCameraButton(sender: UIBarButtonItem) {
        
        if UIImagePickerController.isSourceTypeAvailable(UIImagePickerControllerSourceType.Camera) {
            imagePicker.sourceType = UIImagePickerControllerSourceType.Camera
        } else {
            imagePicker.sourceType = UIImagePickerControllerSourceType.PhotoLibrary
        }
        
        self.presentViewController(imagePicker, animated: true, completion: nil)
    }
    
    func imagePickerController(picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : AnyObject]) {
        dismissViewControllerAnimated(true) { () -> Void in
            if let image = info [UIImagePickerControllerOriginalImage] as? UIImage {
                self.myImageView.image = image
            }
        }
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
}













