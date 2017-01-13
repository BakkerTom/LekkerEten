//
//  RecipeTableViewController.swift
//  Foodtruck
//
//  Created by Fhict on 09/12/16.
//  Copyright © 2016 bakker.co. All rights reserved.
//

import UIKit
import Alamofire
import AlamofireImage

class RecipeTableViewController: UITableViewController {

    var category: Category?
    var recipes = [Recipe]()
    
    @IBOutlet weak var descriptionLabel: UILabel!
    
    @IBOutlet weak var categoryImageView: UIImageView!
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false
        
        if category != nil {
            self.title = category?.title
            self.descriptionLabel.text = category?.description
            let url = URL(string: "https:" + (category?.imageUrl)!)
            self.categoryImageView.af_setImage(withURL: url!)
            
            WebService.retrieveRecipes(id: (self.category?.id)!, completion: { (results) -> (Void) in
                self.recipes = results
                self.tableView.reloadData()
            })
        }

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem()
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
        return recipes.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "recipeCell", for: indexPath) as?
            RecipeTableViewCell

        // Configure the cell...
        let recipe = recipes[indexPath.row]
        
        cell?.lblTitle.text = recipe.title
        //cell?.lblDescription.text = recipe.description
        //cell?.lblInstructions.text = recipe.description
        //let url = URL(string: "https:" + recipe.imageUrl!)
        let url = URL(string: "http:" + recipe.imageUrl!)
        cell?.imgRecipe.af_setImage(withURL: url!)
        
        
        return cell!
    }
    
    override var preferredStatusBarStyle: UIStatusBarStyle {
        return .lightContent
    }
    

    /*
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */


    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
        
        if let controller = segue.destination as? RecipeViewController {
            controller.recipe = recipes[(tableView.indexPathForSelectedRow?.row)!]
        }
    }


}
