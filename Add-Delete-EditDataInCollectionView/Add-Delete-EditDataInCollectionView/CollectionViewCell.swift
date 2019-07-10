//
//  CollectionViewCell.swift
//  Add-Delete-EditDataInCollectionView
//
//  Created by DSCO on 7/10/19.
//  Copyright © 2019 DSCO. All rights reserved.
//

import UIKit

class CollectionViewCell: UICollectionViewCell {
    
    @IBOutlet weak var mylabel: UILabel!
    @IBOutlet weak var myImage: UIImageView!
    
    var isEditting = false {
        didSet {
            myImage.isHidden = !isEditting
        }
    }
    
    override var isSelected: Bool {
        didSet {
            myImage.image = isSelected ? UIImage(named: "true") : UIImage(named: "false")
        }
    }
    
}
