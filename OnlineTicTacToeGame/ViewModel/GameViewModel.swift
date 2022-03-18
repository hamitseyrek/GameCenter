//
//  GameViewModel.swift
//  OnlineTicTacToeGame
//
//  Created by Hamit Seyrek on 17.03.2022.
//

import SwiftUI

final class GameViewModel: ObservableObject {
    @AppStorage("user") private var userData: Data?
    
    let gridColumns: [GridItem] = [GridItem(.flexible(minimum: 10, maximum: 300)),GridItem(.flexible(minimum: 10, maximum: 300)),GridItem(.flexible(minimum: 10, maximum: 300))]
    
    @Published var game = GameModel(id: UUID(), playerOneID: "player1", playerTwoID: "player2", blockMoveForPlayerID: "player1", winnerID: "", rematchPlayerID: [], moves: Array(repeating: nil, count: 9))
    
    @Published var currentUser: UserModel!
    
    private let winPattern: Set<Set<Int>> = [[0,1,2], [3,4,5], [6,7,8], [0,3,6], [1,4,7], [2,5,8], [0,4,8], [2,4,6]]
    
    init() {
        retriveUser()
        
        if currentUser == nil {
            saveUser()
        }
    }
    
    func processPlayerOne(for position: Int) {
        if isSquareOccupied(in: game.moves, forIndex: position) { return }
        
        game.moves[position] = MoveModel(isPlayerOne: true, boardIndex: position)
        
        game.blockMoveForPlayerID = "player2"
        
        if checkForWinCondition(for: true, in: game.moves) {
            print("winnerrrrr")
            return
        }
        
        if checkForDraw(in: game.moves) {
            print("draww")
            return
        }
    }
    
    func isSquareOccupied(in moves: [MoveModel?], forIndex index: Int) -> Bool {
        moves.contains { elem in
            elem?.boardIndex == index
        }
    }
    
    func checkForWinCondition(for player1: Bool, in moves: [MoveModel?]) -> Bool {
        let playerMoves = moves.compactMap { $0 }.filter { $0.isPlayerOne == player1 }
        let playerPositions = Set(playerMoves.map { $0.boardIndex })
        
        for pattern in winPattern where pattern.isSubset(of: playerPositions) { return true }
        
        return false
    }
    
    func checkForDraw(in moves: [MoveModel?]) -> Bool {
        return moves.compactMap { $0 }.count == 9
    }
    
    //MARK: - User Object
    func saveUser() {
        currentUser = UserModel()
        
        do {
            print("encoding user")
            userData = try JSONEncoder().encode(currentUser)
        } catch {
            print("couldnt same user object")
        }
    }
    
    func retriveUser() {
        guard let userData = userData else { return }
        
        do {
            print("decoding user")
            currentUser = try JSONDecoder().decode(UserModel.self, from: userData)
        } catch {
            print("no user data")
        }
    }
}
