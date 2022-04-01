//
//  TabBar.swift
//  GameCenter
//
//  Created by Hamit Seyrek on 2.04.2022.
//

import SwiftUI

enum TabItemType {
    case home
    case blank1
    case logout
}

struct TabItem: Hashable {
    let imageName: String
    let title: String
    let type: TabItemType
}
