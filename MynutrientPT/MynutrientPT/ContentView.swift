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
            CalendarView()
                .tabItem {
                    Image(systemName: "3.circle")
                    Text("3")
                }
            MyPageView()
                .tabItem {
                    Image(systemName: "4.circle")
                    Text("4")
                }
        }
        //.font(.largeTitle)
    }
}

#Preview {
    ContentView()
}
