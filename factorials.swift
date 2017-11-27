func factorial(value: UInt) -> UInt {
  if value == 0 { return 1 }
  
  var product: UInt = 1
  for i in 1...value {
    product = product * i
  }
  return product
}

func recursiveFactorial(_ value: UInt) -> UInt {
  if value == 0 { return 1 }

  return value * recursiveFactorial(value - 1)
}

print(recursiveFactorial(5))
