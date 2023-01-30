//
//  ContentView.swift
//  Magic
//
//  Created by Viraj Patel on 12/4/22.
//

import SwiftUI

struct ContentView: View {
    @State private var selectedTab = "One"
    
    var body: some View {
        TabView(selection: $selectedTab) {
            Text("Compound Interest")
                .tabItem {
                    Text("Compound Interest")
                        .foregroundColor(.green)
                }
                .tag(0)
            
            Text("Options Profit")
                .tabItem {
                    Text("Options Profit")
                        .foregroundColor(.green)
                }
                .tag(1)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
