import Foundation

enum Status {
  case Continue, Won, Lost
}

// Common dice totals
enum DiceNames: Int {
  case SnakeEyes = 2
  case Trey = 3
  case Seven = 7
  case YoLeven = 11
  case BoxCars = 12
}

// function that rolls two dice and returns them and their sum as a tuple
func rollDice() -> (die1: Int, die2: Int, sum: Int) {
  let die1 = Int(1 + arc4random_uniform(6))
  let die2 = Int(1 + arc4random_uniform(6))
  return (die1, die2, die1 + die2)
}

// function to display roll of dice
func displayRoll(_ roll: (Int, Int, Int)) {
  print("Player rolled \(roll.0) + \(roll.1) = \(roll.2)")
}

// play one game of craps
var myPoint = 0
var gameStatus = Status.Continue

var roll = rollDice()
displayRoll(roll)

// determine game status and point based on first roll
switch roll.sum {
  // win on first roll
  case DiceNames.Seven.rawValue, DiceNames.YoLeven.rawValue:
    gameStatus = Status.Won
  // loose on first roll
  case DiceNames.SnakeEyes.rawValue, DiceNames.Trey.rawValue, DiceNames.BoxCars.rawValue:
    gameStatus = Status.Lost
  // did not win or loose, so remember point
  default:
    gameStatus = Status.Continue
    myPoint = roll.sum
    print("Point is \(myPoint)")
}

// while game is not complete
while gameStatus == Status.Continue {
  roll = rollDice()
  displayRoll(roll)
  
  // determine game status
  if roll.sum == myPoint {
    gameStatus = Status.Won
  } else {
    if (roll.sum == DiceNames.Seven.rawValue) {
      gameStatus = Status.Lost
    }
  }
}

// display won or lost message
if gameStatus == Status.Won {
  print("Player Wins!")
} else {
  print("Player loses")
}


