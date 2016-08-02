//
//  ConversionViewController.swift
//  WorldTrotter
//
//  Created by jyotishankar sahoo on 01/08/16.
//  Copyright © 2016 jyotishankar sahoo. All rights reserved.
//

import Foundation
import UIKit

class ConversionViewController: UIViewController , UITextFieldDelegate{
    
    @IBOutlet weak var celsiusLabel: UILabel!
    @IBOutlet weak var textfield : UITextField!
    
    let numberFormatter : NSNumberFormatter = {
        let nf = NSNumberFormatter()
        nf.numberStyle = .DecimalStyle
        nf.maximumFractionDigits = 1
        nf.minimumFractionDigits = 0
        return nf
    }()
    
    var fahrenheitValue : Double?{
        didSet{
            updateCelsiusLabel()
        }
    }
    
    var celsiusValue : Double?{
        if let value = fahrenheitValue {
            return (value - 32) * (5/3)
        }else{
            return nil
        }
    }
    
    //MARK: - Action Methods
    
    @IBAction func fahrenheitFieldEditingChanged(textField : UITextField){
        
        if let text = textField.text , value = Double(text){
            fahrenheitValue = value
        }else{
            fahrenheitValue = nil
        }
    }
    
    @IBAction func dismissKeyBoard(sender : AnyObject){
        self.textfield.resignFirstResponder()
    }
    
    func updateCelsiusLabel(){
        if let value = celsiusValue{
            celsiusLabel.text = numberFormatter.stringFromNumber(value)
            
        }else{
            celsiusLabel.text = "???"
        }
    }
    
    //MARK: - ViewController Life cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        print("Conversion view loaded")
    }
    
    //MARK: - Silver Challenge
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        let currentTime = NSCalendar.currentCalendar().component(.Hour, fromDate: NSDate())
        
        switch currentTime {
        case 6 ..< 17:
            self.view.backgroundColor = UIColor.lightGrayColor()
        case 17 ..< 22:
            self.view.backgroundColor = UIColor.darkGrayColor()
        default:
            self.view.backgroundColor = UIColor.darkGrayColor()
        }
    }
    
    //MARK: - UITextFieldDelegate
    func textField(textField: UITextField, shouldChangeCharactersInRange range: NSRange, replacementString string: String) -> Bool{
        
        let exsitingTextHasDecimal = textField.text?.rangeOfString(".")
        let replacementTextHasDecimal = string.rangeOfString(".")
        
        if string.isEmpty {
            return true
        }
        
        let charachterSet = NSCharacterSet.init(charactersInString: "0123456789.")
        
        guard let _ = string.rangeOfCharacterFromSet(charachterSet) else {
            return false
        }
        
        if exsitingTextHasDecimal != nil && replacementTextHasDecimal != nil {
            return false
        }else{
            return true
        }
    }
}
