let saying = "great minds think alike"
var sayingOutput = ""
let charactersToRemove: [Character] = ["a", "e", "i", "o", "u"]
for character in saying {
  if charactersToRemove.contains(character) {
    continue
  } else {
      sayingOutput.append(character)
  }
}
print(sayingOutput)
