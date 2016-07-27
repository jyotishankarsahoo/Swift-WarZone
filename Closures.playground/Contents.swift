//Closures
/*
*Closures are discret bundle of functionality that can be used to accomplish a task in the application
* Function is a special case of closure (Named Closure)
*/
import Cocoa

//Exchange Sort Function
var volunteerCounts  = [1,3,40,32,2,53,77,13]
var temp : Int
for i in (0..<volunteerCounts.count){
	for j in (i..<volunteerCounts.count){
		if volunteerCounts[i] > volunteerCounts [j]{
			temp = volunteerCounts[i]
			volunteerCounts[i] = volunteerCounts[j]
			volunteerCounts[j] = temp
		}
	}
}

print(volunteerCounts)

//Closure Syntax

var volunteerCount  = [1,3,40,32,2,53,77,13]
func sortAcending (i : Int , j :Int) -> Bool{
	return i < j
}
volunteerCount.sort(sortAcending)

//Closure Expression Syntax
/*
*	{(parameters) -> return type in
	// Code }
*/

var sortedList = volunteerCount.sort({
	(i : Int , j : Int) -> Bool in
	return i < j
})

// Inline Closures with type inference
var sortedList1 = volunteerCount.sort( { (i  , j )  in return i > j })
print(sortedList1)

//shorthand syntax

var sortedList2 = volunteerCount.sort( { $0 > $1} )
print(sortedList2)

//Functions as Return Types
/*
*A function type defines a function's or closure's parameter and return types
*/

func makeGrandCity () -> (Int,Int) -> Int{
	func buildRoad(lightsToAdd : Int, toLights : Int) -> Int{
		return lightsToAdd + toLights
	}
	return buildRoad
}

var stopLights = 4
let townPlan = makeGrandCity()
stopLights = townPlan(4,stopLights)
print("Town Has \(stopLights) StopLights ")

//Functions as Arguments

func makeGrandRoadUpdated(budget : Int , condition : (Int) -> Bool) -> ((Int ,Int) -> Int)?{
	if  condition(budget) {
		func buildRoad(stopLights : Int , toLights : Int) -> Int{
			return stopLights + toLights
		}
		return buildRoad
	}else{
			return nil
	}
}

func evaluateBudget(budget : Int) -> Bool{
	return budget > 10000
}
var stopLight = 8
if let updateCity = makeGrandRoadUpdated(1000, condition: evaluateBudget){
stopLight = updateCity(9 , stopLight)
}

print("Town Has \(stopLight) StopLight ")


//Closures Capture Values

/*
*Closures and functions can keep track of internal information encapsulated by a variable defined in their enclosing scope
*/

func growthTrackerOfCity(forGrowth growth : Int) -> () -> Int {
	var totalGrowth = 0
	func growthTracker() -> Int{
		totalGrowth += growth
		return totalGrowth
	}
	return growthTracker
}
let grow = growthTrackerOfCity(forGrowth: 500)
grow()
grow()
var totalPopulation = 10
totalPopulation +=  grow()

//Closures Are Reference Types
let anotherGrow = grow
anotherGrow()

let anotherGrowthTrackerOfNewCity = growthTrackerOfCity(forGrowth: 10000)
anotherGrowthTrackerOfNewCity()
var totalPopulationOfNewCity = 10
totalPopulationOfNewCity += anotherGrowthTrackerOfNewCity()

//Functional Programming
/*
*Swift adopts some patterns from the functional programming paradigm

First Class function:
Functions can be passed as arguments to another function and can be stored in variables (Just like another type)

Pure Function:
Function have no side effect 
Give same input always produce same output

Immutability:

Strong Typing:

*/

//Higher-order functions
/*
*Higher-order functions take at least one function as an input
*/

//map(_:)

var estimatedPopulationRange = [1010,3012,1201]
let projectedPopulation = estimatedPopulationRange.map { (population : Int) -> Int in
	return population * 2
}
projectedPopulation

//fllter(_:)
let totalProjectedPopulation = projectedPopulation.filter { (population : Int) -> Bool in
	return population > 5000
}

totalProjectedPopulation

//reduce(_:combine:)
let totalProjection = projectedPopulation.reduce(200) {
	(accumulatedProjection: Int, precinctProjection: Int) -> Int in
	return accumulatedProjection + precinctProjection
}
totalProjection
