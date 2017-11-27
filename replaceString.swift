var value = "green red blue"
print(value)

// Replace range at positions 6 through 9.
let start = value.index(value.startIndex, offsetBy: 6)
let end = value.index(value.startIndex, offsetBy: 6 + 3)
value.replaceSubrange(start..<end, with: "yellow")
print(value)
