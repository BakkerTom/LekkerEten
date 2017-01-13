//
//  InstructionTableViewCell.swift
//  Foodtruck
//
//  Created by Fhict on 11/12/16.
//  Copyright © 2016 bakker.co. All rights reserved.
//

import UIKit

class InstructionTableViewCell: UITableViewCell {

    @IBOutlet weak var txtInstructions: UITextView!
    @IBOutlet weak var lblStepID: UILabel!
    
    @IBOutlet weak var lblStep: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
