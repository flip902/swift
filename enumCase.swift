enum LightBulb {
  case on
  case off
  
  func surfaceTempurature(forAmbientTemperature ambient: Double) -> Double {
    switch self {
      case .on:
        return ambient + 150.0
      case .off:
        return ambient
      }
  }
}

var bulb = LightBulb.on
let ambientTemperature = 77.0

var bulbTemperature = bulb.surfaceTempurature(forAmbientTemperature: ambientTemperature)
print("The bulb's temperature is \(bulbTemperature)")
