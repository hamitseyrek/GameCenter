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
    @EnvironmentObject var sessionService: SessionServiceImpl
    
    
    var body: some View {
        GeometryReader { geometry in
            VStack {
                if gameViewModel.game?.playerTwoID == "" {
                    Text(gameViewModel.gameNotification)
                }
                
                Button {
                    presentationMode.wrappedValue.dismiss()
                    gameViewModel.quiteTheGame()
                } label: {
                    GameButtonView(title: "Quit", backgroundColor: .red)
                }
                
                if gameViewModel.game?.playerTwoID == "" {
                    LoadingView()
                }
                
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
                .alert(item: $gameViewModel.alertItem) { alertItem in
                    alertItem.isForQuit ?
                    Alert(title: alertItem.title, message: alertItem.message, dismissButton: .destructive(alertItem.buttonText, action: {
                        self.presentationMode.wrappedValue.dismiss()
                        gameViewModel.quiteTheGame()
                    }))
                    : Alert(title: alertItem.title, message: alertItem.message, primaryButton: .default(alertItem.buttonText, action: {
                        //reset the game
                        gameViewModel.resetTheGame()
                    }), secondaryButton: .destructive(Text("Quit"), action: {
                        self.presentationMode.wrappedValue.dismiss()
                        gameViewModel.quiteTheGame()
                    }))
                }
            }
        }.onAppear {
            gameViewModel.getTheGame(userId: sessionService.userDetails?.id ?? "na")
        }
    }
}

struct GameView_Previews: PreviewProvider {
    static var previews: some View {
        GameView(gameViewModel: GameViewModel())
    }
}
