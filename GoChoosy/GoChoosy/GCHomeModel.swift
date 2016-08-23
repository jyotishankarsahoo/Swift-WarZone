//
//  GCHomeModel.swift
//  GoChoosy
//
//  Created by Jyoti Shankar Sahoo on 17/08/16.
//  Copyright © 2016 com.jyoti. All rights reserved.
//

import UIKit

class GCHomeModel {
    var service_id : Double
    var type : Double
    var title : String
    var thumbnail : String
    var detail : String
    var vendorThumbnailImageData : AnyObject!
   
    init(details:Dictionary<String , AnyObject>) {
        self.service_id = details["service_id"] as! Double
        self.type = details["type"] as! Double
        self.title = details["title"] as! String
        self.thumbnail = details["thumbnail"] as! String
        self.detail = details["detail"] as! String
    }
}
