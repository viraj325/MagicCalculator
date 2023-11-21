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
            CompoundInterestView()
                .tabItem {
                    Text("Compound Interest")
                        .foregroundColor(.green)
                }
                .tag(0)
            
            PaycheckCalculatorView()
                .tabItem {
                    Text("Paycheck Calculator")
                        .foregroundColor(.green)
                }
                .tag(1)
            
            OptionsCalculatorView()
                .tabItem {
                    Text("Options Profit")
                        .foregroundColor(.green)
                }
                .tag(2)
            
            DilutionCalculatorView()
                .tabItem {
                    Text("Dilution Equity")
                        .foregroundColor(.green)
                }
                .tag(3)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
