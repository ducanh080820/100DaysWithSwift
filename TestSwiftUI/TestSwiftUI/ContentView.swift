//
//  ContentView.swift
//  TestSwiftUI
//
//  Created by DSCO on 6/27/19.
//  Copyright © 2019 DSCO. All rights reserved.
//

import SwiftUI

struct ContentView : View {
    var body: some View {
        Image("face")
            .clipShape(Circle())
            .overlay(
                Circle().stroke(Color.white, lineWidth: 4))
            .shadow(radius: 10)
    }
}

#if DEBUG
struct ContentView_Previews : PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
#endif
