//
//  TabBarViewModel.swift
//  GameCenter
//
//  Created by Hamit Seyrek on 2.04.2022.
//

import Foundation

final class TabBarViewModel: ObservableObject {
    
    @Published var selectedTab: TabItemType = .home
    
    let tabBarViewModels = [
        TabItem(imageName: "house", title: "Home", type: .home),
        .init(imageName: "list.bullet", title: "Activity", type: .activity),
        .init(imageName: "person", title: "Profile", type: .profile),
    ]
}
