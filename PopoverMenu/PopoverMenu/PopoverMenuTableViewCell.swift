//
//  PopoverMenuTableViewCell.swift
//  PopoverMenu
//
//  Created by DSCO on 6/28/19.
//  Copyright © 2019 DSCO. All rights reserved.
//

import UIKit

struct MenuItem {
    
    var picture: String!
    var name: String!
    
}

class PopoverMenuTableViewCell: UITableViewCell {
    
    @IBOutlet weak var menuImage: UIImageView!
    @IBOutlet weak var menuName: UIButton!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
        // Configure the view for the selected state
    }
    
}
