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
        let apiClient = MarvelAPIClient(/* some config */)
        
        apiClient.send(Request.GetCharacters()) { response in
            print("GetCharacters finished:")
            
            response.map { characters in
                for character in characters {
                    print("Name: \(character.name ?? "Unnamed character")")
                }
            }
        }
    }


}

