var numbers = [Int]()
for i in 1...100 {
  numbers.append(i)
}

for num in numbers {
    switch (num % 3, num % 5) {
    case (0, 0):
        print("\(num) FizzBuzz")
    case (0, _):
        print("\(num) Fizz")
    case (_, 0):
        print("\(num) Buzz")
    default:
        print(num)
    }
}

/*for num in numbers {*/
  /*if num % 15 == 0 {*/
    /*print("\(num) fizzbuzz")*/
  /*} else if num % 3 == 0 {*/
    /*print("\(num) fizz")*/
  /*} else if num % 5  == 0 {*/
    /*print("\(num) buzz")*/
  /*} else {*/
    /*print(num)*/
  /*}*/
/*}*/



// Tuple
/*for num in numbers {*/
  /*switch (num % 3, num % 5) {*/
    /*case (0, 0):*/
      /*print("FizzBuzz")*/
    /*case (0, _):*/
      /*print("Fizz")*/
    /*case (_, 0):*/
      /*print("Buzz")*/
    /*default:*/
      /*print(num)*/
  /*}*/
/*}*/


