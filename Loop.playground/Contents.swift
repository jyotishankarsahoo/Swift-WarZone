//: Playground - noun: a place where people can play

import Cocoa

//Space shooter game

var shildCount = 6
var noOfBulletsFired = 0
var isCannonHeated = false
var noOfDemonsKilled = 0

while shildCount > 0
{
    if noOfDemonsKilled > 50
    {
        print("You WON !!!")
        break
    }
    if isCannonHeated
    {
        print("Cannon is over heated please wait for cool down")
        sleep(5)
        print("Cannon is ready to fire")
        sleep(1)
        isCannonHeated = false
        noOfBulletsFired = 0
    }
    
    if noOfBulletsFired > 10
    {
        isCannonHeated = true
        continue
    }
    print("Bullets fired \(noOfBulletsFired)")
    print("No Of Demon killed : \(noOfDemonsKilled)")
    noOfBulletsFired += 1
    noOfDemonsKilled += 1
}

