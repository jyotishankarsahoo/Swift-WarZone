//: Value vs. Reference Types

/*
*Swift's basic types - Array, Dictionary, Int, String, and so on - are all implemented as structs, as value types
*/

import Cocoa

//Value Semantics

var str = "Hello, playground"

//When we assigned str to playgroundGreeting, we gave a copy of str's value to playgroundGreeting. They do not point to the same underlying instance
var playGroundGreeting = str

//Thus, when we changed playgroundGreeting's value, it had no impact on str's value
playGroundGreeting += " ! How are you today"

//They are distinct from each other
str

//Reference Semantics

class GreekGod {
	var name : String
	init(name : String){
		self.name = name
	}
}

let hecate = GreekGod(name : "Hecate")
let  anotherGod = hecate
anotherGod.name = "Another Hecate"

print(hecate.name)
print(anotherGod.name)

//Constant Value and Reference Types

struct Pantheon {
	var chiefGod : GreekGod
	let dateCreated = NSDate()
}

let pantheon = Pantheon(chiefGod: hecate)
let zeus = GreekGod(name: "Zeus")
zeus.name = "Zeus Jr"
zeus.name

//Using Value and Reference Types Together
pantheon.chiefGod.name
let greekPanthon = pantheon
hecate.name = "Trivia"
greekPanthon.chiefGod.name


//Immutable reference types
pantheon.dateCreated

//Copying
//copies in Swift are shallow

let athena = GreekGod(name: "Athena")
let gods = [athena,hecate,zeus]
let godsCopy = gods
gods.last?.name = "Jupiter"
gods
godsCopy


//Identity vs. Equality

//Equality
athena === hecate

//Identity
let x = 1
let y = 1

x == y



