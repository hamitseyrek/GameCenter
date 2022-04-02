//
//  TabbarView.swift
//  GameCenter
//
//  Created by Hamit Seyrek on 2.04.2022.
//

import SwiftUI

struct TabBarView: View {
    
    @StateObject private var tabBarViewModel = TabBarViewModel()
    @EnvironmentObject var sessionService: SessionServiceImpl
    
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
                        if self.tabBarViewModel.selectedTab == viewModel.type {
                            Text("o")
                        }
                    }
                    .tag(viewModel.type)
            }
        }
        .padding(.bottom, -50)
        .accentColor(Color.white)
    }
    
    @ViewBuilder
    func tabViewBuilder(for tabItemType: TabItemType) -> some View {
        
        switch tabItemType {
        case .home:
            HomeView()
                .environmentObject(sessionService)
                .background(Color("Background").edgesIgnoringSafeArea(.all))
        case .activity:
            Text("2")
                .background(Color("Background").edgesIgnoringSafeArea(.all))
        case .profile:
            ProfileView()
                .environmentObject(sessionService)
                .background(Color("Background").edgesIgnoringSafeArea(.all))
        }
    }
}

struct TabbarView_Previews: PreviewProvider {
    static var previews: some View {
        TabBarView()
    }
}
