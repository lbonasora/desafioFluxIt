//
//  TagTableViewCell.swift
//  PetsFluxIt
//
//  Created by Lautaro Bonasora on 31/8/17.
//  Copyright © 2017 Lautaro Bonasora. All rights reserved.
//

import UIKit

class TagTableViewCell: UITableViewCell {
    @IBOutlet weak var idValue: UILabel!
    @IBOutlet weak var idTitle: UILabel!
    @IBOutlet weak var nameTitle: UILabel!
    @IBOutlet weak var nameValue: UILabel!
    
    func setup(tag: Tag){
        
        
        idTitle.text = "id: "
        nameTitle.text = "name: "
        idValue.text = String(describing: tag.id)
        nameValue.text = tag.name
        
        
        
        
        
    }
}
