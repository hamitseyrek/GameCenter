//
//  AlertItem.swift
//  OnlineTicTacToeGame
//
//  Created by Hamit Seyrek on 20.03.2022.
//

import Foundation
import SwiftUI

struct AlertItem: Identifiable {
    let id = UUID()
    var isForQuit: Bool = false
    let title: Text
    let message: Text
    let buttonText: Text
}

struct AlertContext {
    static let youWin = AlertItem(title: Text("You Win!"), message: Text("You are good at this game!"), buttonText: Text("Rematch"))
    
    static let youLost = AlertItem(title: Text("You Lost!"), message: Text("Try rematch!"), buttonText: Text("Rematch"))
    
    static let draw = AlertItem(title: Text("Draw"), message: Text("That was a cool game!"), buttonText: Text("Rematch"))
    
    static let quit = AlertItem(isForQuit: true, title: Text("GameOver"), message: Text("Other player left!!!"), buttonText: Text("Quit"))
}
