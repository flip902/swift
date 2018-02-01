extension String {
  
  func hasUniqueCharacters() -> Bool {
    var uniqueCharacters = Set<Character>()
    for c in self {
      guard !uniqueCharacters.contains(c) else { return false }
      uniqueCharacters.insert(c)
    }
    return true
  }
}

let unique = "abc"
let dup = "abca"

print(unique.hasUniqueCharacters())
print(dup.hasUniqueCharacters())


