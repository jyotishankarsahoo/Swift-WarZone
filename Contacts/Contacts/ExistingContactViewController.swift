//
//  ExistingContactViewController.swift
//  Contacts
//
//  Created by jyotishankar sahoo on 28/07/16.
//  Copyright © 2016 jyotishankar sahoo. All rights reserved.
//

import UIKit

class ExistingContactViewController: UIViewController {

    @IBOutlet weak var firstNameField : UITextField!
    @IBOutlet weak var lastNameField : UITextField!
    
    var firstName : String!
    var lastName : String!
    weak var delegate : EditContact?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.firstNameField.text = firstName
        self.lastNameField.text = lastName
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func saveContactInfo(sender : AnyObject){
        self.delegate?.populateContactInfo(self.firstNameField.text!, lastName: self.lastNameField.text!)
        self.navigationController?.popViewControllerAnimated(true)
    }


//    // MARK: - Navigation
//
//    // In a storyboard-based application, you will often want to do a little preparation before navigation
//    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
//        // Get the new view controller using segue.destinationViewController.
//        // Pass the selected object to the new view controller.
//    }
    

}
