
func makeTownGrand(withBudget budget: Int, condition: (Int) -> Bool) -> ((Int, Int) -> Int)? {
  if condition(budget) {
    func buildRoads(byAddingLights lights: Int, toExistingLights existingLights: Int) -> Int {
      return lights + existingLights
    }
    return buildRoads
  } else {
    return nil 
  }
}
func evaluate(budget: Int) -> Bool {
  return budget > 10_000
}
var stopLights = 4
if let townPlanByAddingLightsToExistingLights = makeTownGrand(withBudget: 10_050, condition: evaluate) {
  stopLights = townPlanByAddingLightsToExistingLights(4, stopLights)
}
print("knowwhere has \(stopLights) stoplights.")
