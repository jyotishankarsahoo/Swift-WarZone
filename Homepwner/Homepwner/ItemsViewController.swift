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
    var itemLessThanFive : Array<Item>?
    var itemMoreThanFive : Array<Item>?

    //MARK: - Viewcontroller Life cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        let statusBarHeight = UIApplication.sharedApplication().statusBarFrame.height
        let insects = UIEdgeInsetsMake(statusBarHeight, 0, 0, 0)
        tableView.contentInset = insects
        tableView.scrollIndicatorInsets = insects
        tableView.backgroundColor = UIColor.brownColor()
    }
    //MARK: - Data source delegate method overriden
    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        //Bronze Challenge
        if section == 0 {
            itemLessThanFive =  itemStore.sortedItems.filter({ (x) -> Bool in
                return x.valueInDollar <= 50
            })
            return itemLessThanFive!.count
        }else{
            itemMoreThanFive =  itemStore.sortedItems.filter({ (x) -> Bool in
                return x.valueInDollar > 50
            })
            return itemMoreThanFive!.count
        }

    }
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = UITableViewCell(style: .Value1, reuseIdentifier: "cell")
       cell.textLabel?.font = cell.textLabel?.font.fontWithSize(20)
        if indexPath.section == 0 {
            cell.textLabel?.text = itemLessThanFive![indexPath.row].name
            cell.detailTextLabel?.text = String (itemLessThanFive![indexPath.row].valueInDollar)
        }else{
            cell.textLabel?.text = itemMoreThanFive![indexPath.row].name
            cell.detailTextLabel?.text = String (itemMoreThanFive![indexPath.row].valueInDollar)
        }
        return cell
    }
    override func numberOfSectionsInTableView(tableView: UITableView) -> Int{
        return 2
    }
    
    //Silver Challenge
    override func tableView(tableView: UITableView, titleForFooterInSection section: Int) -> String?{
        if section == 1 {
            return "No More Items"
        }
        return ""
    }
    
    //GOLD Challenge
    override func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat{
        return 60
    }

    
    
}