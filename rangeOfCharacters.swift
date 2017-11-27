let characters = "Hello, playground"
let start = characters.startIndex
let end = characters.index(start, offsetBy: 4)
let fifthChar = characters[end]
let range = start...end
let firstFive = characters[range]
print("The first 5 chars from \"\(characters)\" are \"\(firstFive)\"")
