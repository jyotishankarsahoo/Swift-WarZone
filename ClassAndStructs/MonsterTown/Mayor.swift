//
//  Mayor.swift
//  MonsterTown
//
//  Created by jyotishankar sahoo on 04/07/16.
//  Copyright © 2016 jyotishankar sahoo. All rights reserved.
//

import Foundation

struct Mayor {
	
	private var anxietyLevel : Int = 0
	
	 mutating func reactionOfMayor() {
		anxietyLevel += 1
		print("I'm deeply saddened to hear about this latest tragedy. I promise that my office is looking into the nature of this rash of violence.")
		print("anxietyLevel of the Mayor is \(anxietyLevel)")
	}
	
}