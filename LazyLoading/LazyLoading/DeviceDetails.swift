//
//  DeviceDetails.swift
//  LazyLoading
//
//  Created by jyotishankar sahoo on 25/07/16.
//  Copyright © 2016 jyotishankar sahoo. All rights reserved.
//

import Foundation

class  DeviceDetail {
    
    var artWorkUrl : String!
    var userRating : Int!
    var sellerName : String!
    var imageData : AnyObject!
    
    
    init(artWorkUrl : String, userRating : Int, sellerName : String){
        self.artWorkUrl = artWorkUrl
        self.userRating = userRating
        self.sellerName = sellerName
    }
    
}