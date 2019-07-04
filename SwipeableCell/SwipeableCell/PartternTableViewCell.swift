//
//  PartternTableViewCell.swift
//  SwipeableCell
//
//  Created by DSCO on 7/4/19.
//  Copyright © 2019 DSCO. All rights reserved.
//

import UIKit

struct pattern {
    let image: String
    let name: String
}

class PartternTableViewCell: UITableViewCell {
    
    @IBOutlet weak var patternNameLabel: UILabel!
    @IBOutlet weak var patternImageView: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
        // Configure the view for the selected state
    }
    
}

