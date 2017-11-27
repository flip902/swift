let valuesArray = [20, 17, 35, 4, 12]
print("original array: \(valuesArray)")
// square each value then filter for even squares 
let allResults = valuesArray.map{$0 * $0}.filter{$0 % 2 == 0}
print("after squared and filtered for even numbers: \(allResults)")

