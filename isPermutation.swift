/*extension String {*/
  
  /*func isPermutation(s: String) -> Bool {*/
    /*return characterCounts() == s.characterCounts()*/
  /*}*/
/*}*/

/*extension String {*/
  
  /*func characterCounts() -> [Character: Int] {*/
    /*var characterCounts = [Character: Int]()*/
    /*self.forEach { c in*/
      /*characterCounts[c] = (characterCounts[c] ?? 0) + 1*/
    /*}*/
    /*return characterCounts*/
  /*}*/
/*}*/

/*let s1 = "elvis"*/
/*let s2 = "lives"*/

/*let isper = s2.isPermutation(s: s1)*/
/*print(isper)*/

extension String {

  public func isPermutation(_ other: String) -> Bool {
    var map = [Character: Int]()
    
    // O(n)
    for c in self {
      if let value = map[c] { map[c] = value + 1
      } else { map[c] = 1 }
    }
    
    // O(n)
    for c in other {
      if let value = map[c] { map[c] = value - 1
      } else { return false }
    }
    
    // O(n)
    for (_, value) in map {
      if value != 0 { return false }
    }

    return true
  }
}  
  
print("abc".isPermutation("cba"))
print("abc".isPermutation("aabc"))
  
  
  
  
  
  
  
