//
//  DetailTableViewCell.swift
//  PetsFluxIt
//
//  Created by Lautaro Bonasora on 29/8/17.
//  Copyright © 2017 Lautaro Bonasora. All rights reserved.
//

import UIKit

class DetailTableViewCell: UITableViewCell {
    
    @IBOutlet weak var petImage: UIImageView!

    
    @IBOutlet weak var imageName: UILabel!
    
    
    @IBOutlet weak var prop1Outlet: UILabel!

    @IBOutlet weak var prop2Outlet: UILabel!
    @IBOutlet weak var value1Outlet: UILabel!
    @IBOutlet weak var value2Outlet: UILabel!
    
    func setup(propTitle1: String, propTitle2: String, value1: String, value2: String){
        
       self.initOutlets()
        
        prop1Outlet.text = propTitle1
        prop2Outlet.text = propTitle2
        value1Outlet.text = value1
        value2Outlet.text = value2
        
//        if let dictionary = propertie as? [String: AnyObject]{
//            
//            value1Outlet.text = String(describing: dictionary["id"] as? Int)
//            value2Outlet.text = dictionary["name"] as? String
//            prop1Outlet.text = "id"
//            prop2Outlet.text = "name"
//        }
//        
//        if let aPropertie = propertie as? 
        
    }
    
    
    func setUpImage(imageUrl: String){
        
        self.initOutlets()
        
        if imageUrl == "string"{
         
            imageName.text = "No Images Found"
            
        }else{
            
            
            imageName.text = imageUrl
            petImage.image = #imageLiteral(resourceName: "bobbyPlaceHolder")
            petImage.alpha = 1
            
            
            
        }
        
        
        
    }
    
    
    func initOutlets(){
        
        prop2Outlet.text = ""
        prop1Outlet.text = ""
        value1Outlet.text = ""
        value2Outlet.text = ""
        petImage.alpha = 0
        imageName.text = ""
   
        
    }
    
    
    func getProp1() -> String {
        
        if let prop1 = prop1Outlet.text{
            
            return prop1
        }
        
        return ""
    }
    
    func getProp2() -> String {
        
        if let prop2 = prop2Outlet.text{
            
            return prop2
        }
        
        return ""
    }
    
    func getValue1() -> String {
        
        if let value1 = value1Outlet.text{
            
            return value1
        }
        
        return ""
    }
    
    func getValue2() -> String {
        
        if let value2 = value2Outlet.text{
            
            return value2
        }
        
        return ""
    }
    
    
    
    
    
  
}
