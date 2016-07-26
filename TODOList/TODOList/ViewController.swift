//
//  ViewController.swift
//  TODOList
//
//  Created by jyotishankar sahoo on 26/07/16.
//  Copyright © 2016 jyotishankar sahoo. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    let todoList = TodoListModel()
    
    @IBOutlet weak var itemTextField: UITextField!
    
    @IBOutlet weak var tableView: UITableView!
    
    @IBAction func insertItem(sender: AnyObject) {
        //Bronze Challenge
        guard let enteredText = self.itemTextField.text where !enteredText.isEmpty else{
            return
        }
        
        self.itemTextField.text = nil
        self.todoList.addItem(enteredText)
        self.tableView.reloadData()
    }
    
//    @IBAction func editAction(sender: UIBarButtonItem) {
//        if self.tableView.editing{
//            self.tableView.setEditing(false, animated: true)
//            sender.title  = "Done"
//            //sender.style = UIBarButtonItemStyle.Plain
//        }else{
//            self.tableView.setEditing(true, animated: true)
//            sender.title = "Edit"
//            //sender.style = UIBarButtonItemStyle.Done
//        }
//    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.tableView.registerClass(UITableViewCell.self, forCellReuseIdentifier: "todoCell")
        self.tableView.dataSource = todoList
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

