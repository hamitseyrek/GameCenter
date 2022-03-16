//
//  GameView.swift
//  OnlineTicTacToeGame
//
//  Created by Hamit Seyrek on 15.03.2022.
//

import SwiftUI

struct GameView: View {
    let gridColumns: [GridItem] = [GridItem(.flexible(minimum: 10, maximum: 300)),GridItem(.flexible(minimum: 10, maximum: 300)),GridItem(.flexible(minimum: 10, maximum: 300))]
    
    var body: some View {
        GeometryReader { geometry in
            VStack {
                Text("Waiting forthe player")
                
                Button {
                    
                } label: {
                    GameButtonView(title: "Quit", backgroundColor: .red)
                }
                
                Text("Loading View")
                
                Spacer()
                
                VStack {
                    LazyVGrid(columns: gridColumns) {
                        ForEach (0..<9) { i in
                            ZStack {
                                Circle()
                                    .foregroundColor(.blue.opacity(0.6))
                                    .frame(width: geometry.size.width / 3 - 15, height: geometry.size.width / 3 - 15, alignment: .center)
                                
                                Image(systemName: "applelogo")
                                    .resizable()
                                    .frame(width: geometry.size.width / 9, height: geometry.size.width / 9, alignment: .center)
                                    .foregroundColor(.white)
                                    
                            }
                        }
                    }
                }
                
            }
        }
    }
}

struct GameView_Previews: PreviewProvider {
    static var previews: some View {
        GameView()
    }
}
