//
//  Zombie.swift
//  MonsterTown
//
//  Created by jyotishankar sahoo on 29/06/16.
//  Copyright © 2016 jyotishankar sahoo. All rights reserved.
//

import Foundation

/*
*Inheritance is a relationship in which one class, a subclass, is defined in terms of another, a superclass. 
*The subclass inherits the properties and methods of its superclass
*/
class Zombie: Monster {
	
	// Additional member in Subclass
	var walkWithLimb : Bool
	
	//Typed computed propeties 
	override class var spookyNoise : String{
		return "Brains..."
	}
	
	//Syntax internal private(set) to specify that the getter should be internal and the setter should be private
	internal private(set) var isfallingApart : Bool
	
	
	// designated Initializer for Zombie Class
	init? (walkWithLimb : Bool , isfallingApart : Bool , town : Town? , name : String){
		self.walkWithLimb = walkWithLimb
		self.isfallingApart = isfallingApart
		super.init(town: town, name: name)
	}
	
	// Convenience Initializer for Zombie Class
	convenience init? (limb : Bool , fallingApart : Bool){
		self.init(walkWithLimb : limb , isfallingApart : fallingApart , town: nil , name: "Haiko")
		if walkWithLimb {
			print("The Zombie has a bad leg")
		}
	}
	
	//required initializer from monster class
	required convenience init?(town: Town?, name: String) {
		//self.walkWithLimb = true
		//self.isfallingApart = false
		//Making it Convenience SLIVER CHALLENGE
		self.init(walkWithLimb : true , isfallingApart : false , town: nil , name: "Haiko")
		//super.init(town: town, name: name)
	}
	
	
	// Method overridden from Super class, Final keyword is added to prevent this func from overridden in the subclasses
	final override func terrorizeTown() {
		
		// Used Optional Chaining instead of if let since town instance is Value type (Struct)
		town?.updatePopulation(-20)
		
		// Calling Supercalss terrorizeTown mathod
		super.terrorizeTown()
	}
	
	func changeTheName(name : String , walkWithLimb : Bool)  {
		self.name = name
		self.walkWithLimb = walkWithLimb
	}
	
	deinit {
		print("The zombie named \(name) is no longer with us")
	}
}