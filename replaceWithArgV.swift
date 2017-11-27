let arg: String? = CommandLine.arguments[1]

if let argV = arg { 
  var value = "green red blue"
  print(value)
  
  let start = value.index(value.startIndex, offsetBy: 6)
  let end = value.index(value.startIndex, offsetBy: 6 + 3)
  value.replaceSubrange(start..<end, with: argV)
  print(value)
}

