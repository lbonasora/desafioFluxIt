//
//  Pet.swift
//  PetsFluxIt
//
//  Created by Lautaro Bonasora on 28/8/17.
//  Copyright © 2017 Lautaro Bonasora. All rights reserved.
//

import Foundation



class Pet{
    
    var id: Int?
    var name: String?
    var photoUrls: [String] = []
    var category: Category?
    var tags: [Tag] = []
    var status: String?
    
    init(withDictionary: [String:AnyObject]){
        
        id = withDictionary["id"] as? Int
        name = withDictionary["name"] as? String
        status = withDictionary["status"] as? String
        
        if let urls = withDictionary["photoUrls"] as? [String]{
            
            photoUrls = urls
        }
        
        
        if let categoryDictionary = withDictionary["category"] as? [String:AnyObject],
            let tagsDictionary = withDictionary["tags"] as? [[String:AnyObject]]{
            
            category = Category(withDictionary: categoryDictionary)
            
            for dictonary in tagsDictionary{
                
                let newTag = Tag(withDictionary: dictonary)
                tags.append(newTag)
     
            }
        
        }
        
        
        
        
        
        
    }
}
