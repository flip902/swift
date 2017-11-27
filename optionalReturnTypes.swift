func grabMiddleName(fromFullName name: (String, String?, String)) -> String?{
  return name.1
}

let middleName = grabMiddleName(fromFullName: ("William", "Clyde", "Savary"))
if let theName = middleName {
  print(theName)
}
