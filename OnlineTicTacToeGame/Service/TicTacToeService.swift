//
//  RegistrationService.swift
//  OnlineTicTacToeGame
//
//  Created by Hamit Seyrek on 23.03.2022.
//

import Foundation
import Combine
import FirebaseFirestoreSwift
import Firebase

enum TicTactoeKeys: String {
    case id
    case playerOneID
    case playerTwoID
    case blockMoveForPlayerID
    case winnerID
    case rematchPlayerID
    case moves
}

protocol TicTactoeService {
    //func register(with details: RegistrationDetails) -> AnyPublisher<Void, Error>
    func createOnlineGame()
    func updateOnlineGame(_ game: GameModel)
    func startGame(with userID: String)
    func listenForGameChanges()
    func createNewGame(with userID: String)
    func quiteTheGame()
}

final class TicTactoeServiceImp: ObservableObject, TicTactoeService {
    
    
    static let shared = TicTactoeServiceImp()
    @Published var game: GameModel!
    
    init() { }
    
    func createOnlineGame() {
        do {
            try FirebaseReference(.Game).document(self.game.id.uuidString).setData(from: self.game)
        } catch {
            print("Error in creating online game")
        }
    }
    
    func updateOnlineGame(_ game: GameModel) {
        do {
            try FirebaseReference(.Game).document(game.id.uuidString).setData(from: game)
        } catch {
            print("Error in creating online game: ", error.localizedDescription)
        }
    }
    
    func startGame(with userID: String) {
        // check if there is a game to join, if no, create a game. If yes , we will join and start listening for any changes in the game
        FirebaseReference(.Game).whereField("playerTwoID", isEqualTo: "").whereField("playerOneID", isNotEqualTo: userID).getDocuments { querySnapshot, error in
            
            if error != nil {
                print("Error is here:", error?.localizedDescription ?? "")
                // create new game
                self.createNewGame(with: userID)
                return
            }
            
            if let gameData = querySnapshot?.documents.first {
                self.game = try? gameData.data(as: GameModel.self)
                self.game.playerTwoID = userID
                self.game.blockMoveForPlayerID = userID
                
                self.updateOnlineGame(self.game)
                self.listenForGameChanges()
            } else {
                self.createNewGame(with: userID)
            }
        }
    }
    
    func listenForGameChanges() {
        FirebaseReference(.Game).document(self.game.id.uuidString).addSnapshotListener { documentSnapshot, error in
            if error != nil {
                print("Error is here 33: ", error?.localizedDescription ?? "")
                return
            }
            
            if let snapshot = documentSnapshot {
                self.game = try? snapshot.data(as: GameModel.self)
            }
            return
        }
    }
    
    func createNewGame(with userID: String) {
        // create new game object
        print("creating game for userid:", userID)
        
        self.game = GameModel(id: UUID(), playerOneID: userID, playerTwoID: "", blockMoveForPlayerID: userID, winnerID: "", rematchPlayerID: [], moves: Array(repeating: nil, count: 9))
        self.createOnlineGame()
        self.listenForGameChanges()
    }
    
    func quiteTheGame() {
        guard game != nil else { return }
        FirebaseReference(.Game).document(self.game.id.uuidString).delete()
    }
}

