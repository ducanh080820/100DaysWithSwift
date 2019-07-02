//
//  CarCell.swift
//  CategorySearchTableView
//
//  Created by DSCO on 7/2/19.
//  Copyright © 2019 DSCO. All rights reserved.
//

import UIKit

struct Car {
    
    let country: String
    let brand: String
    
    init(country: String, brand: String) {
        self.country = country
        self.brand = brand
    }
}

class CarCell: UITableViewCell {
    
    @IBOutlet weak var brandLabel: UILabel!
    @IBOutlet weak var countryLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
    }
    
}
