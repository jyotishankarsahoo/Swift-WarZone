//: Extensions 
/*
* We will use extensions to add functionality to an existing type whose definition and implementation details are not available. ”
*/

import Cocoa

typealias velocity = Double

// Swift Extension Donot allow to add Stored Properties
extension velocity {
    var kph : velocity {return self * 1.016}
    var mph : velocity {return self}
}

protocol VehicleType{
    var topSpeed : velocity { get }
    var numberOfDoors : Int { get }
    var hasFlatBed : Bool { get }
}

struct Car {
    let make : String
    let model : String
    let year : Int
    let color : String
    let nickName : String
    let numberOfDoors : Int
    var gasLevel : Double{
        willSet{
            precondition(newValue <= 1.0 && newValue >= 0.0,"new value must be between 0 to 1")
        }
    }
}

//“Using extension to accomplish  protocol conformance”

extension Car : VehicleType{
    var topSpeed : velocity {return 10}
    var hasFlatBed : Bool {return true}
    init(carMake : String , carModel : String , carYear : Int){
        self.init(make : carMake , model : carModel , year : carYear , color: "Yellow" , nickName: "Ford" , numberOfDoors: 2,gasLevel: 1.0)
    }
    
}

var car = Car(carMake: "Suzuki", carModel: "800", carYear: 1998)

//“Nested types and extensions”

extension Car {
    
        enum carKind : CustomStringConvertible {
            case Coupe
            case Sedan
            
            var description : String{
                switch self{
                case .Coupe:
                    return "Coupe"
                case .Sedan:
                    return "Sedan"
                }
            }}
            
            var kind : carKind{
                if numberOfDoors == 2{
                    return .Coupe
                }else{
                    return .Sedan
              //  }
            }
        }
}

car.kind.description

//Extensions with functions

extension Car{
    mutating func emptyGas( amount : Double){
        guard   gasLevel - amount > 0 else{
            return
        }
       precondition(amount <= 1 && amount >= 0 , "Amount to be removed must between 0 -1")
        gasLevel -= amount
    }
    mutating func addgas (amout : Double){
        gasLevel += amout
    }
}

car.emptyGas(1.1)
car.gasLevel
car.addgas(0.2)
car.emptyGas(0.3)

car.gasLevel

//Bronze Challenge

/*Extend the Int type to have a timesFive computed property. The computed property should return the result of multiplying the integer by 5. You should be able to use it like so:
5.timesFive // 25 
*/

extension Int{
    var timesFive : Int{
        return 5 * self
    }
}

5.timesFive
