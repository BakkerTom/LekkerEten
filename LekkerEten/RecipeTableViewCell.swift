//
//  RecipeTableViewCell.swift
//  Foodtruck
//
//  Created by Fhict on 09/12/16.
//  Copyright © 2016 bakker.co. All rights reserved.
//

import UIKit

class RecipeTableViewCell: UITableViewCell {

    @IBOutlet weak var lblTitle: UILabel!
    //@IBOutlet weak var lblDescription: UILabel!
    //@IBOutlet weak var lblInstructions: UILabel!
    @IBOutlet weak var imgRecipe: UIImageView!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
