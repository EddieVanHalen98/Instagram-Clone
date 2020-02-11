//
//  ContentView.swift
//  instagram
//
//  Created by James Saeed on 02/01/2020.
//  Copyright © 2020 James Saeed. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    
    @State var isLoggedIn = false
    
    var body: some View {
        Group {
            if isLoggedIn {
                AppView()
            } else {
                LoginView(isLoggedIn: $isLoggedIn)
            }
        }.onAppear {
            self.isLoggedIn = APIGateway.shared.loggedIn
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
