//
//  MyTableViewCell.swift
//  SaveDate-Location-Photo
//
//  Created by DSCO on 6/25/19.
//  Copyright © 2019 DSCO. All rights reserved.
//

import UIKit

class MyTableViewCell: UITableViewCell {

    @IBOutlet weak var iconImageView: UIImageView!
    @IBOutlet weak var dateLable: UILabel!
    @IBOutlet weak var noteLable: UILabel!
    @IBOutlet weak var locationLable: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
