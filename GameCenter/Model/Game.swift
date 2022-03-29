//
//  Game.swift
//  GameCenter
//
//  Created by Hamit Seyrek on 29.03.2022.
//

import Foundation

struct Game {
    
    let image: String
    let title: String
    let description: String
    
    static func example1() -> Game {
        Game(image: "TicTacToe", title: "TicTacToe", description: "İki oyunculu online bir oyundur")
    }
    
    static func example2() -> Game {
        Game(image: "TicTacToe", title: "TicTacToe2", description: "İki oyunculu online bir oyundur")
    }
}
