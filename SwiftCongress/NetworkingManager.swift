//
//  NetworkingManager.swift
//  SwiftCongress
//
//  Created by Kuba Szulaczkowski on 2/20/23.
//

import Foundation

class NetworkingManager {
    static let shared = NetworkingManager()
    private init() {}
    
    func request(completionHandler: @escaping (Data) -> Void) {
        let request = URLRequest(url: URL(string: "https://api.congress.gov/v3/member?api_key=\(CONGRESS_API_KEY)")!)
        let dataTask = URLSession.shared.dataTask(with: request) { data, response, error in
            guard error == nil else {
                print(error)
                return
            }
            
            if let response = response as? HTTPURLResponse, (200...300) ~= response.statusCode {
                
            }
                
            guard let data else { return }
            completionHandler(data)
        }
        dataTask.resume()
    }
}
