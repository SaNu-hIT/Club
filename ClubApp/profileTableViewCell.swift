//
//  profileTableViewCell.swift
//  ClubApp
//
//  Created by Najid pasha on 29/07/17.
//  Copyright © 2017 intellye labs. All rights reserved.
//

import UIKit

class profileTableViewCell: UITableViewCell {

    @IBOutlet weak var proflbl1: UILabel!
    
    @IBOutlet weak var conview1: UIView!
    
    @IBOutlet weak var phonenumber: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}


class profileTableViewCell1: UITableViewCell {
    
    @IBOutlet weak var conview2: UIView!
    
    @IBOutlet weak var phone: UILabel!
    @IBOutlet weak var dateofbirth: UILabel!
    
    @IBOutlet weak var relation: UILabel!
    @IBOutlet weak var name: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
        // Configure the view for the selected state
    }
    
}



class profileTableViewCell2: UITableViewCell {
    
    @IBOutlet weak var conview3: UIView!
    
    
    @IBOutlet weak var profilrsec_3: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
        // Configure the view for the selected state
    }
    
}

