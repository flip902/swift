
struct Point: Comparable {
  let x: Int
  let y: Int

  static func ==(lhs: Point, rhs: Point) -> Bool {
    return (lhs.x == rhs.x) && (lhs.y == rhs.y)
  }

  static func <(lhs: Point, rhs: Point) -> Bool {
    return (lhs.x < rhs.x) && (lhs.y < rhs.y)
  }
}

let a = Point(x: 3, y: 4)
let b = Point(x: 3, y: 4)
let abEqual = (a == b)
print(abEqual)
let abNotEqual = (a != b)
print(abNotEqual)

let c = Point(x: 2, y: 6)
let d = Point(x: 3, y: 7)

let cdEqual = (c == d)
let cLessThanD = (c < d)
print("\(cdEqual), \(cLessThanD)")

let cLessThanEqualD = (c <= d)
let cGreaterThanD = (c > d)
let cGreaterThanEqualD = (c >= d)
print(cLessThanEqualD, cGreaterThanD, cGreaterThanEqualD)





