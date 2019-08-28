//
//  ComicCharacters.swift
//  MarvelAPI
//
//  Created by Bruno Silva on 28/08/2019.
//  Copyright © 2019 Bruno Silva. All rights reserved.
//

import UIKit

struct ComicCharacter: Decodable {
    let id: Int
    let name: String?
    let description: String?
    let thumbnail: Image?
}
