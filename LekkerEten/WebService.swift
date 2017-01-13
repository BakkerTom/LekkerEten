//
//  WebService.swift
//  Foodtruck
//
//  Created by Tom Bakker on 09/12/2016.
//  Copyright © 2016 bakker.co. All rights reserved.
//

import UIKit
import Alamofire

class WebService {

    class func retrieveCategories(completion: @escaping (([Category]) -> (Void))){
        let url = "https://fijnproevers.herokuapp.com/categories.json"
        
        Alamofire.request(url).responseJSON { handler in
            guard let responseJSON = handler.result.value as? [[String: Any]] else {
                completion([])
                return
            }
            
            let categories = parse(categoryData: responseJSON)
            completion(categories)
        }
    }
    
    class func retrieveRecipes(id: Int, completion: @escaping (([Recipe]) -> (Void))){
        let url = "https://fijnproevers.herokuapp.com/categories/\(id).json"
        
        Alamofire.request(url).responseJSON{ handler in
            guard let responseJSON = handler.result.value as? [String: Any] else {
                completion([])
                return
            }
            
            let recipesData = responseJSON["recipes"] as? [[String: Any]]
            
            let recipes = parseRecipies(recipeData: recipesData!)
            
            completion(recipes)
        }
    }
    
    
    class func retrieveFoodtrucks(completion: @escaping (([Foodtruck]) -> (Void))){
        let url = "https://fijnproevers.herokuapp.com/foodtrucks.json"
        
        Alamofire.request(url).responseJSON { handler in
            guard let responseJSON = handler.result.value as? [[String: Any]] else {
                completion([])
                return
            }
            
            let foodtrucks = parse(foodtruckData: responseJSON)
            completion(foodtrucks)
        }
    }
    
    class func parse(foodtruckData: [[String: Any]]) -> [Foodtruck] {
        var foodtrucks = [Foodtruck]()
        
        for data in foodtruckData {
        foodtrucks.append(Foodtruck(data: data))
        }
    
        return foodtrucks
    
    }
    
    class func parse(categoryData: [[String: Any]]) -> [Category]{
        var categories = [Category]()
        
        for data in categoryData {
            categories.append(Category(data: data))
        }
        
        return categories
        
    }
    
    
    class func parseRecipies(recipeData: [[String: Any]]) -> [Recipe]{
        var recipies = [Recipe]()
        
        for data in recipeData {
            recipies.append(Recipe(data: data))
        }
        
        return recipies
        
    }
    
    class func retrieveInstructions(completion: @escaping (([Instruction]) -> (Void))){
        //let url = "http://fijnproevers.herokuapp.com/categories/1.json"
        let url = "http://fijnproevers.herokuapp.com/instructions.json"
        
        Alamofire.request(url).responseJSON { handler in
            guard let responseJSON = handler.result.value as? [[String: Any]] else {
                completion([])
                return
            }
            
            let instructions = parseInstructions(instructionData: responseJSON)
            print("RECIPIES INSTRUCTION WHEN PARSING: " + String(instructions.count))
            completion(instructions)
            //print(responseJSON)
        }
    }
    
    class func parseInstructions(instructionData: [[String: Any]]) -> [Instruction]{
        var instructions = [Instruction]()
        
        for data in instructionData {
            instructions.append(Instruction(data: data))
        }
        
        return instructions
        
    }
}
