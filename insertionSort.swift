func insertionSort(alist: inout [Int]) {
  for i in 1..<alist.count {
    let tmp = alist[i]
    var j = i - 1
    while j >= 0 && alist[j] > tmp {
      alist[j+1] = alist[j]
      j = j - 1
    }
    alist[j+1] = tmp
  }
}

var alist = [2, 9, 34, 3, 17, 2, 5, 8, 1, 20, 6, 4, 7, 10, 18, 23]
print("alist before: ", alist)
insertionSort(alist: &alist)
print("alist after: ", alist)
