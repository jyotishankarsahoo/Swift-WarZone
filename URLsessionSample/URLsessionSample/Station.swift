//
//  Station.swift
//  URLsessionSample
//
//  Created by jyotishankar sahoo on 19/07/16.
//  Copyright © 2016 jyotishankar sahoo. All rights reserved.
//

import UIKit

class Station: NSObject {

    let stationName : String
    let stationNumber : String
    
    init(stationName : String , stationNumber : String) {
        self.stationName = stationName
        self.stationNumber = stationNumber
        super.init()
    }
}
