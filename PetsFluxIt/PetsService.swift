//
//  PetsService.swift
//  PetsFluxIt
//
//  Created by Lautaro Bonasora on 28/8/17.
//  Copyright © 2017 Lautaro Bonasora. All rights reserved.
//

import Foundation

class PetService{


func getPetList( ended: @escaping ([Pet]) -> Void){
    
    let petDAO = PetsDAO()
    
    petDAO.getPetList(ended: {
        
        myPets in
        
        ended(myPets)
        
    })
}
    
    func getPetListById(id: Int, ended: @escaping (Pet) -> Void){
        
        let petDAO = PetsDAO()
        
        petDAO.getPetListById(id: id, ended: {
            
            myPet in
            
            ended(myPet)
            
        })
    }







}
    
    
    
    
    
