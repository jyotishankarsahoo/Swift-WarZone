//
//  NetworkManager.swift
//  GoChoosy
//
//  Created by Jyoti Shankar Sahoo on 17/08/16.
//  Copyright © 2016 com.jyoti. All rights reserved.
//

import UIKit

class NetworkManager {
    
    static let sharedmanager = NetworkManager()
    
    init() {
        //print(__FUNCTION__)
    }

    func fetchAllMerchantList(url : NSURL , complition : (result : Array<GCHomeModel>) -> Void){
        let sessionConfig = NSURLSessionConfiguration.defaultSessionConfiguration()
        let session = NSURLSession(configuration: sessionConfig)
        let dataTask = session.dataTaskWithURL(url) { (data, response, error) in
            let httpResponse = response as! NSHTTPURLResponse
            let statusCode = httpResponse.statusCode
            var jsonData = Array<GCHomeModel>()
            let parsedData:[AnyObject]?
            if  statusCode == 200{
                do{
                    parsedData = try NSJSONSerialization.JSONObjectWithData(data!, options: .AllowFragments) as? Array<AnyObject>
                    
                    for data in parsedData! {
                        let model:GCHomeModel = GCHomeModel(details: data as! Dictionary<String, AnyObject>)
                        jsonData.append(model)
                    }
                    
                }catch{
                    print("Json Error")
                }
                
                if jsonData.count > 0{
                    complition(result: jsonData)
                }
            }
        }
        dataTask.resume()
    }
    
    func fetchServiceForMerchant(merchantId : String , complition : (Array<AnyObject>)) -> Void {
        
    }
}
