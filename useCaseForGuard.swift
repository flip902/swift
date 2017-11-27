func greetByMiddleName(fromFullName name: (first: String,
                                           middle: String?,
                                           last: String)) {
  guard let middleName = name.middle else {
    print("Hey There!")
    return
  }
  print("Hey \(middleName)")
}
greetByMiddleName(fromFullName: ("Billy", "Clyde", "Savary"))
