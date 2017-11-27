/*:
 ## Exercise - Type Casting and Inspection
 
 Create a collection of type [Any], including a few doubles, integers, strings, and booleans within the collection. Print the contents of the collection.
 */
let all: [Any] = ["one", 1, "two", 2, true, false, 1.2, "Billy"]
print(all)


/*:
 Loop through the collection. For each integer, print "The integer has a value of ", followed by the integer value. Repeat the steps for doubles, strings and booleans.
 */
for item in all {
    if let item = item as? Bool {
        print("This Boolean has a value of \(item)")
    } else if let item = item as? String {
        print("This String has a value of \(item)")
    } else if let item = item as? Double {
        print("This Double has a value of \(item)")
    } else if let item = item as? Int {
        print("This Int has a value of \(item)")
    }
}

/*:
 Create a [String : Any] dictionary, where the values are a mixture of doubles, integers, strings, and booleans. Print the key/value pairs within the collection
 */
let dictionary: [String: Any] = ["Apple" : 7.9, "Linux" : 7, "Microsoft" : "sucks", "GNU" : true]
print(dictionary)

/*:
 Create a variable `total` of type `Double` set to 0. Then loop through the dictionary, and add the value of each integer and double to your variable's value. For each string value, add 1 to the total. For each boolean, add 2 to the total if the boolean is `true`, or subtract 3 if it's `false`. Print the value of `total`.
 */
var total: Double = 0
for (_, value) in dictionary {
    if let value = value as? Bool {
        if value {
            total += 2
        } else {
            total -= 3
        }
    } else if let value = value as? Double {
        total += value
    } else if let value = value as? String {
        total += 1
    } else if let value = value as? Int {
        total += Double(value)
    }
}
print(total)

/*:
 Create a variable `total2` of type `Double` set to 0. Loop through the collection again, adding up all the integers and doubles. For each string that you come across during the loop, attempt to convert the string into a number, and add that value to the total. Ignore booleans. Print the total.
 */
var total2: Double = 0


//: page 1 of 2  |  [Next: App Exercise - Workout Types](@next)
