//
//  EventDetailsTableViewCell.swift
//  ClubApp
//
//  Created by intellye labs on 27/07/17.
//  Copyright © 2017 intellye labs. All rights reserved.
//

import UIKit

class EventDetailsTableViewCell: UITableViewCell {
    @IBOutlet weak var event_description: UILabel!

    @IBOutlet weak var images: UIImageView!
 
    @IBOutlet weak var event_tittle: UILabel!

    @IBOutlet weak var backView: UIView!
    override func awakeFromNib() {
        super.awakeFromNib()

        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
