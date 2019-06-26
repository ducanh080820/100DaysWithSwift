//
//  Student.swift
//  SwiftUIDemo
//
//  Created by DSCO on 6/26/19.
//  Copyright © 2019 DSCO. All rights reserved.
//

import SwiftUI

struct Student: Identifiable {
    var id = UUID()
    var name: String
    var phone: String
}


#if DEBUG

let testStudents = [
    Student(name: "Tran Duc Anh", phone: "0353465284"),
    Student(name: "Tran Duc Anh", phone: "0353465284"),
    Student(name: "Tran Duc Anh", phone: "0353465284"),
    Student(name: "Tran Duc Anh", phone: "0353465284")
    
]

#endif
