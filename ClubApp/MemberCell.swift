//
//  MemberCell.swift
//  ClubApp
//
//  Created by intellye labs on 13/07/17.
//  Copyright © 2017 intellye labs. All rights reserved.
//

import UIKit

class MemberCell: UITableViewCell {

    @IBOutlet weak var call_button: UIImageView!
    @IBOutlet weak var name: UILabel!
    @IBOutlet weak var profileimage: UIImageView!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
