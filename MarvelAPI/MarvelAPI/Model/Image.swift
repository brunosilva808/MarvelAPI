//
//  Image.swift
//  MarvelAPI
//
//  Created by Bruno Silva on 28/08/2019.
//  Copyright © 2019 Bruno Silva. All rights reserved.
//

import UIKit

struct Image: Decodable {
    let url: URL
    
    enum ImageKeys: String, CodingKey {
        case path = "path"
        case fileExtension = "extension"
    }
    
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: ImageKeys.self)
        
        let path = try container.decode(String.self, forKey: .path)
        let fileExtension = try container.decode(String.self, forKey: .fileExtension)
        
        guard let url = URL(string: "\(path).\(fileExtension)") else { throw MarvelError.decoding }
        
        self.url = url
    }
}
