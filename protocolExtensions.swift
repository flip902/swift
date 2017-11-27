protocol Exercise: CustomStringConvertible {
  var name: String { get }
  var caloriesBurned: Double { get }
  var minutes: Double { get }
}

extension Exercise {
  var description: String {
    return "Exercise(\(name), burned \(caloriesBurned) calories in \(minutes) minutes)"
  }
}

struct EllipticalWorkout: Exercise {
  let name = "Elliptical Workout"
  let title = "Workout using Trainer 3000 machine"
  let caloriesBurned: Double
  let minutes: Double
}

let ellipticalWorkout = EllipticalWorkout(caloriesBurned: 335, minutes: 30)

struct TredmillWorkout: Exercise {
  let name = "Treadmill Workout" 
  let caloriesBurned: Double
  let minutes: Double
  let laps: Double
}

extension TredmillWorkout {
  var description: String {
    return "TreadmillWorkout(\(caloriesBurned) calories and \(laps) laps in \(minutes) minutes)"
  }
}

let treadmillWorkout = TredmillWorkout(caloriesBurned: 350, minutes: 25, laps: 10.5)

extension Exercise {
  var caloriesBurnedPerMinute: Double {
    return caloriesBurned / minutes
  }
}

print(ellipticalWorkout.caloriesBurnedPerMinute)
print(treadmillWorkout.caloriesBurnedPerMinute)

extension Sequence where Iterator.Element == Exercise {
  func totalCaloriesBurned() -> Double {
    var total: Double = 0
    for exercise in self {
      total += exercise.caloriesBurned
    }
    return total
  }
}

let mondayWorkout: [Exercise] = [ellipticalWorkout, treadmillWorkout]
print(mondayWorkout.totalCaloriesBurned())

print(ellipticalWorkout)
print(treadmillWorkout)

extension Exercise {
  var title: String {
    return "\(name) - \(minutes) minutes"
  }
}

for exercise in mondayWorkout {
  print(exercise.title)
}
print(ellipticalWorkout.title)
