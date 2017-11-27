let precintPopulations = [1244, 2021, 2157]
/*let projectedPopulations = precintPopulations.map {*/
  /*(population: Int) -> Int in*/
  /*return population * 2*/
/*}*/

let projectedPopulations = precintPopulations.map { $0 * 2 }

print(projectedPopulations)
