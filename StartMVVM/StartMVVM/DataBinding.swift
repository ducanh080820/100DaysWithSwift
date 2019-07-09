//
//  DataBinding.swift
//  StartMVVM
//
//  Created by DSCO on 7/9/19.
//  Copyright © 2019 DSCO. All rights reserved.
//

import Foundation

class DataBinding<T> {
    
    typealias Handler = (T) -> Void
    private var handler: Handler?
    var value: T {
        didSet {
            self.handler?(value)
        }
    }
    
    init(value: T) {
        self.value = value
    }
    
    func bind(hdl: @escaping Handler) {
        self.handler = hdl
        handler?(value)
    }
    
}
