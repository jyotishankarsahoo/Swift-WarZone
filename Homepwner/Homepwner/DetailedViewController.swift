//
//  DetailedViewController.swift
//  Homepwner
//
//  Created by jyotishankar sahoo on 29/08/16.
//  Copyright © 2016 jyotishankar sahoo. All rights reserved.
//

import UIKit

class DetailedViewController: UIViewController , UITextFieldDelegate{

    @IBOutlet weak var nameLabel: UITextField!
    @IBOutlet weak var serialNumberLabel: UITextField!
    @IBOutlet weak var valueLabel: UITextField!
    @IBOutlet weak var dateLabel: UILabel!
    
    var item : Item?{
        didSet{
            navigationItem.title = item?.name
        }
    }
    
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
    
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        if let rowItem = item{
            nameLabel.text = rowItem.name
            serialNumberLabel.text = rowItem.serialNumber
            valueLabel.text = numberFormatter.stringFromNumber(rowItem.valueInDollar)
            dateLabel.text = dateFormatter.stringFromDate(rowItem.dateCreated)
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

        // Do any additional setup after loading the view.
    }

    
    @IBAction func backGroundViewTapped(sender: UITapGestureRecognizer) {
        view.endEditing(true)
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
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
