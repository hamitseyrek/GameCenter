//
//  GameView.swift
//  OnlineTicTacToeGame
//
//  Created by Hamit Seyrek on 15.03.2022.
//

import SwiftUI

struct GameView: View {
    
    @ObservedObject var gameViewModel: GameViewModel
    @Environment(\.presentationMode) var presentationMode
    
    var body: some View {
        GeometryReader { geometry in
            VStack {
                Text("Waiting forthe player")
                
                Button {
                    presentationMode.wrappedValue.dismiss()
                    gameViewModel.quiteTheGame()
                } label: {
                    GameButtonView(title: "Quit", backgroundColor: .red)
                }
                
                LoadingView()
                
                Spacer()
                
                VStack {
                    LazyVGrid(columns: gameViewModel.gridColumns) {
                        ForEach (0..<9) { i in
                            ZStack {
                                GameSquareView(proxy: geometry)
                                PlayerIndicatorView(proxy: geometry, systemImageName: gameViewModel.game?.moves[i]?.indicator ?? "applelogo")
                            }
                            .onTapGesture {
                                gameViewModel.processPlayerOne(for: i)
                            }
                        }
                    }
                }
                .disabled(gameViewModel.checkForGameBoardStatus())
                .padding()
            }
        }.onAppear {
            gameViewModel.getTheGame()
        }
    }
}

struct GameView_Previews: PreviewProvider {
    static var previews: some View {
        GameView(gameViewModel: GameViewModel())
    }
}
