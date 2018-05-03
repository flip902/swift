func swapTwoValues<T>(_ a: inout T, _ b: inout T) {
  print("(\(a), \(b))")
  let tempA = a
  a = b
  b = tempA
  print("(\(a), \(b))")
}
var someInt = 1
var anotherInt = 2
swapTwoValues(&someInt, &anotherInt)

// Swap without using 3rd variable
/*var a = 10*/
/*var b = 20*/
/*a = a + b*/
/*b = a - b*/
/*a = a - b*/
/*print(a)*/
/*print(b)*/

// Swift let's you use tuples to swap
/*var a = 1*/
/*var b = 2*/
/*(b, a) = (a, b)*/
/*print(a, b)*/
