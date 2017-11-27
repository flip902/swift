func makePopulationTracker(forInitialPopulation population: Int) -> (Int) ->Int {
  var totalPopulation = population
  func populationTracker(growth: Int) -> Int {
    totalPopulation += growth
    return totalPopulation
  }
  return populationTracker
}
var currentPopulation = 5_500
let growby = makePopulationTracker(forInitialPopulation: currentPopulation)
currentPopulation = growby(500)
currentPopulation = growby(1000)
print(currentPopulation)
