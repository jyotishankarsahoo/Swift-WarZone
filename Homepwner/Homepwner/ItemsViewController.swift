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
    var imageStore : ImageStore!
    //var itemLessThanFive : Array<Item>?
    //var itemMoreThanFive : Array<Item>?
    
//    @IBAction func toggleEditMode(sender : UIButton){
//        if editing {
//            sender.setTitle("Edit", forState: .Normal)
//            setEditing(false, animated: true)
//        }else{
//            sender.setTitle("Done", forState: .Normal)
//            setEditing(true, animated: true)
//        }
//    }
    
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
//        tableView.contentInset = insects
        tableView.scrollIndicatorInsets = insects
        tableView.backgroundColor = UIColor.brownColor()
        tableView.rowHeight = UITableViewAutomaticDimension
        tableView.estimatedRowHeight = 65
    }
    
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        tableView.reloadData()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        navigationItem.leftBarButtonItem = editButtonItem()
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
        return itemStore.allItems.count + 1

    }
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        //let cell = UITableViewCell(style: .Value1, reuseIdentifier: "cell") as! ItemCell
        let cell = tableView.dequeueReusableCellWithIdentifier("cell", forIndexPath: indexPath) as! ItemCell
        //GOLD Challenge
//        if indexPath.section == 0 {
//            cell.textLabel?.text = itemLessThanFive![indexPath.row].name
//            cell.detailTextLabel?.text = String (itemLessThanFive![indexPath.row].valueInDollar)
//        }else{
//            cell.textLabel?.text = itemMoreThanFive![indexPath.row].name
//            cell.detailTextLabel?.text = String (itemMoreThanFive![indexPath.row].valueInDollar)
//        }
        cell.updateFont()
        if indexPath.row < itemStore.allItems.count {
            
            cell.nameLabel.text = itemStore.allItems[indexPath.row].name
            cell.serialNumberLabel.text = itemStore.allItems[indexPath.row].serialNumber
            cell.valueLabel.text = "$\(String (itemStore.allItems[indexPath.row].valueInDollar))"
            cell.updateValueLabel((itemStore.allItems[indexPath.row].valueInDollar))

        }else{
           // cell.nameLabel?.font = cell.nameLabel?.font.fontWithSize(15)
            cell.userInteractionEnabled = false
            cell.nameLabel.text = "No More Items!"
            cell.serialNumberLabel.text = ""
            cell.valueLabel.text = ""
        }
        

        return cell
    }
    override func numberOfSectionsInTableView(tableView: UITableView) -> Int{
        return 1
    }
    
    //Silver Challenge
//    override func tableView(tableView: UITableView, titleForFooterInSection section: Int) -> String?{
//        if section == 0 {
//            return "No More Items"
//        }
//        return ""
//    }
    
    //GOLD Challenge
    override func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat{
        return 60
    }

    override func tableView(tableView: UITableView, commitEditingStyle editingStyle: UITableViewCellEditingStyle, forRowAtIndexPath indexPath: NSIndexPath){
        if editingStyle == .Delete {
            let title = "Delete \(itemStore.allItems[indexPath.row].name)"
            let userAlert = UIAlertController(title: title, message: "Are you want to delete this item", preferredStyle: .ActionSheet)
            let cancelAction = UIAlertAction(title: "Cancel", style: .Cancel, handler: nil)
            userAlert.addAction(cancelAction)
            
            let deleteAction = UIAlertAction(title: "Remove", style: .Destructive, handler: { (action) in
                self.itemStore.removeItem(self.itemStore.allItems[indexPath.row])
                self.imageStore.deleteImage(forKey: self.itemStore.allItems[indexPath.row].itemKey)
                tableView.deleteRowsAtIndexPaths([indexPath], withRowAnimation: .Automatic)

            })
            userAlert.addAction(deleteAction)
            presentViewController(userAlert, animated: true, completion: nil)
        }
    }
    
    override func tableView(tableView: UITableView, moveRowAtIndexPath sourceIndexPath: NSIndexPath, toIndexPath destinationIndexPath: NSIndexPath){
            itemStore.moveItem(sourceIndexPath.row, toIndex: destinationIndexPath.row)
    }
    
    //GOLD Challenge
    override func tableView(tableView: UITableView, targetIndexPathForMoveFromRowAtIndexPath sourceIndexPath: NSIndexPath, toProposedIndexPath proposedDestinationIndexPath: NSIndexPath) -> NSIndexPath{
        if proposedDestinationIndexPath.row == itemStore.allItems.count {
            return NSIndexPath(forRow: proposedDestinationIndexPath.row-1, inSection: 0)
        }else{
            return proposedDestinationIndexPath
        }
    }
    
    //Silevr Challenge
    override func tableView(tableView: UITableView, canEditRowAtIndexPath indexPath: NSIndexPath) -> Bool{
        var canMove : Bool
        if indexPath.row == itemStore.allItems.count {
            canMove = false
        }else{
            canMove = true
        }
        return canMove
    }

    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if segue.identifier == "ShowItem" {
            if let row = tableView.indexPathForSelectedRow?.row where itemStore.allItems.count > 0{
                let item = itemStore.allItems[row]
                let destinationViewController = segue.destinationViewController as! DetailedViewController
                destinationViewController.item = item
                destinationViewController.imageStore = imageStore
            }
        }
    }

}