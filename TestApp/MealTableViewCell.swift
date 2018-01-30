//
//  MealTableViewCell.swift
//  TestApp
//
//  Created by Kasai, Sohei on 2018/01/28.
//  Copyright © 2018年 Kasai, Sohei. All rights reserved.
//

import UIKit

class MealTableViewCell: UITableViewCell {

    //MARK: properties
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var photoImageView: UIImageView!
    @IBOutlet weak var ratingController: RatingController!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
