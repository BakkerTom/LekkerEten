//
//  CategoryTableViewController.swift
//  Foodtruck
//
//  Created by Tom Bakker on 09/12/2016.
//  Copyright © 2016 bakker.co. All rights reserved.
//

import UIKit
import Alamofire
import AlamofireImage

class CategoryTableViewController: UITableViewController {
    
    var categories = [Category]();

    override func viewDidLoad() {
        super.viewDidLoad()

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false
        
        WebService.retrieveCategories { (categories) -> (Void) in
            self.categories = categories
            self.tableView.reloadData()
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
        return categories.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "categoryCell", for: indexPath) as? CategoryTableViewCell

        
        // Configure the cell...
        let category = categories[indexPath.row]
        
        cell?.titleLabel.text = category.title
        let url = URL(string: "https:" + category.imageUrl!)
        cell?.backgroundImage.af_setImage(withURL: url!)

        return cell!
    }


    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
        
        if let controller = segue.destination as? RecipeTableViewController {
            controller.category = categories[(tableView.indexPathForSelectedRow?.row)!]
        }
    }
    
    override var preferredStatusBarStyle: UIStatusBarStyle {
        return .lightContent
    }


}
