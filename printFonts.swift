func printFonts() {
    for family in UIFont.familyNames.sorted() {
      print("---------------------------")
            
      let sName: String = family as String
      print("family: \(sName)")
            
      for name in UIFont.fontNames(forFamilyName: sName) {
        print("name: \(name as String)")
      }
    }
}
