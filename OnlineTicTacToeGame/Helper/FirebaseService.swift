//
//  FirebaseService.swift
//  OnlineTicTacToeGame
//
//  Created by Hamit Seyrek on 19.03.2022.
//

import Foundation
import Firebase
import FirebaseFirestoreSwift
import Combine

final class FirebaseService:ObservableObject {
    static let shared = FirebaseService()
    @Published var game: GameModel!
    
    init() { }
    
    func createOnlineGame() {
        // save the game to online
    }
    
    func updateOnlineGame(_ game: GameModel) {
        
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
        
    }
    
    func createNewGame(with userID: String) {
        // create new game object
        
    }
    
    func quiteTheGame() {
        
    }
}
