//
//  ViewController.swift
//  Snapshot
//
//  Created by Allen Spicer on 5/17/16.
//  Copyright © 2016 Allen Spicer. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate{

    
    

@IBOutlet var contentModeSegmentedControl: UISegmentedControl!
@IBOutlet  var imageView: UIImageView!
    let picker = UIImagePickerController()
    
override func viewDidLoad() {
        super.viewDidLoad()
    picker.allowsEditing = true
    picker.delegate = self
    }

//shutter button set to Camera as source type
@IBAction func takeButtonTapped(sender: UIButton) {
    
    if UIImagePickerController.availableCaptureModesForCameraDevice(.Rear) != nil {
        picker.sourceType = .Camera
        presentViewController(picker, animated: true, completion: nil)
    }
    }

//library button set to photolibrary as source type
@IBAction func ChooseButtonPressed(sender: UIButton) {
    picker.sourceType = .PhotoLibrary
    presentViewController(picker, animated: true, completion: nil)
    }
    
func imagePickerController(picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : AnyObject]){
    //if we can pull from original image 
    //let us assign that value to photo
    //and set image to that photo value
    if let editted = info[UIImagePickerControllerEditedImage] as? UIImage{
        imageView.image = editted
    }
    if let photo = info[UIImagePickerControllerOriginalImage] as? UIImage{
        imageView.image = photo
    }
    dismissViewControllerAnimated(true, completion: nil)
    }

func imagePickerControllerDidCancel(picker: UIImagePickerController){
    dismissViewControllerAnimated(true, completion: nil)
    }
    
    @IBAction func contentModeChanged(sender: UISegmentedControl) {
        switch sender.selectedSegmentIndex {
        case 0: self.imageView.contentMode = .ScaleAspectFit
            break
        case 1: self.imageView.contentMode = .ScaleAspectFill
            break
        case 2: self.imageView.contentMode = .ScaleToFill
        default:
            break
        }

    }

}

