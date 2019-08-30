//
//  URLQueryItemEncoder.swift
//  MarvelAPI
//
//  Created by Bruno Silva on 29/08/2019.
//  Copyright © 2019 Bruno Silva. All rights reserved.
//

import UIKit

enum URLQueryItemEncoder {
    static func encode<T: Encodable>(_ encodable: T) throws -> [URLQueryItem] {
        let parametersData = try JSONEncoder().encode(encodable)
        let parameters = try JSONDecoder().decode([String: HTTPParameter].self, from: parametersData)
        return parameters.map { URLQueryItem(name: $0, value: $1.description) }
    }
}
