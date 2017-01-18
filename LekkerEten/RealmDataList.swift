//
//  RealmDataList.swift
//  LekkerEten
//
//  Created by Fhict on 18/01/17.
//  Copyright © 2017 fontys.edu. All rights reserved.
//

import Foundation
import RealmSwift

class Ingredients : Object{
    
    dynamic var name = ""
    let ingredients = List<Ingredient>()
}
