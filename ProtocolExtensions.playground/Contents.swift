//: Protocol Extension

import Cocoa

protocol ExcersiseType : CustomStringConvertible{
    var title : String {get}
    var name : String {get}
    var caloriesBurn : Double {get}
    var minutes : Double {get}
}

// Extensiomn to add new Property
extension ExcersiseType{
    var caloriesBurnedPerMinute : Double{
        return caloriesBurn/minutes
    }
}

// Extension to add Default implementation

extension ExcersiseType{
    var description : String{
        return "Exercise \(name) , burned Calories \(caloriesBurn) in \(minutes) minutes"
    }
}
struct EllipticalTrainer : ExcersiseType {
    let name : String = "Elliptical Machine"
    var caloriesBurn: Double
    var minutes: Double
    var title : String{
        return "\(name) - \(caloriesBurn)"
    }
}

struct TreadMill : ExcersiseType{
    let name : String = "TreadMill"
    let title: String = "Go fast elliptical machine 3000"
    var caloriesBurn : Double
    var minutes : Double
    var distnaceInMiles : Double
}

let ellipticalTrainer =  EllipticalTrainer(caloriesBurn: 335, minutes: 30)

let treadMill = TreadMill(caloriesBurn: 350, minutes: 25, distnaceInMiles: 4.2)

//Generic Function to calculate Calories burn per minute
//func caloriesBurnedPerMinute<Exercise : ExcersiseType>(exersise : Exercise) -> Double {
//    return exersise.caloriesBurn/exersise.minutes
//}

//print(caloriesBurnedPerMinute(ellipticalTrainer))
//print(caloriesBurnedPerMinute(treadMill))

print(ellipticalTrainer.caloriesBurnedPerMinute)
print(treadMill.caloriesBurnedPerMinute)

//Protocol Extension Where Clause

extension SequenceType where Generator.Element == ExcersiseType{
    func totalCaloriesBurned() -> Double{
        var total : Double = 0
        for excersise in self{
            total += excersise.caloriesBurn
        }
        return total
    }
}

let mandatoryWorkout : [ExcersiseType] = [ellipticalTrainer,treadMill]
print(mandatoryWorkout.totalCaloriesBurned())

//Default Implementation with Protocol Extension

print(ellipticalTrainer)
print(treadMill)

extension TreadMill{
    var description : String{
        return "Exercise \(name) , burned Calories \(caloriesBurn) and miles covered \(distnaceInMiles) in \(minutes) minutes "
    }
}

//extension ExcersiseType{
//    var title : String{
//        return "\(name) - \(caloriesBurn)"
//    }
//}

for excersise in mandatoryWorkout{
    print("Bronze Challange : \(excersise.title)")
}

//print(ellipticalTrainer.title)




