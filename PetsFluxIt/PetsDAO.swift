//
//  PetsDAO.swift
//  PetsFluxIt
//
//  Created by Lautaro Bonasora on 28/8/17.
//  Copyright © 2017 Lautaro Bonasora. All rights reserved.
//

import Foundation
import TTMVC
import Alamofire

class PetsDAO{

let baseURL = "http://petstore.swagger.io/v2/"


    func getPetList( ended: @escaping ([Pet]) -> Void){
    
    
        let petListUrl = baseURL + "pet/findByStatus"
        var paramDic: [String:String] = [:]
        paramDic["status"] = "available"
    
        Alamofire.request(petListUrl, parameters: paramDic).responseJSON(completionHandler:{
        
            myResponse in
        
            var petList : [Pet] = []
        
            if let petArrayDictionary = myResponse.value as? [[String: AnyObject]]{
            
            
                for newPetDictionary in petArrayDictionary{
                
                    let newPet = Pet(withDictionary: newPetDictionary)
                    
                    petList.append(newPet)
                
                }
            
                ended(petList)
            
                }
            
            
            })
        
        }
    
    func getPetListById( id: Int, ended: @escaping (Pet) -> Void){
        
        let petListUrl = baseURL + "pet/" + "\(id)"
        
        
        Alamofire.request(petListUrl).responseJSON(completionHandler:{
            
            myResponse in
            
            var myPet : Pet?
            
            if let petDictionary = myResponse.value as? [String: AnyObject]{
                
                
                
                    
                    let newPet = Pet(withDictionary: petDictionary)
                    
                    myPet = newPet
                
                
                if let pet = myPet{
                
                    ended(pet)
                
                }
            }
            
            
        })
        
    }
        
        
    
    
    
}

    
    
    
    
    
    
    
   

