//
//  Line.swift
//  DrawingBoard
//
//  Created by DSCO on 6/27/19.
//  Copyright © 2019 DSCO. All rights reserved.
//

import UIKit

class Line {
    
    var startPoint: CGPoint
    var endPoint: CGPoint
    
    init(start: CGPoint, end: CGPoint) {
        
        self.startPoint = start
        self.endPoint = end
        
    }
}
