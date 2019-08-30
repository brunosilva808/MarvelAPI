//
//  MarvelAPIClient.swift
//  MarvelAPI
//
//  Created by Bruno Silva on 29/08/2019.
//  Copyright © 2019 Bruno Silva. All rights reserved.
//

import UIKit

class MarvelAPIClient: APIClient {
    
    private let baseEndpointUrl = URL(string: "https://gateway.marvel.com:443/v1/public/")!
    private let session = URLSession(configuration: .default)
    private let publicKey: String
    private let privateKey: String
    
    init(privateKey: String, publicKey: String) {
        self.privateKey = privateKey
        self.publicKey = publicKey
    }
    
    func send<T>(_ request: T,
                 completion: @escaping ResultCallback<DataContainer<T.Response>>) where T : APIRequest {
        let endpoint = self.endpoint(for: request)
        
        let task = session.dataTask(with: URLRequest(url: endpoint)) { (data, response, error) in
            if let data = data {
                do {
                    let marvelResponse = try JSONDecoder().decode(MarvelResponse<T.Response>.self, from: data)
                    if let dataContainer = marvelResponse.data {
                        completion(.success(dataContainer))
                    } else if let message = marvelResponse.message, let statusCode = marvelResponse.status {
                        completion(.failure(MarvelError.server(message: message, statusCode: statusCode)))
                    } else {
                        completion(.failure(MarvelError.decoding))
                    }
                } catch {
                    completion(.failure(error))
                }
            }
        }
        
        task.resume()
    }
    
    func endpoint<T: APIRequest>(for request: T) -> URL {
        guard let url = URL(string: request.resourceName, relativeTo: baseEndpointUrl) else {
            fatalError("Bad resourceName: \(request.resourceName)")
        }
        
        guard var components = URLComponents(url: url, resolvingAgainstBaseURL: true) else {
            fatalError("URL is malformed: \(url)")
        }
        
        // Common query items needed for all Marvel requests
        let timestamp = "\(Date().timeIntervalSince1970)"
        let hash = "\(timestamp)\(privateKey)\(publicKey)".md5
        let commonQueryItems = [
            URLQueryItem(name: "ts", value: timestamp),
            URLQueryItem(name: "hash", value: hash),
            URLQueryItem(name: "apikey", value: publicKey)
        ]
        
        // Custom query items needed for this specific request
        let customQueryItems: [URLQueryItem]
        
        do {
            customQueryItems = try URLQueryItemEncoder.encode(request)
        } catch {
            fatalError("Wrong parameters: \(error)")
        }
        
        components.queryItems = commonQueryItems + customQueryItems
        
        return components.url!
    }

}
