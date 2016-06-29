//Function Currying
/*
*Function currying allows  to rewrite an existing function that takes multiple parameters as a new function that takes one parameter and returns another function
*The function returned takes the original function's remaining parameters and returns what the original function returns
*/
import Cocoa

func greetName(name : String , withGreeting greeting : String) -> String {
	return "\(name)  \(greeting)"
}

let greetigText = greetName("John", withGreeting: "Hello")
greetigText

// Using Function Currying

func greetingForName(name : String) -> (String) -> String {
	func greet (greetingMsg : String) -> String{
		return "\(name) \(greetingMsg)"
	}
	return greet
}

let greetingFor = greetingForName("Messi")
let greetMsg = greetingFor("Please come back")
greetMsg

//Updated Syntax for currying function
//Stop using since will be removed in Swift 3
func updatedGreeting (name :String) (greetMsg : String) -> String {
	return "\(name) \(greetMsg)"
}

let updatedGreetingForPerson = updatedGreeting("Sam")
let updtaedGreetingMsg = updatedGreetingForPerson(greetMsg: "Hey, ")
updtaedGreetingMsg

//MUTATING in Struct in Depth

struct Person {
	var firstName = "Matt"
	var lastName = "Henery"
	
	mutating func changeName (firstName : String , lastName : String){
		self.firstName = firstName
		self.lastName = lastName
	}
}

var person = Person()
person.changeName("Petter", lastName: "Parker")
print("\(person.firstName) + \(person.lastName)" )

let changer = Person.changeName
changer (&person) ("john",lastName : "mendis")
person.firstName

