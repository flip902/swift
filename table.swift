protocol TabularDataSource {
  var numberOfRows: Int { get }
  var numberOfColumns: Int { get }
  
  func label(forColumn column: Int) -> String
  func itemFor(row: Int, column: Int) -> String
}

func printTable(_ dataSource: TabularDataSource & CustomStringConvertible) {
  print("Table: \(dataSource.description)")
  var firstrow = "|"
  var columnWidths = [Int]()

  for i in 0 ..< dataSource.numberOfColumns {
    let columnLabel = dataSource.label(forColumn: i)
    let columnHeader = " \(columnLabel) |"
    firstrow += columnHeader
    columnWidths.append(columnLabel.count)
  }
  print(firstrow)

  for i in 0 ..< dataSource.numberOfRows {
    var out = "|"
    
    for j in 0 ..< dataSource.numberOfColumns {
      let item = dataSource.itemFor(row: i, column: j)
      let paddingNeeded = columnWidths[j] - item.count
      let padding = repeatElement(" ", count: paddingNeeded).joined(separator: "")
      out += " \(padding)\(item) |"
    }    
    print(out)
  }
}

struct Person {
  let name: String
  let age: Int
  let yearsOfExperience: Int
}

struct Department: TabularDataSource, CustomStringConvertible {
  let name: String
  var people = [Person]()

  var description: String {
    return "Department (\(name))"
  }
  
  init(name: String) {
    self.name = name
  }
  
  mutating func add(_ person: Person) {
    people.append(person)
  }

  var numberOfRows: Int {
    return people.count
  }

  var numberOfColumns: Int {
    return 3
  }

  func label(forColumn column: Int) -> String {
    switch column {
      case 0: return "Employee Name"
      case 1: return "Age"
      case 2: return "Years of Experience"
      default: fatalError("Invalid column!")
    }
  }

  func itemFor(row: Int, column: Int) -> String {
    let person = people[row]
    switch column {
      case 0: return person.name
      case 1: return String(person.age)
      case 2: return String(person.yearsOfExperience)
      default: fatalError("Invalid column!")
    }
  }
}

var department = Department(name: "Engineering")
department.add(Person(name: "Billy", age: 36, yearsOfExperience: 6))
department.add(Person(name: "Sarah", age: 48, yearsOfExperience: 10))
department.add(Person(name: "Jada", age: 4, yearsOfExperience: 1))
department.add(Person(name: "Rachel", age: 24, yearsOfExperience: 3))
printTable(department)
