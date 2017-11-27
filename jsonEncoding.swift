import Foundation

struct Employee: Equatable, Comparable, Codable {
    var firstName: String
    var lastName: String
    var jobTitle: String
    var phoneNumber: String
    
    static func ==(lhs: Employee, rhs: Employee) -> Bool {
        return lhs.firstName == rhs.firstName && lhs.lastName ==
            rhs.lastName && lhs.jobTitle == rhs.jobTitle &&
            lhs.phoneNumber == rhs.phoneNumber
    }
    
    static func < (lhs: Employee, rhs: Employee) -> Bool {
        return lhs.lastName < rhs.lastName
    }
}


let billy = Employee(firstName: "Billy", lastName: "Savary",
jobTitle: "Hacker", phoneNumber: "902-580-2569")

let jsonEncoder = JSONEncoder()
if let jsonData = try? jsonEncoder.encode(billy),
    let jsonString = String(data: jsonData, encoding: .utf8) {
    print(jsonString)
}
