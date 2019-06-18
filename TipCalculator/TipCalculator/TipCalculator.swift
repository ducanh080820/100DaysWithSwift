//
//  TipCalculator.swift
//  TipCalculator
//
//  Created by Tranducanh on 6/18/19.
//  Copyright © 2019 Tranducanh. All rights reserved.
//

import Foundation

class TipCalculator {
    func calculateTip(amount: Float, tip: Float) -> Float {
        return amount * tip
    }
    
    func calculateTotal(amount: Float, tip: Float) -> Float {
        return amount * (1 + tip)
    }
}
