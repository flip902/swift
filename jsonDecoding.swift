import Foundation

extension URL {
    func withQueries(_ queries: [String: String]) -> URL? {
        var components = URLComponents(url: self, resolvingAgainstBaseURL: true)
        components?.queryItems = queries.flatMap { URLQueryItem(name: $0.0, value: $0.1) }
        return components?.url
    }
}

let baseUrl = URL(string: "https://api.nasa.gov/planetary/apod")!

let query: [String: String] = [
    "api_key": "DEMO_KEY",
]
let sema = DispatchSemaphore(value: 0)


let url = baseUrl.withQueries(query)!
let task = URLSession.shared.dataTask(with: url) { (data, response, error) in
    let jsonDecoder = JSONDecoder()
    if let data = data,
        let photoDictionary = try? jsonDecoder.decode([String: String].self, from: data) {
        print(photoDictionary)
        sema.signal()
    }
}

task.resume()
sema.wait()
