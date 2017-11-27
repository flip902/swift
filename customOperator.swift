class Person {
  var name: String
  weak var spouse: Person?
  
  init(name: String, spouse: Person?) {
    self.name = name
    self.spouse = spouse
  }
}

infix operator +++
func +++(lhs: Person?, rhs: Person?) {
  guard let lhs = lhs, let rhs = rhs else { return }
  lhs.spouse = rhs
  rhs.spouse = lhs
}

let billy = Person(name: "Billy", spouse: nil)
let sarah = Person(name: "Sarah", spouse: nil)
print("Billy is married to: \(String(describing: billy.spouse))")
print("Sarah is married to: \(String(describing: sarah.spouse))")

billy +++ sarah
print("billy +++ sarah")
print("Billy is now married to \(billy.spouse!.name)")
print("Sarah is now married to \(sarah.spouse!.name)")

