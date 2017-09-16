//
//  Tag.swift
//  PetsFluxIt
//
//  Created by Lautaro Bonasora on 28/8/17.
//  Copyright © 2017 Lautaro Bonasora. All rights reserved.
//

import Foundation

class Tag{
    
    var id: Int?
    var name: String?
    
    
    init(withDictionary: [String:AnyObject]){
        
        id = withDictionary["id"] as? Int
        name = withDictionary["name"] as? String
        
    }
    
    
}
