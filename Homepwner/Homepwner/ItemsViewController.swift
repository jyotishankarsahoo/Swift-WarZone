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
    //var itemLessThanFive : Array<Item>?
    //var itemMoreThanFive : Array<Item>?
    
    @IBAction func toggleEditMode(sender : UIButton){
        if editing {
            sender.setTitle("Edit", forState: .Normal)
            setEditing(false, animated: true)
        }else{
            sender.setTitle("Done", forState: .Normal)
            setEditing(true, animated: true)
        }
    }
    
    @IBAction func addItem(sender : UIButton){
        let newItem = itemStore.createItem()
        if let index = itemStore.allItems.indexOf(newItem){
            let indexPath = NSIndexPath(forRow: index, inSection: 0)
            tableView.insertRowsAtIndexPaths([indexPath], withRowAnimation: .Automatic)
        }
    }

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
//        if section == 0 {
//            itemLessThanFive =  itemStore.allItems.filter({ (x) -> Bool in
//                return x.valueInDollar <= 50
//            })
//            return itemLessThanFive!.count
//        }else{
//            itemMoreThanFive =  itemStore.allItems.filter({ (x) -> Bool in
//                return x.valueInDollar > 50
//            })
//            return itemMoreThanFive!.count
//        }
        return itemStore.allItems.count

    }
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = UITableViewCell(style: .Value1, reuseIdentifier: "cell")
        //GOLD Challenge
       cell.textLabel?.font = cell.textLabel?.font.fontWithSize(20)
//        if indexPath.section == 0 {
//            cell.textLabel?.text = itemLessThanFive![indexPath.row].name
//            cell.detailTextLabel?.text = String (itemLessThanFive![indexPath.row].valueInDollar)
//        }else{
//            cell.textLabel?.text = itemMoreThanFive![indexPath.row].name
//            cell.detailTextLabel?.text = String (itemMoreThanFive![indexPath.row].valueInDollar)
//        }
        
        cell.textLabel?.text = itemStore.allItems[indexPath.row].name
        cell.detailTextLabel?.text = String (itemStore.allItems[indexPath.row].valueInDollar)

        return cell
    }
    override func numberOfSectionsInTableView(tableView: UITableView) -> Int{
        return 1
    }
    
    //Silver Challenge
    override func tableView(tableView: UITableView, titleForFooterInSection section: Int) -> String?{
        if section == 0 {
            return "No More Items"
        }
        return ""
    }
    
    //GOLD Challenge
    override func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat{
        return 60
    }

    override func tableView(tableView: UITableView, commitEditingStyle editingStyle: UITableViewCellEditingStyle, forRowAtIndexPath indexPath: NSIndexPath){
        if editingStyle == .Delete {
            itemStore.removeItem(itemStore.allItems[indexPath.row])
            tableView.deleteRowsAtIndexPaths([indexPath], withRowAnimation: .Automatic)
        }
    }
    
    override func tableView(tableView: UITableView, moveRowAtIndexPath sourceIndexPath: NSIndexPath, toIndexPath destinationIndexPath: NSIndexPath){
        itemStore.moveItem(sourceIndexPath.row, toIndex: destinationIndexPath.row)
    }
}