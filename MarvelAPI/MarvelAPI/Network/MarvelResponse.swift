//
//  MarvelResponse.swift
//  MarvelAPI
//
//  Created by Bruno Silva on 29/08/2019.
//  Copyright © 2019 Bruno Silva. All rights reserved.
//

import UIKit

struct MarvelResponse<Response: Decodable>: Decodable {
    let status: String?
    let message: String?
    let data: DataContainer<Response>?
}

struct DataContainer<Results: Decodable>: Decodable {
    let offset: Int
    let limit: Int
    let total: Int
    let count: Int
    let results: Results
}
