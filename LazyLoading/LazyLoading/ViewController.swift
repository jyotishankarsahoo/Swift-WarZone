//
//  ViewController.swift
//  LazyLoading
//
//  Created by jyotishankar sahoo on 21/07/16.
//  Copyright © 2016 jyotishankar sahoo. All rights reserved.
//

import UIKit

class ViewController: UIViewController ,UITableViewDelegate,UITableViewDataSource{

    let url = NSURL(string: "https://itunes.apple.com/search?term=flappy&entity=software")!

    var detailsDeviceArray = Array<AnyObject>()
    
    @IBOutlet var tableView : UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        UIApplication.sharedApplication().networkActivityIndicatorVisible = true
       self.fetchDataFromServerWithURL(url)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table View Delegate 
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return detailsDeviceArray.count ?? 0
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("cellIndentifier", forIndexPath: indexPath)
        if detailsDeviceArray.count > 0{
            let model = self.detailsDeviceArray[indexPath.row] as! DeviceDetail
            cell.textLabel?.text = model.sellerName
            cell.detailTextLabel?.text = String(model.userRating)
            if let image = model.imageData{
                cell.imageView?.image = UIImage(data: image as! NSData)
            }else{
                NSURLSession.sharedSession().dataTaskWithURL(NSURL(string: model.artWorkUrl)!, completionHandler: { (data, reposnse, error) in
                    model.imageData = data
                    dispatch_async(dispatch_get_main_queue(), {
                        let cellToUpdate = tableView.cellForRowAtIndexPath(indexPath)
                        cellToUpdate?.imageView?.image = UIImage(data: data!)
                        cellToUpdate?.setNeedsLayout()
                    })
                }).resume()
            }
        }
        return cell
    }
    
    //MARK: - Network request
    
    func fetchDataFromServerWithURL(url : NSURL){
        let sessionConfig = NSURLSessionConfiguration.defaultSessionConfiguration()
        let session = NSURLSession(configuration: sessionConfig)
        let dataTask = session.dataTaskWithURL(url) { (data, response, error) in
            let httpResponse = response as! NSHTTPURLResponse
            let statusCode = httpResponse.statusCode
            var jsonData : Dictionary<String,AnyObject>!
            if  statusCode == 200{
                do{
                    jsonData = try NSJSONSerialization.JSONObjectWithData(data!, options: .AllowFragments) as! Dictionary<String, AnyObject>
                    }catch{
                    print("Json Error")
                    }

                guard let detailsArray = jsonData["results"] as! Array<AnyObject>? else{
                    return
                }
                
                for detail in detailsArray{
                    guard let artWorkURL = detail["artworkUrl100"] as? String , let userRating =  detail["averageUserRatingForCurrentVersion"] as? Int , let sellerName =  detail["sellerName"] as? String else{
                        return
                    }
                    
                    let detailModel = DeviceDetail(artWorkUrl: artWorkURL, userRating: userRating, sellerName: sellerName)
                    self.detailsDeviceArray.append(detailModel)
                }
                dispatch_async(dispatch_get_main_queue(), {
                    UIApplication.sharedApplication().networkActivityIndicatorVisible = false
                    self.tableView.reloadData()
                })

            }
        }
        dataTask.resume()
    }

}

