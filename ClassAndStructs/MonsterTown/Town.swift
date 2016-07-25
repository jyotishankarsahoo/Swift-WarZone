//
//  Town.swift
//  MonsterTown
//
//  Created by jyotishankar sahoo on 29/06/16.
//  Copyright © 2016 jyotishankar sahoo. All rights reserved.
//

import Foundation

//Structures
/*
*Struct is type which groups a related chunk of data together in the memory
*/

struct Town {
	// Read only typed property
	let region : String
	//Read Write Stored property
	var population : Int {
		//Property Observer
		// BRONZE Challange
		willSet(newPopulation){
			if newPopulation < population {
				print("The  population of the town changed from \(population) to  \(newPopulation)")
				mayor.reactionOfMayor()
			}
		}
//		didSet(oldPopulation){
//			print("The population of the town changed from \(population) to \(oldPopulation)")
//		}
	}
	var noOfStopLights : Int
	
	// Netsed Type
	enum Size {
		case Small
		case Medium
		case Large
	}
	
	//Lazy Stored Properties
	/*
*	lazy loading means that the calculation of the property's value will not occur until the first time it is needed
	*/
	lazy var lazyTownSize : Size = {
		switch self.population {
		case 0...1000:
			return Size.Small
		case 1000...10000:
			return Size.Small
		default:
			return Size.Large
		}
	}()
	
	//Computed Property
	var computedTownSize : Size {
		get {
		switch self.population {
		case 0...1000:
			return Size.Small
		case 1000...10000:
			return Size.Medium
		default:
			return Size.Large
			}
		}
	}
	
	var mayor = Mayor()
	
	//Custom Initiializer
	
	init? (region : String , population : Int , stopLights : Int){
		if population <= 0 {
			return nil
		}
		self.region = region
		self.population = population
		noOfStopLights = stopLights
	}
	
	//initializer delegation
	
	init? (population : Int , stopLights : Int){
		
		self.init(region : "N/A" , population: population , stopLights: stopLights)
	}
	
	//Instance Method
	func printTownDescription()  {
		print("Population of the town is \(population) and number of stop lights are \(noOfStopLights) region \(region)")
	}
	
	//Mutating Function
	mutating func updatePopulation(newPopulation : Int) {
		 population += newPopulation
		 population > 0 ? population : 0
	}
	
}
