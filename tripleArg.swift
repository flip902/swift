let arg = CommandLine.arguments[1]

if let argV = Int(arg) {
  let result = argV * 3
  print("If you multiply \(arg) by 3, you'll get \(result).")
} else {
  print("argument is not an Integer")
}

