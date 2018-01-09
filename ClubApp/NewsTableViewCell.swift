//
//  NewsTableViewCell.swift
//  ClubApp
//
//  Created by intellye labs on 09/08/17.
//  Copyright © 2017 intellye labs. All rights reserved.
//

import UIKit

class NewsTableViewCell: UITableViewCell {
    
    @IBOutlet weak var backView: UIStackView!
//    @IBOutlet weak var backView: UIView!
    @IBOutlet weak var image_view: UIImageView!
    @IBOutlet weak var description_text: UILabel!
    @IBOutlet weak var title: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        
//        backgroundColor = Color
        
//        self.backView.layer.borderWidth = 8
//        self.backView.layer.cornerRadius = 5
//////        self.backView.layer.borderColor = Colors.colorClear.cgColor
//        self.backView.layer.masksToBounds = true
//     
//        self.layer.shadowOpacity = 0.30
//        self.layer.shadowOffset = CGSize(width: 4, height: 4)
//        self.layer.shadowRadius = 4
//
//        self.layer.masksToBounds = false
        // Initialization code
        
        
        
        
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
        // Configure the view for the selected state
    }
    
}
