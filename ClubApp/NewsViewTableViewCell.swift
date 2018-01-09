//
//  NewsViewTableViewCell.swift
//  ClubApp
//
//  Created by intellye labs on 09/08/17.
//  Copyright © 2017 intellye labs. All rights reserved.
//

import UIKit

class NewsViewTableViewCell: UITableViewCell {
    
  
    @IBOutlet weak var backView: UIView!
    @IBOutlet weak var delete: UIButton!
  

    @IBOutlet weak var edit: UIButton!
    @IBOutlet weak var tittle_text: UILabel!
    
    
    @IBOutlet weak var image_view: UIImageView!
    
    @IBOutlet weak var description_text: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
//        self.backView.layer.borderWidth = 8
//        self.backView.layer.cornerRadius = 5
//        self.backView.layer.masksToBounds = true
//        self.layer.shadowOpacity = 0.30
//        self.layer.shadowRadius = 4
//        self.layer.borderColor = UIColor.blue.cgColor
//        self.layer.masksToBounds = false  
    }

   
}
