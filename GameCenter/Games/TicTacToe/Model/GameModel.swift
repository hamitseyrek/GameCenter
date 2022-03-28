//
//  GameModel.swift
//  GameCenter
//
//  Created by Hamit Seyrek on 17.03.2022.
//

import Foundation

struct GameModel: Codable, Identifiable {
    let id: UUID
    var playerOneID: String
    var playerTwoID: String
    var blockMoveForPlayerID: String
    var winnerID: String
    var rematchPlayerID: [String]
    var moves: [MoveModel?]
}
