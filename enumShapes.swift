enum ShapeDimensions {
  case square(side: Double)
  
  case rectangle(width: Double, height: Double)
  
  func area() -> Double {
    switch self {
      case let .square(side: side):
        return side * side
      case let .rectangle(width: w, height: h):
        return w * h
    }
  }
}
var squareShape = ShapeDimensions.square(side: 10.0)
var rectShape = ShapeDimensions.rectangle(width: 5.0, height: 10.0)

print("square's area = \(squareShape.area())")
print("rectangle's area = \(rectShape.area())")
