import UIKit
import PlaygroundSupport

PlaygroundPage.current.needsIndefiniteExecution = true

struct Strains: Codable {
    let images: [Strain]
}

struct Strain: Codable {
    let name: String
    let type: String
    let pricePerOunce: String
    let src: String
}

func getJson() {
    let url: URL = URL(string: "http://www.haligrove.com/imageData.json")!
    let task = URLSession.shared.dataTask(with: url) { (data, response, error) in
        guard let data = data else { return }
        do {
            let strains = try JSONDecoder().decode(Strains.self, from: data)
            strains.images.map { print($0.name, $0.type, $0.pricePerOunce, $0.src) }
        } catch let jsonErr {
            print("Error serializing json:", jsonErr)
        }
    }
    task.resume()
}

getJson()
