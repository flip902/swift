/*:
 ## Exercise - Create Functions
 
 Write a function called `introduceMyself` that prints a brief introduction of yourself. Call the funtion and observe the printout.
 */
func introduceMyself(name: String, from: String) {
    print("Hello, my name is \(name) from \(from)")
}
introduceMyself(name: "Billy", from: "Halifax")

/*:
 Write a function called `magicEightBall` that generates a random number and then uses either a switch statement or if-else-if statements to print different responses based on the random number generated. `let randomNum = arc4random_uniform(UInt32(5))` will generate a random number from 0 to 4, after which you can print different phrases corresponding to the number generated. Call the function multiple times and observe the different printouts. Note that the random number generation will not work unless your function is declared after the `import Foundation` statement below. This is because the `arc4random_uniform(_:)` function is declared in the `Foundation` framework.
 */
import Foundation



func magicEightBall() {
    let randomNum = arc4random_uniform(UInt32(6)) + 1
    
    switch randomNum {
        case 1:
            let result = 1
            print(result)
       
        case 2:
            let result = 2
            print(result)
        
        case 3:
            let result = 3
            print(result)
        
        case 4:
            let result = 4
            print(result)
        
        case 5:
            let result = 5
            print(result)
       
        case 6:
            let result = 6
            print(result)
        
        default:
            print("roll again, must of fell off table")
        
    }
    
}
magicEightBall()
magicEightBall()
magicEightBall()

//: page 1 of 6  |  [Next: App Exercise - A Functioning App](@next)
