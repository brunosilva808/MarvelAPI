//
//  ViewController.swift
//  MarvelAPI
//
//  Created by Bruno Silva on 28/08/2019.
//  Copyright © 2019 Bruno Silva. All rights reserved.
//

import UIKit

class ViewController: UITableViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        getCharacters()
    }
    
    func getCharacters() {
        let apiClient = MarvelAPIClient(privateKey: "a1b0fc8354dee2423349c6d1453dbc91a7716bc6", publicKey: "2b78d362481839c76e3df81e3b13d6e5")
        
        // A simple request with no parameters
        apiClient.send(Request.GetCharacters()) { response in
            print("\nGetCharacters finished:")
            
            response.map { dataContainer in
                for character in dataContainer.results {
                    print("  Title: \(character.name ?? "Unnamed character")")
                    print("  Thumbnail: \(character.thumbnail?.url.absoluteString ?? "None")")
                }
            }
        }
        
    }


}

