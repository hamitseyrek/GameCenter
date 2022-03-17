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
                
                LoadingView()
                
                Spacer()
                
                VStack {
                    LazyVGrid(columns: gridColumns) {
                        ForEach (0..<9) { i in
                            ZStack {
                                GameSquareView(proxy: geometry)
                                PlayerIndicatorView(proxy: geometry, systemImageName: "applelogo")
                            }
                            .onTapGesture {
                                print("tapppp!!! \(i)")
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
