import UIKit
import PlaygroundSupport



PlaygroundPage.current.needsIndefiniteExecution = true

extension URL {
    
    func withQueries(_ queries: [String: String]) -> URL? {
        
        var components = URLComponents(url: self, resolvingAgainstBaseURL: true)
        components?.queryItems = queries.flatMap { URLQueryItem(name: $0.0, value: $0.1) }
        return components?.url
    }
}

struct StoreItem: Codable {
    var kind: String
    var artistName: String
    var trackName: String
    var description: String
    
    enum CodingKeys: String, CodingKey {
        case kind
        case artistName
        case trackName
        case description
    }
    
    enum AdditonalKeys: String, CodingKey {
        case longDescription
    }
    
    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        kind = try values.decode(String.self, forKey: CodingKeys.kind)
        artistName = try values.decode(String.self, forKey: CodingKeys.artistName)
        trackName = try values.decode(String.self, forKey: CodingKeys.trackName)
        
        if let description = try? values.decode(String.self, forKey: CodingKeys.description) {
            self.description = description
        } else {
            let additionalValues = try decoder.container(keyedBy: AdditonalKeys.self)
            description = (try? additionalValues.decode(String.self, forKey: AdditonalKeys.longDescription)) ?? ""
        }
    }
}

struct StoreItems: Codable {
    let results: [StoreItem]
}

func fetchItems(matching query: [String: String], completion: @escaping ([StoreItem]?) -> Void) {
    let baseURL = URL(string: "https://itunes.apple.com/search?")!
    
    guard let url = baseURL.withQueries(query) else {
        completion(nil)
        print("unable to build URL with supplied queries")
        return
    }
    
    let task = URLSession.shared.dataTask(with: url) { (data, response, error) in
        let decoder = JSONDecoder()
        if let data = data,
            let storeItems = try? decoder.decode(StoreItems.self, from: data) {
            completion(storeItems.results)
        } else {
            print("Error")
            completion(nil)
            return
        }
    }
    task.resume()
}

let query: [String: String] = [
    "term": "2 Pac",
    "media": "music",
    "lang": "en_us",
    "limit": "10"
]
fetchItems(matching: query) { (items) in
    print(items)
}
