//
//  RecipeViewController.swift
//  Foodtruck
//
//  Created by Tom Bakker on 14/12/2016.
//  Copyright © 2016 bakker.co. All rights reserved.
//

import UIKit
import RealmSwift

class RecipeViewController: UIViewController {
    
    @IBOutlet weak var webView: UIWebView!
    var recipe: Recipe?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Testing if ingredient is being added to realm
        //addRecipeIngredients()
        downloadIngredientFile()
        //queryIngredients()
        
        if recipe != nil {
            
            let requestUrl = URL(string: (recipe?.url)!)
            let request = URLRequest(url: requestUrl!)
            webView.loadRequest(request)
        }
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    // This method should be placed at the recipe/ingredient view and must add all ingredients to the
    // Grocerylist at once.
    func addRecipeIngredients(){
        
        let url = NSURL(string: "http://www.puppyplaats.nl/images/giftigvoorhondenfotos/113134249.jpg")!
        if let imgData = NSData(contentsOf: url as URL) {
            
            let ingredient = IngredientList()
            ingredient.name = "prei"
            ingredient.amount = "200"
            ingredient.image = imgData
            
            let realm = try! Realm()
            
            try! realm.write {
                realm.add(ingredient)
                print("Added \(ingredient.name) to Realm")
            }
        }
    }
    
    func queryIngredients(){
        
        let realm = try! Realm()
        
        let ingredients = realm.objects(IngredientList.self)
        
        for ingredient in ingredients{
            print("Name: \(ingredient.name) Amount: \(ingredient.amount)")
        }
    }
    
    
    func downloadIngredientFile(){
        let requestURL: NSURL = NSURL(string: "https://api.myjson.com/bins/p1lez")!//"https://api.myjson.com/bins/8u6bv")!
        let urlRequest: NSMutableURLRequest = NSMutableURLRequest(url: requestURL as URL)
        let session = URLSession.shared
        let task = session.dataTask(with: urlRequest as URLRequest) {
            (data, response, error) -> Void in
            
            let httpResponse = response as! HTTPURLResponse
            let statusCode = httpResponse.statusCode
            
            if (statusCode == 200) {
                print("Ingredient file retrieved from URL")
                
                do{
                    
                    let json = try JSONSerialization.jsonObject(with: data!, options:.allowFragments) as! [String:AnyObject]
                    
                    if let ingredients = json["ingredients"] as? [[String: AnyObject]] {
                        
                        
                        //let showIngredient = Ingredient(value: ingredients)
                        
                        let realm = try! Realm()
                        
                        for ingredient in ingredients {
                            if let name = ingredient["name"] as? String {
                                
                                if let amount = ingredient["amount"] as? String {
                                    if let image = ingredient["image"] as? String {
                                        
                                        let url = NSURL(string: image)!
                                        if let imgData = NSData(contentsOf: url as URL) {
                                            
                                            let showIngredient = IngredientList()
                                            showIngredient.name = name
                                            showIngredient.amount = amount
                                            showIngredient.image = imgData
                                            
                                            
                                            try! realm.write {
                                                realm.add(showIngredient)
                                                //realm.create(IngredientList.self, value: ingredient, update: false)
                                                print("Name: \(showIngredient.name) Amount: \(showIngredient.amount) Image: \(showIngredient.image) to Realm")
                                            }
                                        }
                                        

                                    }
                                }
 
                            }
                        }
                        
                    }
                    
                }catch {
                    print("Error with Json: \(error)")
                }
            }
        }
        
        task.resume()
    }
}
