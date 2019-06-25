//
//  Protocol.swift
//  SaveDate-Location-Photo
//
//  Created by DSCO on 6/25/19.
//  Copyright © 2019 DSCO. All rights reserved.
//

import Foundation


//协议，定义代理要实现的方法
protocol ModeViewControlDelegate: NSObjectProtocol {
    func changeData(user: [String: String])
}
