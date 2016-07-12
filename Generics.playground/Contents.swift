//: Generics 
/*
 *Swift generics allow you to write types and functions that make use of types that are not yet known to you or the compiler.
*/

import Cocoa

// Create a Stack which accepts Int using Swift (LIFO)

struct Stack {
    var queue = [Int]()
    
    mutating func push(item : Int)  {
        queue.append(item)
    }
    
    mutating func pop() -> Int?{
        guard !queue.isEmpty else{
            return nil
        }
        return queue.removeLast()
    }
}

// Playing with the Stack :)
var stack =  Stack()
stack.push(5)
stack.push(10)
stack.push(18)
stack.pop()

print(stack)

// Making the Stack Generic 

//Associated Type Protocols

struct StackGenerator<T> : GeneratorType {
    typealias Element = T
    
    var stack : GenericStack<T>
    
    mutating func next() -> Element?{
        return stack.pop()
    }
    
}

struct GenericStack<Element> : SequenceType{
    var queue = [Element]()
    
    mutating func push(item : Element)  {
        queue.append(item)
    }
    
    mutating func pop() -> Element?{
        guard !queue.isEmpty else{
            return nil
        }
        return queue.removeLast()
    }
    
    func myMap<U>(f: Element -> U) -> GenericStack<U>{
        var mappedItem = [U]()
        for item in queue {
            mappedItem.append(f (item))
        }
        return GenericStack<U> (queue : mappedItem)
    }
    
    func generate() -> StackGenerator<Element> {
        return StackGenerator(stack: self)
    }
    
    func myFilter(f : Element -> Bool) -> GenericStack<Element>{
        var filtteredItem = [Element]()
        for item in queue {
            if f(item) {
                filtteredItem.append(item)
            }
        }
        return GenericStack<Element>(queue: filtteredItem)
    }
}

// Playing with the Generic Stack :)
var genericStack = GenericStack<String>()
genericStack.push("Hello all")
genericStack.push("I am generic")
genericStack.push("hea yeah")
genericStack.push("hea yeah")
genericStack.pop()
print(genericStack)

var doubleStack =  GenericStack<Int>()
doubleStack.push(10)
doubleStack.push(23)
doubleStack.myMap({2 * $0})
print(doubleStack.pop())
print(doubleStack.pop())
print(doubleStack.pop())
doubleStack.push(10)
doubleStack.push(23)
doubleStack.push(40)
doubleStack.push(33)
let bronzeChallange = doubleStack.myFilter { $0 % 10 == 0}
print("doubleStack : Bronze Challange \(bronzeChallange)")


//“Generic Functions and Methods”

func myMap<T , U >(items : [T] , f : (T) -> (U)) -> [U] {
    var results = [U]()
    for item in items{
        results.append(f (item))
    }
    return results
}

let strings = ["One","Two","Three"]

let stringLength =  myMap(strings) { (item : String) -> Int in
    return item.characters.count
}

//Type Constraints
/*
*restrictions on the concrete types that can be passed to generic functions
*/

func checkIfEquitable<T : Equatable>(first : T , second : T) -> Bool {
    return first == second
}

print(checkIfEquitable(1, second: 2))
print(checkIfEquitable(20, second: 20))


func checkIfDescriptionMatchs<T : CustomStringConvertible , U : CustomStringConvertible>(first : T , second : U ) -> Bool{
    return first.description == second.description
}

print(checkIfDescriptionMatchs(23, second: 43))
print(checkIfDescriptionMatchs("I am ", second: "I am "))



//Using the Associated Type Protocols

var associatedStack =  GenericStack<Int>()
associatedStack.push(20)
associatedStack.push(30)
associatedStack.push(40)

var myStackGenerator = StackGenerator(stack: associatedStack)
while let value =  myStackGenerator.next(){
    print("\(value)")
}

for item in associatedStack{
    //print("\(item)")
}


//Type Constraint where Clauses

func addItemsFromArrayToStack<Element , S : SequenceType where S.Generator.Element == Element>(inout stack : GenericStack<Element> , elements : S)  {
    for item in elements{
        stack.push(item)
    }
}

addItemsFromArrayToStack(&doubleStack, elements: [2,56,78])
addItemsFromArrayToStack(&genericStack, elements: ["2","56","78"])

print(doubleStack)
print(genericStack)


var item =  [1,2,3,4]
item.filter { (item : Int) -> Bool in
    return item < 10
}

func findAll<T : Equatable>(items : [T] , element : T) -> [Int]{
    var outputArray = [Int]()
    var inputArray = items
    for item in inputArray{
        if item == element{
            outputArray.append(inputArray.indexOf(element)!)
            inputArray.removeAtIndex(inputArray.indexOf(element)!)
        }
    }
    return outputArray
}

let silverChallange = findAll([12,13,34,12,45,12], element: 12)
print("Silver Challange \(silverChallange)")

let newSilverChallange = findAll(["0","13","34","12","45","12"], element: "12")
print("New Silver Challange \(newSilverChallange)")
