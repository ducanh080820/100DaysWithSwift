//
//  TableViewCell.swift
//  CollapsibleTableSection
//
//  Created by DSCO on 7/2/19.
//  Copyright © 2019 DSCO. All rights reserved.
//

import UIKit

class TableViewCell: UITableViewCell {

    @IBOutlet weak var unfoldButton: UIButton!
    @IBOutlet weak var brandLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
