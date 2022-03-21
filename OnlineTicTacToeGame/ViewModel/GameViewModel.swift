//
//  GameViewModel.swift
//  OnlineTicTacToeGame
//
//  Created by Hamit Seyrek on 17.03.2022.
//

import SwiftUI
import Combine

final class GameViewModel: ObservableObject {
    @AppStorage("user") private var userData: Data?
    
    let gridColumns: [GridItem] = [GridItem(.flexible(minimum: 10, maximum: 300)),GridItem(.flexible(minimum: 10, maximum: 300)),GridItem(.flexible(minimum: 10, maximum: 300))]
    
    @Published var game: GameModel? {
        didSet {
            checkIfGameIsOver()
            //check the game status
            if game == nil { updateGameNotificationFor(.finished) } else {
                game?.playerTwoID == "" ? updateGameNotificationFor(.waitingForPlayer) :
                updateGameNotificationFor(.started)
            }
        }
    }
    //GameModel(id: UUID(), playerOneID: "player1", playerTwoID: "player2", blockMoveForPlayerID: "player1", winnerID: "", rematchPlayerID: [], moves: Array(repeating: nil, count: 9))
    @Published var currentUser: UserModel!
    @Published var alertItem: AlertItem?
    @Published var gameNotification = GameNotification.watingForPlayer
    
    private var cancellable: Set<AnyCancellable> = []
    
    private let winPattern: Set<Set<Int>> = [[0,1,2], [3,4,5], [6,7,8], [0,3,6], [1,4,7], [2,5,8], [0,4,8], [2,4,6]]
    
    init() {
        retriveUser()
        
        if currentUser == nil {
            saveUser()
        }
    }
    
    func processPlayerOne(for position: Int) {
        guard var game = game else { return }
        
        if isSquareOccupied(in: game.moves, forIndex: position) { return }
        
        game.moves[position] = MoveModel(isPlayerOne: isPlayerOne(), boardIndex: position)
        game.blockMoveForPlayerID = currentUser.id
        
        FirebaseService.shared.updateOnlineGame(game)
        
        if checkForWinCondition(for: isPlayerOne(), in: game.moves) {
            game.winnerID = currentUser.id
            FirebaseService.shared.updateOnlineGame(game)
            print("winnerrrrr")
            return
        }
        
        if checkForDraw(in: game.moves) {
            game.winnerID =  "0"
            FirebaseService.shared.updateOnlineGame(game)
            print("draww")
            return
        }
    }
    
    func resetTheGame() {
        guard var game = game else {
            alertItem = AlertContext.quit
            return
        }
        
        if game.rematchPlayerID.count == 1 {
            // start new game
            game.moves = Array(repeating: nil, count: 9)
            game.winnerID = ""
            game.blockMoveForPlayerID = game.playerOneID
        } else if game.rematchPlayerID.count == 2 {
            game.rematchPlayerID = []
        }
        
        game.rematchPlayerID.append(currentUser.id)
        FirebaseService.shared.updateOnlineGame(game)
    }
    
    func updateGameNotificationFor(_ state: GameState) {
        switch state {
        case .started:
            gameNotification = GameNotification.gameHasStarted
        case .waitingForPlayer:
            gameNotification = GameNotification.watingForPlayer
        case .finished:
            gameNotification = GameNotification.gameFinished
        }
    }
    
    func checkIfGameIsOver() {
        alertItem = nil
        
        guard let game = game else { return }
        
        if game.winnerID == "0" {
            // draw
            alertItem = AlertContext.draw
        }else if game.winnerID != "" {
            if game.winnerID == currentUser.id {
                // we win
                alertItem = AlertContext.youWin
            } else {
                // we lost
                alertItem = AlertContext.youLost
            }
        }
    }
    
    func checkForGameBoardStatus() -> Bool {
        return game != nil ? game!.blockMoveForPlayerID == currentUser.id : false
    }
    
    func isPlayerOne() -> Bool {
        return game != nil ? game!.playerOneID == currentUser.id : false
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
    
    func getTheGame() {
        FirebaseService.shared.startGame(with: currentUser.id)
        FirebaseService.shared.$game
            .assign(to: \.game, on: self)
            .store(in: &cancellable)
    }
    
    func quiteTheGame() {
        FirebaseService.shared.quiteTheGame()
    }
}
