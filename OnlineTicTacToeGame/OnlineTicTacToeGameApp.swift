//
//  OnlineTicTacToeGameApp.swift
//  OnlineTicTacToeGame
//
//  Created by Hamit Seyrek on 14.03.2022.
//

import SwiftUI
import Firebase

@main
struct OnlineTicTacToeGameApp: App {
    
    init() {
        FirebaseApp.configure()
    }
    
    var body: some Scene {
        WindowGroup {
            HomeView()
        }
    }
}
