//
//  ContentView.swift
//  SwiftUIDemo
//
//  Created by DSCO on 6/26/19.
//  Copyright © 2019 DSCO. All rights reserved.
//

import SwiftUI

struct ContentView : View {
    
    
    var body: some View {

        Text("Hello World")
        .font(.title)
        .color(.red)
    }
}

#if DEBUG
struct ContentView_Previews : PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
#endif
