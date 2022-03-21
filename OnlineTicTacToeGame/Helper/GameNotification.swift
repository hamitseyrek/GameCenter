//
//  Notification.swift
//  OnlineTicTacToeGame
//
//  Created by Hamit Seyrek on 21.03.2022.
//

import SwiftUI

enum GameState {
    case started
    case waitingForPlayer
    case finished
}

struct GameNotification {
    static let watingForPlayer = "Waiting for player"
    static let gameHasStarted = "Game has started"
    static let gameFinished = "Player left the game"
}
