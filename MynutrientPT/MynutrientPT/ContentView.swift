//
//  ContentView.swift
//  MynutrientPT
//
//  Created by 박준영 on 9/12/24.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        TabView {
            HomeView()
                .tabItem {
                    Image(systemName: "1.circle")
                    Text("1")
                }
            CartView()
                .tabItem {
                    Image(systemName: "2.circle")
                    Text("2")
                }
            Text("3")
                .tabItem {
                    Image(systemName: "3.circle")
                    Text("3")
                }
        }
        .font(.largeTitle)
    }
}

#Preview {
    ContentView()
}
