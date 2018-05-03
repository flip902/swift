extension String {
    
    func urlIfy() -> String {
        var s = ""
        for c in self {
            s += c == " " ? "%20" : String(c)
        }
        return s
    }
    
    mutating func urlIfyInPlace() {
        var replacements = 0
        withMutableCharacters { cv in
            for i in cv.indices where cv[i] == " " {
                cv.replaceSubrange(i...i, with: "%")
                let next = cv.index(after: i)
                cv.insert(contentsOf: "20", at: next)
                replacements += 1
            }
        }
    }
}

var string = "mr william savary"
var copy = string
copy.urlIfyInPlace()
print("\"\(copy)\"")
