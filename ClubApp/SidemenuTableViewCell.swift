//
//  SidemenuTableViewCell.swift
//  ClubApp
//
//  Created by intellye labs on 24/07/17.
//  Copyright © 2017 intellye labs. All rights reserved.
//

import UIKit

class SidemenuTableViewCell: UITableViewCell {

    @IBOutlet weak var lbl: UILabel!

    @IBOutlet weak var img: UIImageView!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
