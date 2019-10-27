//
//  ViewController.swift
//  Provid
//
//  Created by Hong Ngoc Do on 10/26/19.
//  Copyright © 2019 Hong Ngoc Do. All rights reserved.
//

import UIKit
import WebKit // possibly for the javascript reference:
import Photos


class ViewController: UIViewController, UITextFieldDelegate {
    
    @IBOutlet weak var desiredRatio: UITextField!
    @IBOutlet weak var desiredLength: UITextField!
    @IBOutlet weak var desiredWidth: UITextField!
    @IBOutlet var testButton: UITextField!
    
    var imagePicker = UIImagePickerController()
    
    @IBAction func AddImageButton(UIButton : UIButton) {
        
        let status = PHPhotoLibrary.authorizationStatus()

        //
        if status == .notDetermined  {
        PHPhotoLibrary.requestAuthorization({status in
            })
        }
        
        // Verify the authorization
        if (status == .authorized) {
             // Access has been granted.
            imagePicker.modalPresentationStyle = UIModalPresentationStyle.currentContext
            imagePicker.delegate = self as? UIImagePickerControllerDelegate & UINavigationControllerDelegate
            self.present(imagePicker, animated: true, completion: nil)
        }
        
        
        
    }
    
    
    
    
    // Pick the image
    func imagePickerController(picker: UIImagePickerController!, didFinishPickingMediaWithInfo info:NSDictionary!) {
        let tempImage = info[UIImagePickerController.InfoKey.originalImage] as! UIImage
        // this is your image - use it for cloud or wehatever here
        print(tempImage)
        self.dismiss(animated: true, completion: nil)
    }

    func imagePickerControllerDidCancel(picker: UIImagePickerController!) {

self.dismiss(animated: true, completion: nil)// self.performsActionsWhilePresentingModally(true)
    }

    
    override func viewDidLoad() {
        super.viewDidLoad()
        desiredRatio.delegate = self
        desiredLength.delegate = self
        desiredWidth.delegate = self
        
        let alert = UIAlertController(title: "My Alert", message: "This is an alert.", preferredStyle: .alert)
        
        alert.addAction(UIAlertAction(title: NSLocalizedString("OK", comment: "Default action"), style: .default, handler: { _ in
        NSLog("The \"OK\" alert occured.")
        }))
        
        self.present(alert, animated: true, completion: nil)
        // Do any additional setup after loading the view.
        
    }
    
}
