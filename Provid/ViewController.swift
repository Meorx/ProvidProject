//
//  ViewController.swift
//  Provid
//
//  Created by Hong Ngoc Do on 10/26/19.
//  Copyright © 2019 Hong Ngoc Do. All rights reserved.
//

import UIKit
import WebKit // possibly for the javascript reference:


class ViewController: UIViewController, UITextFieldDelegate {
    
    @IBOutlet weak var desiredRatio: UITextField!
    @IBOutlet weak var desiredLength: UITextField!
    @IBOutlet weak var desiredWidth: UITextField!
    @IBOutlet var testButton: UITextField!
    
    var imagePicker = UIImagePickerController()
    
    //@IBOutlet var imagePreview : UIImageView

    @IBAction func AddImageButton(UIButton : UIButton) {
        imagePicker.modalPresentationStyle = UIModalPresentationStyle.currentContext
        imagePicker.delegate = self as? UIImagePickerControllerDelegate & UINavigationControllerDelegate
        //self.presentModalViewController(imagePicker, animated: true)
        self.present(imagePicker, animated: true, completion: nil)
    
    }
    func imagePickerController(picker: UIImagePickerController!, didFinishPickingMediaWithInfo info:NSDictionary!) {
        let tempImage = info[UIImagePickerController.InfoKey.originalImage] as! UIImage
        // this is your image - use it for cloud or wehatever here
        print(tempImage)
        self.dismiss(animated: true, completion: nil)
        
    }

    func imagePickerControllerDidCancel(picker: UIImagePickerController!) {

self.dismiss(animated: true, completion: nil)//        self.performsActionsWhilePresentingModally(true)
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
    
    //func readLine(strippingNewline: Bool = true) -> String?
    
}



