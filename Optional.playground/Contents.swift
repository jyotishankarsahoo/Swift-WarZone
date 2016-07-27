//: Playground - noun: a place where people can play

import Cocoa

//Optional

var str : String?
str = "404"
print("\(str)")

//Forced Unwrapping
if str != nil{
	print("\(str!)")
}else{
	print("No Value Present in Str")
}

//Optional Binding
if let tempStr = str{
	print(tempStr)
}else{
	print("No value in str")
}

// Nesting Optional Binding

if let tem = str{
	print(tem)
	if let temIntegerValue = Int(tem){
		print(temIntegerValue)
		print("String value \(tem) and Integervalue \(temIntegerValue)")
	}else{
		print("Unable to retrive the Int value")
	}
}

//Implict Unwrap

var implicitlyUnwrapVal : String!
implicitlyUnwrapVal = "Hey"
implicitlyUnwrapVal
print("\(implicitlyUnwrapVal)")

//Optional Chaining

var errorCodeString : String?
errorCodeString = "404"
var errorCodeDescription : String?

if let errorCode = errorCodeString , errorIntValue = Int(errorCode) where errorIntValue == 404{
	errorCodeDescription = "\(errorIntValue + 200): the requested resource not found"
}
let errorDescription = errorCodeDescription?.uppercaseString
errorDescription

//The Nil Coalescing Operator

var errorDesc : String?
let errorString = errorDesc ?? "No error"


