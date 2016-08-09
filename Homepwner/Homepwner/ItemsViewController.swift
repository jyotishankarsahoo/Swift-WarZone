//
//  ItemsViewController.swift
//  Homepwner
//
//  Created by jyotishankar sahoo on 09/08/16.
//  Copyright © 2016 jyotishankar sahoo. All rights reserved.
//

import Foundation
import UIKit
class ItemsViewController: UITableViewController  {
    var itemStore : ItemStore!
    
    //MARK: - Viewcontroller Life cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        let statusBarHeight = UIApplication.sharedApplication().statusBarFrame.height
        let insects = UIEdgeInsetsMake(statusBarHeight, 0, 0, 0)
        tableView.contentInset = insects
        tableView.scrollIndicatorInsets = insects
    }
    //MARK: - Data source delegate method overriden
    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return itemStore.allItems.count
    }
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = UITableViewCell(style: .Value1, reuseIdentifier: "cell")
        cell.textLabel?.text = itemStore.allItems[indexPath.row].name
        cell.detailTextLabel?.text = String (itemStore.allItems[indexPath.row].valueInDollar)
        return cell
    }
}