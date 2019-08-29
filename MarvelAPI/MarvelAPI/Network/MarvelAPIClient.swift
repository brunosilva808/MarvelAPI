//
//  MarvelAPIClient.swift
//  MarvelAPI
//
//  Created by Bruno Silva on 29/08/2019.
//  Copyright © 2019 Bruno Silva. All rights reserved.
//

import UIKit

class MarvelAPIClient: APIClient {
    func send<T>(_ request: T, completion: @escaping (Result<T.Response, Error>) -> Void) where T : APIRequest {
        
    }
}
