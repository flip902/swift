import UIKit
import PlaygroundSupport

// Part One: HTTP, URLs, and URL Session

PlaygroundPage.current.needsIndefiniteExecution = true

extension URL {
    
    func withQueries(_ queries: [String: String]) -> URL? {
        var components = URLComponents(url: self, resolvingAgainstBaseURL: true)
        components?.queryItems = queries.flatMap { URLQueryItem(name: $0.0, value: $0.1) }
        return components?.url
    }
}

struct StoreItem: Codable {
    var title: String
    var artist: String
    var description: String

    
    enum CodingKeys: String, CodingKey {
        case title
        case artist
        case description
    }
    
    enum AdditionalKeys: String, CodingKey {
        case longDescription
    }
    
    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        self.title = try values.decode(String.self, forKey: CodingKeys.title)
        self.artist = try values.decode(String.self, forKey: CodingKeys.artist)
        self.description = try values.decode(String.self, forKey: CodingKeys.description)
    }
    
}

struct StoreItems: Codable {
    let results: [StoreItem]
}

func fetchItems(matching query: [String: String], completion:
    @escaping ([StoreItem]?) -> Void) {
    let baseURL = URL(string:
        "https://itunes.apple.com/search?")!
    guard let url = baseURL.withQueries(query) else {
        completion(nil)
        print("Unable to build URL with supplied queries.")
        return
    }
    let task = URLSession.shared.dataTask(with: url) { (data,
        response, error) in
        let decoder = JSONDecoder()
        if let data = data,
            let storeItems = try?
                decoder.decode(StoreItems.self, from: data) {
            completion(storeItems.results)
        } else {
            print("Either no data was returned, or data was not serialized.")
            completion(nil)
            return
        }
    }
    task.resume()
}



let query: [String: String] = [
    "term": "All Eyes On Me",
    "media": "music",
    "lang": "en_us",
    "limit": "10"
]
fetchItems(matching: query) { (items) in
    print(items)
}



