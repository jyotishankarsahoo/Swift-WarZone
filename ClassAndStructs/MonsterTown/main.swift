//
//  main.swift
//  MonsterTown
//
//  Created by jyotishankar sahoo on 29/06/16.
//  Copyright © 2016 jyotishankar sahoo. All rights reserved.
//

import Foundation

//Creating Struct Instance
var myTown = Town(region: "north",population: 2000, stopLights: 20)

var myNewTown : Town? = Town(population: -1000 , stopLights: 2)

myNewTown?.printTownDescription()

myTown?.printTownDescription()

print("My Lazy Town Size is \(myTown?.lazyTownSize) with population \(myTown?.population)")
print("My Computed Town Size is \(myTown?.computedTownSize) with population \(myTown?.population)")

myTown?.updatePopulation(10000)

print("My Lazy Town Size is \(myTown?.lazyTownSize ) with population \(myTown?.population)")
print("My Computed Town Size is \(myTown?.computedTownSize) with population \(myTown?.population)")



// Calling mutating function to modify the Struct's property
myTown?.updatePopulation(20)

////Print the result
//myTown.printTownDescription()
//
//// Creating Class Instance
let monster = Monster(town: myTown , name: "")

//// Assign value to town
//monster.town = myTown
//monster.victimPool = 100
//print("Monster's victim pool is \(monster.victimPool)");

////Calling Instance Method
//monster.terrorizeTown()

var fredTheZombie : Zombie? = Zombie(walkWithLimb: true , isfallingApart: true , town: myTown , name: "")
fredTheZombie?.terrorizeTown()
fredTheZombie?.changeTheName("Fred The Zombie", walkWithLimb: false)
fredTheZombie?.town?.printTownDescription()
fredTheZombie?.terrorizeTown()
Zombie.makeSpooseSound()
print("\(Zombie.spookyNoise)")

// isTerrifying Defined in Base Class
if Zombie.isTerrifying{
	print("run away")
}

var convenientZombie = Zombie(limb: true, fallingApart: false)

fredTheZombie = nil

