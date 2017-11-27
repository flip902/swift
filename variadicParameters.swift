func printPersonalGreetings(to names: String...) {
  for name in names {
    print("Hello \(name), welcome to the matrix.")
  }
}
printPersonalGreetings(to: "Billy", "Sarah", "Jada", "Rachel")
