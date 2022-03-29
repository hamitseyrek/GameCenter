//
//  CardView.swift
//  GameCenter
//
//  Created by Hamit Seyrek on 29.03.2022.
//

import SwiftUI

struct CardView: View {
    
    let game: Game
    
    var body: some View {
        
        VStack (alignment: .leading, spacing: 10) {
            
            Image(game.image)
                .resizable()
                .frame(maxWidth: UIScreen.main.bounds.width - 50, maxHeight: UIScreen.main.bounds.height / 4)
                .scaledToFill()
            
            Text(game.title)
                .modifier(Header3())
                .padding(.horizontal)
            
            Text(game.description)
                .modifier(BodyStyle())
                .padding([.horizontal, .bottom])
        }
        .background(Color("BackgroundField"))
        //.frame(maxWidth: UIScreen.main.bounds.width - 0)
        .cornerRadius(50)
    }
}

struct CardView_Previews: PreviewProvider {
    static var previews: some View {
        CardView(game: Game.example1())
    }
}
