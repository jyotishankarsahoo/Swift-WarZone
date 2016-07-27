//
//  NewContactViewController.swift
//  Contacts
//
//  Created by jyotishankar sahoo on 27/07/16.
//  Copyright © 2016 jyotishankar sahoo. All rights reserved.
//

import UIKit

class NewContactViewController: UIViewController {

    @IBOutlet weak var firstNameTextField : UITextField!
    @IBOutlet weak var lastNameTextField : UITextField!
    
    @IBOutlet weak var defaultImage: UIImageView!
    override func viewDidLoad() {
        super.viewDidLoad()
        self.defaultImage.image = DefaultImage.geberateDefaultImageOfSize(defaultImage.frame.size)
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

}
