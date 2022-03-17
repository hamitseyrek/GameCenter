//
//  GameViewModel.swift
//  OnlineTicTacToeGame
//
//  Created by Hamit Seyrek on 17.03.2022.
//

import SwiftUI

final class GameViewModel: ObservableObject {
    let gridColumns: [GridItem] = [GridItem(.flexible(minimum: 10, maximum: 300)),GridItem(.flexible(minimum: 10, maximum: 300)),GridItem(.flexible(minimum: 10, maximum: 300))]
    
    @Published var game = GameModel(id: UUID(), playerOneID: "player1", playerTwoID: "player2", blockMoveForPlayerID: "player2", winnerID: "", rematchPlayerID: [], moves: Array(repeating: nil, count: 9))
    
    func processPlayerOne(for position: Int) {
        if isSquareOccupied(in: game.moves, forIndex: position) { return }
        
        game.moves[position] = MoveModel(isPlayerOne: true, boardIndex: position)
    }
    
    func isSquareOccupied(in moves: [MoveModel?], forIndex index: Int) -> Bool {
        moves.contains { moveModel in
            moveModel?.boardIndex == index
        }
    }
}
