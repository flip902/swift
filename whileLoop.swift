var numberOfLives = 10 
var stillAlive = true
while stillAlive {
  print(numberOfLives)
  numberOfLives -= 1
  if numberOfLives == 0 {
    stillAlive = false
    print("you have no more lives!")
  }
}
