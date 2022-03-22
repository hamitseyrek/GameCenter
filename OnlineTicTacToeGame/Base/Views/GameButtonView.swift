//
//  GameButtonView.swift
//  OnlineTicTacToeGame
//
//  Created by Hamit Seyrek on 15.03.2022.
//

import SwiftUI

struct GameButtonView: View {
    
    var screen = UIScreen.main.bounds
    var title: String
    var backgroundColor: Color

    var body: some View {
        Text(title)
            .font(.title)
            .fontWeight(.bold)
            .frame(width: screen.width * 0.50, height: 50, alignment: .center)
            .background(backgroundColor)
            .foregroundColor(.white)
            .cornerRadius(10)
            .shadow(color: .black, radius: 4)
    }
}

struct GameButtonView_Previews: PreviewProvider {
    static var previews: some View {
        GameButtonView(title: "Play", backgroundColor: Color.green)
    }
}
