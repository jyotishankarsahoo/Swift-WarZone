//ENUM
/*
*enumerations (or enums), which allow you to create instances that are one of a predefined list of cases
*/
import Cocoa
//Basic Enumerations

enum TextAllignment {
	case left
	case right
	case center
	case justify
}

var allignment : TextAllignment = TextAllignment.center
allignment = .left

if allignment == .left{
	print("text is left allign")
}

switch allignment{
case .left:
	print("text is left alligned")
case .right:
	print("text is right alligned")
case .center:
	print("text is center alligned")
case .justify:
	print("Justified")
}


//Raw Value Enumerations & Specifying raw values

enum TextAllignmentRaw : Int {
	case left = 10
	case right = 20
	case center = 30
	case justify = 40
}

var rawValue = TextAllignmentRaw.center.rawValue
print("The Raw value for \(TextAllignmentRaw.center) is \(rawValue)")

//Converting raw values to enum types

let sampleRawValue = 20

if let enumValue = TextAllignmentRaw(rawValue : sampleRawValue){
	print("enum value for raw value \(sampleRawValue) is \(enumValue)")
}else{
	print("There is no enum vaue for raw value \(sampleRawValue)")
}


//Creating an enum with string

enum ProgrammingLanguage : String{
	case Java = "Java Lang"
	case Swift = "Swift Lang"
	case ObjectiveC = "Objective-C"
	case Cpp = "C++"
}

print("My Faviourate language is \(ProgrammingLanguage.ObjectiveC.rawValue)")


//Methods

enum LightBulb{
	case On
	case Off
	func surfaceTempForAmbientTemp(ambient : Double) -> Double {
		switch self {
		case .On:
			return ambient + 150
		case .Off:
			return ambient
		}
	}
	
	mutating func toggle()  {
		switch self {
		case .On:
			self = .Off
		case .Off:
			self = On
		}
	}
}

var bulb : LightBulb = LightBulb.On
print("The bulb's tempreture is \(bulb.surfaceTempForAmbientTemp(100))")
bulb.toggle()
print("The bulb's tempreture is \(bulb.surfaceTempForAmbientTemp(100))")


//Associated Values

enum ShapeDiemnsions{
	case Point
	case Square (Double)
	case Rectangle (width : Double,Height : Double)
	case RightAngleTringle (base : Double , height : Double)
	
	func calculateArea()  -> Double{
		switch self {
		case let .Rectangle(width: w, Height: h):
			return w * h
		case let .Square(side):
			return side * side
		case .Point:
			return 0
		case let .RightAngleTringle(base: b , height: h):
			return (b*h)/2
		}
	}
	
	func perimeter() -> Double {
		switch self {
		case .Point:
			return 0
		case let .Square(side):
			return side + side
		case let .Rectangle(w,h):
			return w + h
		case let .RightAngleTringle(base: b , height: h):
			return b*h
		
		}
	}
}

let shapeArea = ShapeDiemnsions.RightAngleTringle(base: 10, height: 20)
shapeArea.calculateArea()
shapeArea.perimeter()
let anotherShapeArea = ShapeDiemnsions.Rectangle(width: 12, Height: 30)
anotherShapeArea.calculateArea()
anotherShapeArea.perimeter()
let newPoint = ShapeDiemnsions.Point
newPoint.calculateArea()


//Recursive Enumerations

indirect enum FamilyTree{
	case NoKnownParents
	case OneKnownParent (name : String , ancestors : FamilyTree)
	case TwoKnownParent (fatgreName : String , fatherAncestor : FamilyTree , motherName : String , motherAncestor : FamilyTree)
}

let family = FamilyTree.TwoKnownParent(fatgreName: "Manoranjan", fatherAncestor: FamilyTree.OneKnownParent(name: "Narayan", ancestors: .NoKnownParents), motherName: "susama", motherAncestor: FamilyTree.NoKnownParents)


