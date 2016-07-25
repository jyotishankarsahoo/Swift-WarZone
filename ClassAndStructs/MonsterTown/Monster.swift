//
//  Monster.swift
//  MonsterTown
//
//  Created by jyotishankar sahoo on 29/06/16.
//  Copyright © 2016 jyotishankar sahoo. All rights reserved.
//

import Foundation
/*
*classes are used to model related data under a common type
*/
class Monster {
	
	var town : Town?
	var name : String
	
	// required failable Initializer
	/*
	*all subclasses of this type must provide the given initializer
	* GOLD CHALLENGE
	*/
	required init? (town : Town? , name : String){
		self.town = town
		self.name = name
		if name == "" {
			print("Got blank zombie name ")
			return nil
		}
	}
	
	
	static let isTerrifying = true
	
	class var spookyNoise : String{
			return "grr.."
	}
	
	//Computed Property with Get and Set
	var victimPool : Int {
		get {
			return town?.population ?? 0
		}
		set (newValue){
			town?.population = newValue
		}
	}
	
	func terrorizeTown()  {
		if let currentTown = town where currentTown.population > 0{
			print("Town with population \(currentTown.population) is under \(name) attack")
		}else{
			print("\(name) has not find a town to terrorize yet!")
		}
	}
	
	class func makeSpooseSound(){
		print("Brain...")
	}
}