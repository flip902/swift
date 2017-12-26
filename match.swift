let age = 36

if (0..<18) ~= age {
  print("You have the energy and time, but not the money")
} else if (18 ..< 70) ~= age {
  print("You have the energy and money, but not the time")
} else {
  print("you have the time and money, but not the energy")
}
