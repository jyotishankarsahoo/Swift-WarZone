//: Playground - noun: a place where people can play

import Cocoa

//Array
//Declaring Array
var buckList :  Array<String>
var buckListNew : [String]

//Initializing Array
buckList = ["Me","You"]

//Accessing and Modifing Array
buckList.append("She")
buckList.append("Him")

buckList.removeAtIndex(2)
buckList.count

print(buckList[0...1])

buckList[1] += " Our"
buckList [0] = "Jyoti"
buckList

var array = ["US","UK","Russia","Germany","India"]

var country : [String] = ["Pakistan"]

array += country
//for i in array{
//    country.append(i)
//}
array

//array.insert("Chinna", atIndex: array.indexOf("Germany")!)

if let i = array.indexOf("Germany"){
    array.insert("Chinna", atIndex: i)
}

var indexOf = array.indexOf("German") ?? 0
array.insert("Chaina", atIndex: indexOf)

print(array.isEmpty)

//Dictionary

//Creating a Dictionary

//var dict: Dictionary<KeyType, ValueType>

var dict1 : Dictionary<String , Double> = [:]
var dict2 = Dictionary <String, Double>()
var dict3 : [String : Double] = [:]
var dict4 = [String : Double]()

var array1 = Array <String>()
var array2 : Array<String> = []
var array3 = [String]()
var array4 : [String] = []

//Populating a Dictionary

var movieRating = ["ABC" : 1,"XYZ" : 2,"LMN" : 3,"EFG" : 4]

//Accessing and Modifying a Dictionary
print("I have rated movie ABC \(movieRating["ABC"]!)")
print("I have rated \(movieRating.count) movies")
let aBCRating = movieRating["ABC"]
movieRating["LMN"] = 9
print("\(movieRating)")

//Updating value

//movieRating.updateValue(10, forKey: "XZ")

print("\(movieRating)")

let oldIndex : Int? = movieRating.updateValue(10, forKey: "XYZ")

if let newIndex = oldIndex , currentIndex = movieRating["XYZ"]{
 print("New index is \(currentIndex) and oldIndex is \(newIndex)")
}

print("\(movieRating)")

//Adding and Removing Values

movieRating["XYZ"] = 23

movieRating.removeValueForKey("XYZ")
movieRating

//Looping

for (key , value) in movieRating{
    print("the movie rating of the movie \(key) is \(value)")
}

for key in movieRating.keys{
    print(key)
}

//Translating a Dictionary to an Array

let movieArray = Array(movieRating.keys)


//Silver Chlange

var cityDict : Dictionary<String , [String]>= [:]
cityDict = ["Bangalore" : ["570014","570016","570018"],"Bhubaneswar" : ["751014","751015","751016"],"Pune" : ["551014","551015","551016"]]
for (city,zipCode) in cityDict
{
    print("the zip code present in \(city) is \(zipCode)")
}

//SETS


