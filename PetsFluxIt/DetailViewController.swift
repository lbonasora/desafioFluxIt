//
//  DetailViewController.swift
//  PetsFluxIt
//
//  Created by Lautaro Bonasora on 28/8/17.
//  Copyright © 2017 Lautaro Bonasora. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController, UITableViewDelegate, UITableViewDataSource{
    
    var petId : Int?
    var pet: Pet?
    var index = 0
    let numberOfProperties = 5
    var photoUrls: [String] = []
    var propAndValues = [[String]]()
    var propAux: [String] = []
    
    var prop1: String?
    var prop2: String?
    var value1: String?
    var value2: String?
    
    
    @IBOutlet weak var segmented: UISegmentedControl!

    @IBOutlet weak var tableView: UITableView!
   
    @IBAction func segmentedChanged(_ sender: Any) {
        
        tableView.reloadData()
        self.viewDidLoad()
        
        
        

    }


    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.tableView.delegate = self
        self.tableView.dataSource = self
        self.tableView.rowHeight = 115.0
        
        
   
        
        
        
        let petService = PetService()
        
       
        
        
        if let id = petId{
        
            petService.getPetListById(id: id,ended: {
            
                myPet in
            
                self.pet = myPet
                self.tableView.reloadData()
            
            
            })
    
        }
        
        if let urls = pet?.photoUrls{
            
            photoUrls = urls
            
        }
        

        // Do any additional setup after loading the view.
    }
    
    
    func numberOfSections(in tableView: UITableView) -> Int {
        
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        if segmented.selectedSegmentIndex == 0{
            
            return numberOfProperties
            
        }
        
        return photoUrls.count
    }
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "detailCell", for: indexPath)
        
        
        
        if segmented.selectedSegmentIndex == 0{
            
            
            if let petCell = cell as? DetailTableViewCell {
                
                if let name = pet?.name, let id = pet?.id, let category = pet?.category, let categoryName = category.name, let categoryId = category.id, let status = pet?.status{
            
                    switch indexPath.row {
                case 0:
                    petCell.setup(propTitle1: "id:", propTitle2:"" , value1: "\(id)", value2: "")
                case 1:
                    petCell.setup(propTitle1: "Pet Name:", propTitle2: "", value1: name, value2: "")
                case 2:
                    petCell.setup(propTitle1: "Category Name:", propTitle2: "Category Id:", value1:     categoryName, value2: "\(categoryId)")
                case 3:
                    petCell.setup(propTitle1: "Tags", propTitle2: "", value1: "", value2: "")
                case 4:
                    petCell.setup(propTitle1: "Status", propTitle2: "", value1: status, value2: "")
                default:
                    break;
                    }
                    
                    
                    propAux = [petCell.getProp1(), petCell.getProp2(), petCell.getValue1(), petCell.getValue2()]
                    
                    propAndValues.append(propAux)
                    

                }
            
            }
        }
        
        
        if segmented.selectedSegmentIndex == 1{
 
            
            if let petCell = cell as? DetailTableViewCell{
                
                let url = photoUrls[indexPath.row]
                petCell.setUpImage(imageUrl: url)
            }
    
            
        }
        
        
        return cell
        
        
    }
    
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        if segmented.selectedSegmentIndex == 0{
            
            if indexPath.row == 3{
                
                let alertController = UIAlertController(title: "Tags", message: "not available", preferredStyle: UIAlertControllerStyle.alert)
                alertController.addAction(UIAlertAction(title: "Ok", style: UIAlertActionStyle.default, handler: nil))
                self.present(alertController, animated: true, completion: nil)
                
                
                
//                if let tagTableController = storyboard?.instantiateViewController(withIdentifier: "tagViewController") as? TagTableViewController{
                
                    // Al pasar al TagTableViewController encuentro error "does not implement methodSignatureForSelector"
                    
//                    if let tags = pet?.tags{
//                        
//                        tagTableController.tags = tags
//                        
//                    }
//                    
//                    navigationController?.pushViewController(tagTableController, animated: true)
//                    
//                    
//                }
//                
                
            }else{
                
                let alertController = UIAlertController(title: propAndValues[indexPath.row][0], message: propAndValues[indexPath.row][2], preferredStyle: UIAlertControllerStyle.alert)
                    alertController.addAction(UIAlertAction(title: "Ok", style: UIAlertActionStyle.default, handler: nil))
                    self.present(alertController, animated: true, completion: nil)
                
                
            
            
            
            }
        }
    
    }
 

 

    
    
    
    
    
    
    
    

}
