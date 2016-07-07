//: Playground - Protocols

import Cocoa

func printTable (data : [[Int]]){
	for row in data{
		var out = ""
		for item in row{
			out += "\(item) | "
		}
		print(out)
	}
}

printTable([ [30,6] , [40 , 18] , [50 , 20] ])


func printTableDataWithRowLabel (rowLabels : [String] , data : [[Int]]){
	
	let rowLabelsWidthArray = rowLabels.map { (item : String) -> Int in
		return item.characters.count
	}
	
	//print(rowLabelsWidthArray)
	
	let maxLength = rowLabelsWidthArray.maxElement()
	
	//print(maxLength!)
	
	
	for ( i, row ) in data.enumerate(){
		let paddingAmount = maxLength! - rowLabelsWidthArray[i]
		var out = rowLabels[i] + padding(paddingAmount) + " |"
		for item in row{
			out += " \(item) | "
		}
		print(out)
	}
}

func padding (amount : Int) -> String {
	var paddingString = ""
	for _ in 0 ..< amount{
		paddingString += " "
	}
	return paddingString
}

printTableDataWithRowLabel(["ABC" , "XYZ4535635" , "LMN"], data: [ [30,6] , [40 , 18] , [50 , 20] ])

func printTableWithRowAndColumnLabels(rowLabels : [String] , columnLabels : [String] , data : [[Int]])  {
	let rowLabelsWidthArray = rowLabels.map { (item : String) -> Int in
		return item.characters.count
	}
	
	let maxWidth = rowLabelsWidthArray.maxElement()
	
	var firstRow = padding(maxWidth!) + "|"
	
	var columnWidths = [Int]()
	
	for column in columnLabels{
		firstRow += column + "|"
		columnWidths.append(column.characters.count)
	}
	print(firstRow)
	
	for (i,row) in data.enumerate() {
		let paddingwidth = maxWidth! - rowLabelsWidthArray[i]
		var out = rowLabels[i] + padding(paddingwidth) + "|"
		for (j,item) in row.enumerate() {
			
			let itemString = "\(item)|"
			let paddingAmount = columnWidths[j] - itemString.characters.count
			out  +=  padding(paddingAmount) + itemString
		}
		print(out)
	}
}

printTableWithRowAndColumnLabels(["ABC" , "XYZ4535635" , "LMN"] ,columnLabels: ["Age" , "No Of Experience"],data: [ [30,60] , [40 , 18] , [50 , 20] ])

//Defining a protocol

protocol TabularDataSource {
	var numberOfRows : Int {get}
	var numberOfColumns : Int {get}
	
	func labelForRow (row : Int) -> String
	func labelForColumn (column : Int) -> String
	func itemForRow (row : Int , column : Int) -> Int
}

//Using model objects

struct Person {
	
	let name : String
	let age : Int
	let experience : Int
}

struct Department : TabularDataSource,CustomStringConvertible{
	let name : String
	var people  = [Person]()
	
	init(name : String){
		self.name = name
	}
	
	mutating func addPerson(person : Person){
		people.append(person)
	}
	
	// Conforming to protocol CustomStringConvertible
	
	var description: String{
		return "Department \(name)"
	}

	
	// Conforming to protocol TabularDataSource
	
	var numberOfRows: Int{
		return people.count
	}
	
	var numberOfColumns: Int{
		return 2
	}
	
	func labelForRow(row: Int) -> String {
		return people[row].name
	}
	
	func labelForColumn(column: Int) -> String {
		switch column {
		case 0:
			return "Age"
		case 1:
			return "No Of Experience"
		default:
			fatalError("Invalid Column")
		}
	}
	
	func itemForRow(row: Int, column: Int) -> Int {
		let person = people[row]
		switch column {
		case 0:
			return person.age
		case 1:
			return person.experience
		default:
			fatalError("Invalid column")
		}
	}
}

var department = Department(name: "IT")
department.addPerson(Person(name: "Jack", age: 28, experience: 1005))
department.addPerson(Person(name: "John", age: 38, experience: 8))
department.addPerson(Person(name: "Cane Willimson", age: 23, experience: 2))
department.people

func printTableWithProtocol(dataSource : protocol <TabularDataSource,CustomStringConvertible>)  {
	
	print("Table : \(dataSource.description)")
	
	// Array for all the row label
	let rowLabels = (0 ..< dataSource.numberOfRows).map { (rowNumber : Int) -> String in
		return dataSource.labelForRow(rowNumber)
	}
	//print(rowLabels)
	
	// Array for all the column label
	let columnLables = (0 ..< dataSource.numberOfColumns).map { (columnNumber : Int) -> String in
		return dataSource.labelForColumn(columnNumber)
	}
	//print(columnLables)

	//Array for width of each row
	let rowWidth = rowLabels.map { (itemInArray : String) -> Int in
		return itemInArray.characters.count
	}
	
	//Maximum width
	guard let maxWidth = rowWidth.maxElement() else{
		return
	}
	
	// First row containing column header
	var firstRow = padding(maxWidth) + "|"
	
	//Keep track of column width
	var columnWidth = [Int]()

	for columnLable in columnLables{
		let columnHeader = "\(columnLable) |"
		firstRow += columnHeader
		columnWidth.append(columnHeader.characters.count)
	}
	
	print(firstRow)
	
	for i in 0 ..< dataSource.numberOfRows {
		let paddingAmount = maxWidth - rowWidth[i]
		var out = rowLabels[i] + padding(paddingAmount) + "|"
		
		// Append item in each row
		for j in 0 ..< dataSource.numberOfColumns{
			let item = dataSource.itemForRow(i, column: j)
			let itemString = " \(item) |"
			let paddingAmount = (columnWidth[j] - itemString.characters.count) > 0 ? columnWidth[j] - itemString.characters.count : 0
			out += padding(paddingAmount) + itemString
		}
		
		print(out)

	}
	
}

printTableWithProtocol(department)

// OUTPUT

//							|Age | No Of Experience		|
//	Jack					| 28  |								5  |
//	John					| 38  |								8  |
//Cane Willimson	| 23  |								2  |





