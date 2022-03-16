//
//  PlayerIndicatorView.swift
//  OnlineTicTacToeGame
//
//  Created by Hamit Seyrek on 16.03.2022.
//

import SwiftUI

struct PlayerIndicatorView: View {
    let proxy: GeometryProxy
    var systemImageName: String
    
    var body: some View {
        Image(systemName: systemImageName)
            .resizable()
            .frame(width: proxy.size.width / 9, height: proxy.size.width / 9, alignment: .center)
            .foregroundColor(.white)
            .opacity(systemImageName == "applelogo" ? 0 : 1)
    }
}

struct PlayerIndicatorView_Previews: PreviewProvider {
    static var previews: some View {
        GeometryReader { proxy in
            PlayerIndicatorView(proxy: proxy, systemImageName: "applelogo")
        }
    }
}
