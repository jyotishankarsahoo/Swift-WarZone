//
//  ViewController.swift
//  URLsessionSample
//
//  Created by jyotishankar sahoo on 19/07/16.
//  Copyright © 2016 jyotishankar sahoo. All rights reserved.
//

import UIKit

class ViewController: UIViewController,UITableViewDelegate,UITableViewDataSource {

    var stationList = [Station]()
    
    @IBOutlet var tableView : UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.fetchDataFromURL("http://www.learnswiftonline.com/Samples/subway.json")
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    func fetchDataFromURL(url : String)  {
        
        let requestUrl : NSURL = NSURL(string: url)!
        
        let urlRequest : NSMutableURLRequest = NSMutableURLRequest(URL: requestUrl)
        
        let session = NSURLSession.sharedSession()
        
        let task = session.dataTaskWithRequest(urlRequest) { (data, response, error) in
            let httpReponse = response as! NSHTTPURLResponse
            let statusCode = httpReponse.statusCode
            if statusCode == 200{
                do{
                    let jsonData = try NSJSONSerialization.JSONObjectWithData(data!, options: .AllowFragments)
                    print("Data Downloaded Successfully \(jsonData)")
                    if let stations = jsonData["stations"] as? [[String : AnyObject]]{
                        for station in stations{
                            self.stationList.append(Station(stationName: station["stationName"] as! String, stationNumber: station["buildYear"] as! String))
                        }
                    }
                    dispatch_async(dispatch_get_main_queue(), { 
                        self.tableView.reloadData()
                    })
                }catch{
                    print("\(error)")
                }
            }
        }
        task.resume()
    }
    
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return stationList.count
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("cellIndentifier", forIndexPath: indexPath)
        cell.textLabel?.text = "Year: " + stationList[indexPath.row].stationNumber
        cell.detailTextLabel?.text = "Name: " + stationList[indexPath.row].stationName
        return cell
    }
}

