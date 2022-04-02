//
//  TabBar.swift
//  GameCenter
//
//  Created by Hamit Seyrek on 2.04.2022.
//

import SwiftUI

enum TabItemType {
    case home
    case activity
    case profile
}

struct TabItem: Hashable {
    let imageName: String
    let title: String
    let type: TabItemType
}
