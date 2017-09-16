//
//  TagTableViewController.swift
//  PetsFluxIt
//
//  Created by Lautaro Bonasora on 31/8/17.
//  Copyright © 2017 Lautaro Bonasora. All rights reserved.
//

import UIKit

class TagTableViewController: UITableViewController {
    
    var tags : [Tag] = []
    
   
    override func viewDidLoad() {
        
        super.viewDidLoad()
        print(tags)
    }



    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return tags.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "tagCell", for: indexPath)
        
        if let tagCell = cell as? TagTableViewCell{
            
            let newTag = tags[indexPath.row]
            tagCell.setup(tag: newTag)
            
        }
        
        return cell
        
        
    }
    
    
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        let alertController = UIAlertController(title: "Tag Name:", message: tags[indexPath.row].name, preferredStyle: UIAlertControllerStyle.alert)
        alertController.addAction(UIAlertAction(title: "Ok", style: UIAlertActionStyle.default, handler: nil))
        self.present(alertController, animated: true, completion: nil)
        
        
        
    }

 

}
