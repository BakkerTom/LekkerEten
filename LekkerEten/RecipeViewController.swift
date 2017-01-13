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
        addRecipeIngredients()
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
    
    
    func addRecipeIngredients(){
        
        let ingredient = RecipeIngredient()
        ingredient.name = "prei"
        ingredient.amount = 200
        ingredient.image = 0
        
        let realm = try! Realm()
        
        try! realm.write {
            realm.add(ingredient)
            print("Added \(ingredient.name) to Realm")
        }
    }
    
    func queryIngredients(){
        
        let realm = try! Realm()
        
        let ingredients = realm.objects(RecipeIngredient)
        
        for ingredient in ingredients{
            print("Name: \(ingredient.name) Amount: \(ingredient.amount)")
        }
    }
    
    /*
     // MARK: - Navigation
     
     // In a storyboard-based application, you will often want to do a little preparation before navigation
     override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
     // Get the new view controller using segue.destinationViewController.
     // Pass the selected object to the new view controller.
     }
     */
    
}
