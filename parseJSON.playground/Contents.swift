import Foundation
import UIKit

let json =
"""
{
    "greeting": "Welcome to Haligrove",
    "instructions": [
        "Choose a strain",
        "Call or text your order"
    ],
    "name": "Billy",
    "age": 27
}
"""

struct Welcome: Codable {
    let greeting: String
    let instructions: [String]
    let name: String
    let age: Int
    
    enum CodingKeys: String, CodingKey {
        case greeting = "greeting"
        case instructions = "instructions"
        case name = "name"
        case age = "age"
    }
}

extension Welcome {
    init(data: Data) throws {
        self = try JSONDecoder().decode(Welcome.self, from: data)
    }
    
    init(_ json: String, using encoding: String.Encoding = .utf8) throws {
        guard let data = json.data(using: encoding) else {
            throw NSError(domain: "JSONDecoding", code: 0, userInfo: nil)
        }
        try self.init(data: data)
    }
    
    init(fromURL url: URL) throws {
        try self.init(data: try Data(contentsOf: url))
    }
    
    func jsonData() throws -> Data {
        return try JSONEncoder().encode(self)
    }
    
    func jsonString(encoding: String.Encoding = .utf8) throws -> String? {
        return String(data: try self.jsonData(), encoding: encoding)
    }
}

let welcome = try Welcome(json)
print(welcome)












