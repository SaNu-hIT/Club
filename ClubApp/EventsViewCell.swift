//
//  EventsViewCell.swift
//  ClubApp
//
//  Created by intellye labs on 25/07/17.
//  Copyright © 2017 intellye labs. All rights reserved.
//

import UIKit

class EventsViewCell: UITableViewCell {
    @IBOutlet weak var weak_text: UILabel!
    @IBOutlet weak var date_text: UILabel!
    @IBOutlet weak var heading: UILabel!
    

    @IBOutlet weak var backView: UIView!
    @IBOutlet weak var event_image: UIImageView!
    @IBOutlet weak var event_description: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
//                self.backView.layer.borderWidth = 3
//        self.backView.layer.cornerRadius = 3
//        //        self.backView.layer.borderColor = Colors.colorClear.cgColor
//        //        self.backView.layer.masksToBounds = true
//        //
//        self.layer.shadowOpacity = 0.10
//                self.layer.shadowOffset = CGSize(width: 0, height: 4)
//        self.layer.shadowRadius = 4
//        //
//        self.layer.masksToBounds = false
        // Initialization code
    }

    @IBOutlet weak var cell_view: UIView!
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
