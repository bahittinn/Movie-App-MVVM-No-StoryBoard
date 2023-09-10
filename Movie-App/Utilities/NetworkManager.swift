//
//  NetworkManager.swift
//  Movie-App
//
//  Created by Bahittin on 5.09.2023.
//

import Foundation

class NetworkManager {
    static let shared = NetworkManager()
    private init() {}
    
     
    func download(url: URL, completion: @escaping (Result<Data, Error>) -> ()) {
        
        let headers = [
            "accept": "application/json",
            "Authorization": "Bearer \(API_TOKEN)"
        ]
        
        let request = NSMutableURLRequest(url: NSURL(string: "\(API_URL)")! as URL,
                                          cachePolicy: .useProtocolCachePolicy,
                                          timeoutInterval: 10.0)
        request.httpMethod = "GET"
        request.allHTTPHeaderFields = headers
        
         URLSession.shared.dataTask(with: request as URLRequest) { data, response, error in
            if let error = error {
                print("DEBUG: error is \(error.localizedDescription)")
                completion(.failure(error))
                return
            }
            
            guard let response = response as? HTTPURLResponse, response.statusCode == 200 else {
                completion(.failure(URLError(.badServerResponse)))
                return
            }
            
            guard let data = data else {
                completion(.failure(URLError(.badURL)))
                return
            }
            
            completion(.success(data))
         }.resume() 
    }
}
