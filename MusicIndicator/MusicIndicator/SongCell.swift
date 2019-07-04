//
//  SongCell.swift
//  MusicIndicator
//
//  Created by DSCO on 7/4/19.
//  Copyright © 2019 DSCO. All rights reserved.
//

import UIKit

struct Song {
    
    let name: String
    let artist: String
    init(name: String, artist: String) {
        self.name = name
        self.artist = artist
    }
}

class SongCell: UITableViewCell {
    
    @IBOutlet weak var namaeLabel: UILabel!
    @IBOutlet weak var artistLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
    }
    
}

