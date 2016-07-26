//
//  TodoListModel.swift
//  TODOList
//
//  Created by jyotishankar sahoo on 26/07/16.
//  Copyright © 2016 jyotishankar sahoo. All rights reserved.
//

import Foundation
import UIKit

class TodoListModel: NSObject {

    var filePath : NSURL = {
        let documentDirectoryURLs = NSSearchPathForDirectoriesInDomains(NSSearchPathDirectory.DocumentDirectory, NSSearchPathDomainMask.UserDomainMask, true)
        let directoryURL = documentDirectoryURLs.first!
        return NSURL(fileURLWithPath: directoryURL.stringByAppendingString("todolist.items"))
    }()
    
    var items = [String]()
    
    
    override init() {
        super.init()
        loadFromFile()
    }
    
    func addItem(item : String)  {
        items.append(item)
        self.writeToFile()
    }
    
    func removeItemAtIndex(index : Int){
        items.removeAtIndex(index)
        self.writeToFile()
    }
    
    func writeToFile(){
        let itemArray = items as NSArray
        if !itemArray.writeToURL(filePath, atomically: true){
            print("Unable to write to file")
        }
    }
    
    func loadFromFile(){
        if let itemsArray = NSArray(contentsOfURL: filePath) as? [String]{
            items = itemsArray
        }
    }
}

extension TodoListModel : UITableViewDataSource{
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return items.count ?? 0
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("todoCell", forIndexPath: indexPath)
        cell.textLabel?.text = items[indexPath.row]
        return cell
    }
    
    // Gold Challenge
    func tableView(tableView: UITableView, canEditRowAtIndexPath indexPath: NSIndexPath) -> Bool{
        return true
    }
    
    func tableView(tableView: UITableView, commitEditingStyle editingStyle: UITableViewCellEditingStyle, forRowAtIndexPath indexPath: NSIndexPath){
        if editingStyle == .Delete{
            tableView.beginUpdates()
            self.removeItemAtIndex(indexPath.row)
            tableView.deleteRowsAtIndexPaths([indexPath], withRowAnimation: UITableViewRowAnimation.Automatic)
            tableView.endUpdates()
        }
    }
    
//    func tableView(tableView: UITableView, canMoveRowAtIndexPath indexPath: NSIndexPath) -> Bool{
//            return true
//    }
//    
//    func tableView(tableView: UITableView, moveRowAtIndexPath sourceIndexPath: NSIndexPath, toIndexPath destinationIndexPath: NSIndexPath){
//        let itemToMove = items[sourceIndexPath.row]
//        items.removeAtIndex(sourceIndexPath.row)
//        items.insert(itemToMove, atIndex: destinationIndexPath.row)
//    }
    
}