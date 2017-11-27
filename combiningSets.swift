var groceryBag: Set = ["Apples", "Oranges", "Pineapple"]
for food in groceryBag {
  print(food)
}

let hasBananas = groceryBag.contains("Bananas")
let friendsGrocereryBag = Set(["Bananas", "Cereal", "Milk", "Oranges"])
let commonGroceryBag = groceryBag.union(friendsGrocereryBag)
print(commonGroceryBag)

let roomatesGroceryBag: Set = ["Apples", "Bananas", "Cereal", "Toothpaste"]
let itemsToReturn = commonGroceryBag.intersection(roomatesGroceryBag) 
print(itemsToReturn)
