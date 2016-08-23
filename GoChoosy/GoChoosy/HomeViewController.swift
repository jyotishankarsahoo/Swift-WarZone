//
//  HomeViewController.swift
//  GoChoosy
//
//  Created by Jyoti Shankar Sahoo on 17/08/16.
//  Copyright © 2016 com.jyoti. All rights reserved.
//

import UIKit

class HomeViewController: UIViewController , UITableViewDataSource , UITableViewDelegate {

    @IBOutlet weak var menuButton: UIBarButtonItem!
    @IBOutlet weak var tableView : UITableView!
    
    var vendorList = [GCHomeModel]()
    
    override func viewDidLoad() {
        
        super.viewDidLoad()

        if self.revealViewController() != nil{
            menuButton.target = self.revealViewController()
            menuButton.action = "revealToggle:"
            self.view.addGestureRecognizer(self.revealViewController().panGestureRecognizer())
        }
        UIApplication.sharedApplication().networkActivityIndicatorVisible = true
        NetworkManager.sharedmanager.fetchInitialVendorData(NSURL(string: "http://beta.gochoosy.com/api/v7/services/")!) { (result ) -> Void in
            self.vendorList = result
            dispatch_async(dispatch_get_main_queue(),{
                self.tableView.reloadData()
                UIApplication.sharedApplication().networkActivityIndicatorVisible = false
                })
        }
    }
    
    //MARK: - Table View Delegate
     func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int{
        return self.vendorList.count;
    }

    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell{
        let cell = self.tableView.dequeueReusableCellWithIdentifier("cell", forIndexPath: indexPath) as! HomeTableViewCell
        
        let gradient: CAGradientLayer = CAGradientLayer()
        gradient.frame = cell.vendorThumnailImage.bounds
        let colors: [CGColorRef] = [
            UIColor(red: 1, green: 1, blue: 1, alpha: 0).CGColor,
            UIColor(red: 0, green: 0, blue: 0, alpha: 0.4).CGColor
        ]
        gradient.opaque = true
        gradient.colors = colors

        
        if vendorList.count > 0
        {
            let vendor = self.vendorList[indexPath.row]
            
            cell.vendorNameLabel?.text = vendor.title
            cell.vendorDetailsLabel?.text = vendor.detail

            
            if let image = vendor.vendorThumbnailImageData{
                cell.vendorThumnailImage.image = UIImage(data: image as! NSData)

            }else{
                NSURLSession.sharedSession().dataTaskWithURL(NSURL(string: vendor.thumbnail)!, completionHandler: { (data, reposnse, error) in
                    vendor.vendorThumbnailImageData = data
                    dispatch_async(dispatch_get_main_queue(), {
                        
                        let cellToUpdate = tableView.cellForRowAtIndexPath(indexPath) as! HomeTableViewCell
                        
                        cellToUpdate.vendorThumnailImage.image = UIImage(data: data!)
                        
                        cellToUpdate.vendorThumnailImage.layer.addSublayer(gradient)

                        cellToUpdate.setNeedsLayout()
                    })
                }).resume()
            }
        }
        return cell
    }

}
