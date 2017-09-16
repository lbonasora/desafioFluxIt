//
//  PetsListTableViewCell.swift
//  PetsFluxIt
//
//  Created by Lautaro Bonasora on 28/8/17.
//  Copyright © 2017 Lautaro Bonasora. All rights reserved.
//

import UIKit

class PetsListTableViewCell: UITableViewCell {
    
    
    @IBOutlet weak var nameLabel: UILabel!
    

    func setup(pet: Pet){
        
        if let petName = pet.name{
            
            nameLabel.text = petName
            
        }
   
    }

}
