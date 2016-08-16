//
//  ViewController.swift
//  imagePick
//
//  Created by Minjie Zhu on 8/16/16.
//  Copyright © 2016 Minjie Zhu. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate {

    @IBOutlet weak var image: UIImageView!
    @IBOutlet weak var cameraButton : UIButton!
    @IBOutlet weak var alumButton : UIButton!
    
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        
        cameraButton.enabled = UIImagePickerController.isSourceTypeAvailable(.Camera)
    }


    @IBAction func pickFromAlum() {
        let picker = UIImagePickerController()
        picker.delegate = self
        picker.sourceType = .PhotoLibrary
        self.presentViewController(picker, animated: true, completion: nil)
    }
    
    @IBAction func pickFromCamera() {
        let picker = UIImagePickerController()
        picker.delegate = self
        picker.sourceType = .Camera
        self.presentViewController(picker, animated: true, completion: nil)
    }

    
    func imagePickerController(picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : AnyObject]) {
        
        if let image = info["UIImagePickerControllerOriginalImage"] as? UIImage {
            self.image.image = image
        }
        self.dismissViewControllerAnimated(true, completion: nil)
    }
    
    func imagePickerControllerDidCancel(picker: UIImagePickerController) {
        self.dismissViewControllerAnimated(true, completion: nil)
    }
}

