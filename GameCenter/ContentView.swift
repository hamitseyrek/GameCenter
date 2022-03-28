//
//  ContentView.swift
//  GameCenter
//
//  Created by Hamit Seyrek on 29.03.2022.
//

import SwiftUI

struct ContentView: View {
    
    //@StateObject var sessionService = SessionServiceImpl()
    @State private var selectionTab: Int = 1
    
    init() {
        
        UITabBar.appearance().backgroundColor = UIColor(named: "Secondary")
        UITabBar.appearance().unselectedItemTintColor = UIColor.white
        UITabBar.appearance().isTranslucent = false
    }
    
    var body: some View {
        
        TabView(selection: $selectionTab) {
            
            //HomeView().environmentObject(sessionService)
            Text("Home")
                .tag(1)
                .tabItem {
                    Image(systemName: "house")
                    if selectionTab == 1 {
                        Text("o")
                    }
                }
            
            Text("Heart")
                .tag(2)
                .tabItem {
                    Image(systemName: "heart")
                    if selectionTab == 2 {
                        Text("o")
                    }
                }
            
            Text("Cubic")
                .tag(3)
                .tabItem {
                    Image(systemName: "cube")
                    if selectionTab == 3 {
                        Text("o")
                    }
                }
            
            Text("Person")
                .tag(4)
                .tabItem {
                    Image(systemName: "person")
                    if selectionTab == 4 {
                        Text("o")
                    }
                }
        }
        .accentColor(Color.white)
    }
}



struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
