let celebrities: [String?] = ["Michael Jackson", nil, "Michael Caine", nil, "Michael Jordan"]

/*for name in celebrities where name != nil {*/
  /*print(name)*/
/*}*/

for case let name? in celebrities {
  print(name)
}
