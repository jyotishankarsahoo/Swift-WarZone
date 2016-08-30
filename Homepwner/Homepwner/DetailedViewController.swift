//
//  DetailedViewController.swift
//  Homepwner
//
//  Created by jyotishankar sahoo on 29/08/16.
//  Copyright © 2016 jyotishankar sahoo. All rights reserved.
//

import UIKit

class DetailedViewController: UIViewController , UITextFieldDelegate ,UINavigationControllerDelegate , UIImagePickerControllerDelegate{

    @IBOutlet weak var nameLabel: UITextField!
    @IBOutlet weak var serialNumberLabel: UITextField!
    @IBOutlet weak var valueLabel: UITextField!
    @IBOutlet weak var dateLabel: UILabel!
    @IBOutlet var imageView : UIImageView!
    
    var item : Item?{
        didSet{
            navigationItem.title = item?.name
        }
    }
    
    var imageStore : ImageStore!
    
    let numberFormatter : NSNumberFormatter = {
        let formatter = NSNumberFormatter()
        formatter.minimumFractionDigits = 2
        formatter.maximumFractionDigits = 2
        formatter.numberStyle = .DecimalStyle
        return formatter
    }()
    
    let dateFormatter : NSDateFormatter = {
        let formatter = NSDateFormatter()
        formatter.dateStyle = .MediumStyle
        formatter.timeStyle = .NoStyle
        return formatter
    }()
    
    //MARK: - View Life Cycle
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        if let rowItem = item{
            nameLabel.text = rowItem.name
            serialNumberLabel.text = rowItem.serialNumber
            valueLabel.text = numberFormatter.stringFromNumber(rowItem.valueInDollar)
            dateLabel.text = dateFormatter.stringFromDate(rowItem.dateCreated)
            let key = item?.itemKey
            if let imageData =  imageStore.getImage(forKey: key!){
                imageView.image = imageData
            }
        }
    }
    
    override func viewWillDisappear(animated: Bool) {
        super.viewWillDisappear(animated)
        item?.name = nameLabel.text ?? ""
        item?.serialNumber = serialNumberLabel.text
//        item?.valueInDollar = valueLabel.text
        if let valueText =  valueLabel.text , value = numberFormatter.numberFromString(valueText){
           item?.valueInDollar = value.doubleValue
        }else{
            item?.valueInDollar = 0
        }
        if  let dateText = dateLabel.text , value = dateFormatter.dateFromString(dateText){
            item?.dateCreated = value
        }else{
            item?.dateCreated = NSDate()
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    //MARK: - IBAction
    @IBAction func backGroundViewTapped(sender: UITapGestureRecognizer) {
        view.endEditing(true)
    }
    
    @IBAction func takePicture(sender: UIBarButtonItem) {
        let imagePicker = UIImagePickerController()
        if UIImagePickerController.isSourceTypeAvailable(.Camera){
            imagePicker.sourceType = .Camera
            //Gold Challenge Add a cross hair view in the middle of the image capture area.
            imagePicker.cameraOverlayView = CustomCrossHairView(frame: self.view.bounds)

        }else{
            imagePicker.sourceType = .PhotoLibrary

        }
        imagePicker.delegate = self
        imagePicker.allowsEditing = true
        presentViewController(imagePicker, animated: true, completion: nil)
    }
    
    @IBAction func removeImage(sender : UIBarButtonItem){
        //Silver Challenge : Removing Image
        guard imageStore.getImage(forKey: (item?.itemKey)!) != nil else{
            return
        }
        
        let title = item?.name
        let deleteConformationAlert =  UIAlertController(title: "Image - \(title!)", message: "Do you want to remove Image for item \(title!)", preferredStyle: .Alert)
        let cancelAction = UIAlertAction(title: "Cancel", style: .Cancel, handler: nil)
        deleteConformationAlert.addAction(cancelAction)
        let deleteAction = UIAlertAction(title: "delete", style: .Destructive) { (action) in
            if let key = self.item?.itemKey{
                self.imageStore.deleteImage(forKey: key)
                self.imageView.image = nil
            }
        }
        deleteConformationAlert.addAction(deleteAction)
        presentViewController(deleteConformationAlert, animated: true, completion: nil)
       
    }
    
    //MARK: - ImagePicker Delegate
    func imagePickerController(picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : AnyObject]){
        //Bronze Challenge : Using Edited Image
        let pickedImage = info[UIImagePickerControllerEditedImage] as! UIImage
        imageView.image = pickedImage
        imageStore.setImage(pickedImage, forkey: (item?.itemKey)!)
        dismissViewControllerAnimated(true, completion: nil)
    }
   
    //MARK: - Textfield Delegate
     func textFieldShouldReturn(textField: UITextField) -> Bool{
        textField.resignFirstResponder()
        return true
    }

    // MARK: - Navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if segue.identifier == "UpdateDate" {
            let destinationViewController =  segue.destinationViewController as! DateUpdateViewController
            destinationViewController.item = item
        }
    }

}
