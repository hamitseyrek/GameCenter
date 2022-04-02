//
//  GameSquareView.swift
//  GameCenter
//
//  Created by Hamit Seyrek on 16.03.2022.
//

import SwiftUI

struct GameSquareView: View {
    let proxy: GeometryProxy
    
    var body: some View {
        Circle()
            .foregroundColor(.blue.opacity(0.6))
            .frame(width: proxy.size.width / 3 - 15, height: proxy.size.width / 3 - 15, alignment: .center)
    }
}
