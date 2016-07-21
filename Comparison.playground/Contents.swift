//: Comparison
//“Comparable actually inherits from Equatable”
import Cocoa

struct Point : Equatable ,Comparable{
    var x : Int
    var y : Int
}

func == (lhs : Point,rhs : Point)-> Bool{
    return lhs.x == rhs.x && lhs.y == rhs.y
}

func < (lhs : Point ,  rhs :  Point) -> Bool{
    return lhs.x < rhs.x && lhs.y < rhs.y
}

//Bronze Challange

func + (lhs : Point , rhs : Point) -> Point{
    return Point(x: lhs.x + rhs.x, y: lhs.y + rhs.y)
    
}

let point1 = Point(x: 3, y: 4)
let point2 = Point(x: 3, y: 4)

let isEqual = point1 == point2
let isNotEqual = point1 != point2

let point3 = Point(x: 4, y: 5)
let point4 = Point(x: 3, y: 4)

let compare = point3 >  point4
let compare1 = point3 <  point4

//Bronze Challange

print(point3 + point4)

//Gold Challange

class Person{
    var name : String
    var age : Int
    
    init(name : String , age : Int){
        self.name = name
        self.age = age
    }
}

let p1 = Person(name: "John", age: 23)
let p2 = Person(name: "Cane", age: 24)
let peoples = [p1,p2]
let p1Index = peoples.indexOf { (person : Person) -> Bool in
    return person === p1
}

print(p1Index!)