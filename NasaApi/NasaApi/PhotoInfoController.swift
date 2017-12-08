//
//  PhotoInfoController.swift
//  NasaApi
//
//  Created by Phillip Carlino on 2017-12-06.
//  Copyright © 2017 Phillip Carlino. All rights reserved.
//

import Foundation

struct PhotoInfoController {
    func fetchPhotoInfo(completion: @escaping (PhotoInfo?) -> Void) {
        let baseURL = URL(string: "https://api.nasa.gov/planetary/apod")!
        let query: [String: String] = ["api_key": "DEMO_KEY", "date": "2017-10-30"]
        let url = baseURL.withQueries(query)!
        
        let task = URLSession.shared.dataTask(with: url) { (data, response, error) in
            let jsonDecoder = JSONDecoder()
            if let data = data,
                let photoInfo = try? jsonDecoder.decode(PhotoInfo.self, from: data) {
                completion(photoInfo)
            } else {
                print("Either no data was returned, or data was not properly decoded")
                completion(nil)
            }
        }
        task.resume()
    }
}
