//
//  Game.swift
//  GameCenter
//
//  Created by Hamit Seyrek on 29.03.2022.
//

import Foundation
import SwiftUI

struct Game {
    
    let image: String
    let title: String
    let description: String
    let gameView: AnyView
    
    static func example1() -> Game {
        Game(image: "MyProfile", title: "TicTacToe", description: "İki oyunculu online bir oyundur", gameView: AnyView(TicTacToeView()))
    }
    
    static func example2() -> Game {
        Game(image: "TicTacToe", title: "TicTacToe2", description: "İki oyunculu online bir oyundur", gameView: AnyView(TicTacToeView()))
    }
}
