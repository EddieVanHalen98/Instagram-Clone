//
//  ContentView.swift
//  instagram
//
//  Created by James Saeed on 02/01/2020.
//  Copyright © 2020 James Saeed. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    
    var body: some View {
        TabView {
            FeedView()
            .tabItem {
                Image(systemName: "square.stack.3d.up")
                Text("Feed")
            }
            
            Text("Search")
            .tabItem {
                Image(systemName: "magnifyingglass")
                Text("Search")
            }
            
            Text("Notifications")
            .tabItem {
                Image(systemName: "bell")
                Text("Notifications")
            }
            
            Text("Profile")
            .tabItem {
                Image(systemName: "person")
                Text("Profile")
            }
        }.accentColor(Color("accent"))
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
