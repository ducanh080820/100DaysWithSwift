//
//  TableViewCell.swift
//  EarthQuakeDecoder
//
//  Created by DSCO on 7/3/19.
//  Copyright © 2019 DSCO. All rights reserved.
//

import UIKit

class TableViewCell: UITableViewCell {

    @IBOutlet weak var labelMag: UILabel!
    @IBOutlet weak var labelFirstname: UILabel!
    @IBOutlet weak var labelLastName: UILabel!
    @IBOutlet weak var labelTimeString: UILabel!
    @IBOutlet weak var labelDateString: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        labelMag.layer.cornerRadius = labelMag.frame.width/4
        labelMag.layer.masksToBounds = true
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
