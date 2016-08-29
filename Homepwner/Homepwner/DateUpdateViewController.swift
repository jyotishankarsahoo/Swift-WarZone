//
//  DateUpdateViewController.swift
//  Homepwner
//
//  Created by jyotishankar sahoo on 29/08/16.
//  Copyright © 2016 jyotishankar sahoo. All rights reserved.
//

import UIKit

class DateUpdateViewController: UIViewController  {
    var item : Item?
    
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        navigationItem.title = "Update Date"
    }
    
    @IBAction func dateSelected(sender: UIDatePicker) {
        item?.dateCreated = sender.date
    }
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
}
