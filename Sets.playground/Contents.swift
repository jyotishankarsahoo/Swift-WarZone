//: Playground - noun: a place where people can play

import Cocoa

var str = "Hello, playground"

//Test Function To uppercase string
func upperCaseString(value : String) -> String{
	return value.uppercaseString
}

// Different ways to initialize Array and Dict in Swift

var songList : Array<String> = []
var sonList1 = Array<String>()
var songList2 = [String]()
var songList3 : [String] = []


var songDict : Dictionary <String , String> = [:]
var songDict1 = Dictionary<String, String>()
var songDict2 : [String : String] = [:]
var songDict3 = [String : String]()
print(songDict3)

//SET

/*
*Set is an unordered collection of items unlike Array
*Set does not allow repeated or duplicate elements 
*Set elements conforms to hashable protocal like dictionary keys
*/

//Getting a Set

var groceryList = Set<String>()
var groceyList1 : Set <String> = []
var groceryList2 = [String]()
var groceryList3 : [String] = []


//add elemets

groceryList.insert("Apple")
groceryList.insert("Orange")
groceryList.insert("Banana")
groceryList.insert("Pinapple")

//Extract elements

for items in groceryList{
	print(items)
}

//Using the Array literal syntax to create an instance of Set
groceyList1 = Set(["Banana","Orange","Patato"])
var groceryList5 : Set = ["Tamato","Onion"]

//WORKING WITH SET

let hasBanana = groceryList.contains("Banana")
if hasBanana{
	print("No Need Of banana")
}

//UNION

groceryList.union(groceyList1)

//INTERSECTS

groceryList.intersect(groceyList1)

//DISJOINT (Returns true if has common items and Viceversa)

groceryList.isDisjointWith(groceryList2)	// No common Iteams
groceryList.isDisjointWith(groceyList1)	// Has common Iteams

//BRONZE CHALLENGE
upperCaseString("Bronze Challenge")

let myCities = Set(["Atlanta", "Chicago","Jacksonville", "New York", "San Francisco"])
let yourCities = Set(["Chicago", "San Francisco", "Jacksonville"])
let myCityIsSupperSet = myCities.isSupersetOf(yourCities)
if myCityIsSupperSet{
	print("MY CITY IS THE SUPER SET")
}

//SILVER CHALLENGE
upperCaseString("Silver Challenge");
groceryList.insert("tamato")
groceryList.remove("Apple")
if let indexOfItem = groceryList.indexOf("tamato"){
	groceryList.removeAtIndex(indexOfItem)

}
groceryList



