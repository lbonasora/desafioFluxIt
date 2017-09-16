//
//  PetsListTableViewController.swift
//  PetsFluxIt
//
//  Created by Lautaro Bonasora on 28/8/17.
//  Copyright © 2017 Lautaro Bonasora. All rights reserved.
//

import UIKit

class PetsListTableViewController: UITableViewController {
    
    var pets: [Pet] = []
    

    override func viewDidLoad() {
        super.viewDidLoad()

        
        let petService = PetService()
        
        petService.getPetList(ended: {
            
            myPets in
            
            self.pets = myPets
            self.tableView.reloadData()
    
            
            //hola 
        })
        
        self.title = "Pets FluxIt"
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return pets.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "petCell", for: indexPath)
        
        let pet = pets[indexPath.row]
        
        if let petCell = cell as? PetsListTableViewCell {
            
            petCell.setup(pet: pet)
            
        }
        
        
        return cell
        
    }
    
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        if let detailController = storyboard?.instantiateViewController(withIdentifier:"detailViewController") as? DetailViewController {
            
            
            if let petId = pets[indexPath.row].id {
                
                detailController.petId = petId
            }
            
            navigationController?.pushViewController(detailController, animated: true)
        }
    }
    
    
    



}
