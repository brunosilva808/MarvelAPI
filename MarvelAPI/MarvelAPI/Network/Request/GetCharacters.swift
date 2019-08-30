//
//  GetCharacters.swift
//  MarvelAPI
//
//  Created by Bruno Silva on 28/08/2019.
//  Copyright © 2019 Bruno Silva. All rights reserved.
//

import UIKit

struct Request {

    struct GetCharacters: APIRequest {
        typealias Response = [ComicCharacter]
        
        var resourceName: String {
            return "characters"
        }
        
        // Parameters
        let name: String?
        let nameStartsWith: String?
        let limit: Int?
        let offset: Int?
        
        init(name: String? = nil,
             nameStartsWith: String? = nil,
             limit: Int? = nil,
             offset: Int? = nil) {
            self.name = name
            self.nameStartsWith = nameStartsWith
            self.limit = limit
            self.offset = offset
        }
    }

}
