//
//  TabbarView.swift
//  GameCenter
//
//  Created by Hamit Seyrek on 2.04.2022.
//

import SwiftUI

struct TabbarView: View {
    
    @StateObject private var tabBarViewModel = TabBarViewModel()
    
    init() {
        UITabBar.appearance().backgroundColor = UIColor(named: "Secondary")
        UITabBar.appearance().unselectedItemTintColor = UIColor.gray
        UITabBar.appearance().isTranslucent = false
    }
    
    var body: some View {
        
        TabView (selection: $tabBarViewModel.selectedTab) {
            
            ForEach(tabBarViewModel.tabBarViewModels, id: \.self) { viewModel in
                
                tabViewBuilder(for: viewModel.type)
                    .tabItem {
                        Image(systemName: viewModel.imageName)
                        Text(viewModel.title)
                        if tabBarViewModel.selectedTab == .home {
                            Text("o")
                        }
                    }
                    .tag(viewModel.type)
            }
        }
        .padding(.bottom, -60)
        .accentColor(Color.white)
    }
    
    @ViewBuilder
    func tabViewBuilder(for tabItemType: TabItemType) -> some View {
        
        switch tabItemType {
        case .home:
            ContentView()
                .background(Color("Background").edgesIgnoringSafeArea(.all))
        case .blank1:
            Text("2")
        case .logout:
            Text("3")
        }
    }
}

struct TabbarView_Previews: PreviewProvider {
    static var previews: some View {
        TabbarView()
    }
}
