//
//  Instructions.swift
//  Foodtruck
//
//  Created by Fhict on 10/12/16.
//  Copyright © 2016 bakker.co. All rights reserved.
//

import UIKit
import Alamofire
import AlamofireImage

class Instruction{
    
    // Fields
    let id: Int?
    let title: String?
    
    // Constructor
    init(id: Int, title: String){
        self.id = id
        self.title = title
    }
    
    init(data: [String:Any]){
        self.id = data["id"] as? Int
        self.title = data["text"] as? String
    }
}
