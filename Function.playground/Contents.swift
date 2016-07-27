import Cocoa

//FUNCTION
/*
*A function is a named set of code that is used to accomplish some specific task.
*/

//A Basic Function

func printGreeting()  {
	print("Welcome to swift function")
}
printGreeting()

//Function Parameters

func personalGreeting(name : String)  {
	let updatedName = name.uppercaseString
	print("Hello \(updatedName + "Sahoo") welcome to swift function")
}

personalGreeting("Jyoti")

//Multiple Arguments

func divisionDescription (num : Double , den : Double){
	print("\(num) divded by \(den) is equal to \(num/den)")
}
divisionDescription(90, den: 3)

//Parameter names
/*
*external parameter names forNumerator and andDenominator help make the function more readable
*Internal Parameters num and den used inside the function
*/
func divisionDesc (forNumeretor num : Double , andDenominator den : Double){
	print("\(num + 10) divded by \(den) is equal to \(num/den)")
}

divisionDesc(forNumeretor: 100, andDenominator: 5)

//Variadic parameters
/*
*Variadic parameter takes zero or more parameters as its arguments
*Functions can only have one veradic parameter
*It should be typically final parameter of the function
*Value provided in the function are accces as Array
*/

func grettingMyFriends(name : String...)  {
	for var person in name{
		print("Hello \(person += "") welcome to variadic parameter in swift")
	}
}

grettingMyFriends("XYZ","ABC","LMN")

//Default parameter values
/*
*Default values should be placed at the end of the function's parameter list. 
*If a parameter has a default value it can omitted from the argument when calling the function
*/

func devisionDescWithDefaultParameter(withNumarator num : Double, andDenominator deo : Double, andPunctuation punc : String = ".")   {
	print("\(num) devied by \(deo) is equal to \(num/deo)\(punc)")
}

devisionDescWithDefaultParameter(withNumarator: 100, andDenominator: 25, andPunctuation: "!")
devisionDescWithDefaultParameter(withNumarator: 200, andDenominator: 20)

//In-out parameters
/*
*In-out parameters allow a function's impact on a variable to live beyond the function's body
*In-out parameters cannot have default values
*Variadic parameters cannot be marked with inout
*/

var error = "The request failed"
func appendErrorCode(code : Int, inout errorString errorF : String)  {
	if code == 400 {
		errorF += " bad Request"
	}
}
appendErrorCode(400, errorString: &error)
print("\(error)")

//Returning from a Function

func devisionDescWithreturnType(withNumarator num : Double, andDenominator deo : Double, andPunctuation punc : String = ".")  -> String {
	return ("\(num) devied by \(deo) is equal to \(num/deo)\(punc)")
}

let desc = devisionDescWithreturnType(withNumarator: 100, andDenominator: 25, andPunctuation: "!")
print(devisionDescWithreturnType(withNumarator: 100, andDenominator: 25, andPunctuation: "!"))

//Nested Functions and Scope
/*
*tempResult can be used inside the devideResult() since both of them are the enclosing scope of areaOfTringle()
*/
func areaOfTringle(withBase base : Double , andHeight height : Double) -> Double{
	let tempResult = base * height
	func devideResult() -> Double{
		return tempResult/2
	}
	return devideResult()
}

areaOfTringle(withBase: 10, andHeight: 3)

//Multiple Returns
/*
*Functions can return more than one value. 
*To do this, Swift uses the tuple data type
*/

func devideInEvenAndOdd (pArray : [Int]) -> (evenArray : [Int] , oddArray : [Int]){
	var even = [Int]()
	var odd = [Int]()
	for number in pArray{
		if number % 2 == 0{
			even.append(number)
		}else{
			odd.append(number)
		}
	}
	return (even,odd)
}

let mainArray = [1,4,3,67,86,99,23]
let results = devideInEvenAndOdd(mainArray)
results.evenArray
results.oddArray

//Optional Return Types
/*
*When there is a chance that a function will sometimes need to return nil but will have a value to return at other times
*/
func grabMiddleName(name : (firstname : String , middleName : String?,lastName : String)) -> String? {
	return name.middleName
}

let middlName = grabMiddleName((firstname: "Jyoti", middleName: nil, lastName: "Sahoo"))
if let middle = middlName{
	print(middle)
}

//Exiting Early from a Function (GUARD)
/*
*A guard statement is used to exit early from a function if some condition is not met, hence the name guard.
*/

func greetByMiddleName(name : (firstname : String , middleName : String? , lastName : String)){
	guard let midName = name.middleName where name.middleName?.characters.count > 4 else{
		
		print("Hey, There")
		return
	}
	midName.characters.count
	print("Hey, \(midName)")
}

greetByMiddleName((firstname: "John", middleName: "dannil", lastName: "Yong"))

//Bronze Challenge
//Done Above

//Silver Challenge

func beanShifter(groceryList list : [String]) -> (beans : [String] , otherGrocery : [String]) {
	var beans = [String]()
	var otherGrocery = [String]()
	
	for grocery in list {
		if grocery.hasSuffix("beans") {
			beans.append(grocery)
		}else{
			otherGrocery.append(grocery)
		}
	}
	return (beans,otherGrocery)
}
let result = beanShifter(groceryList: ["green beans","milk","black beans","pinto beans","apples"])
result.beans
result.otherGrocery


