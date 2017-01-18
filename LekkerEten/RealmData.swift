//
//  RealmData.swift
//  Foodtruck
//
//  Created by Fhict on 22/12/16.
//  Copyright © 2016 bakker.co. All rights reserved.
//

import Foundation
import RealmSwift

class IngredientList: Object{
    
    dynamic var name = ""
    dynamic var amount = ""
    dynamic var image: NSData?
}
