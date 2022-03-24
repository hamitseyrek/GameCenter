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
    
    @StateObject var sessionService = SessionServiceImpl()
    
    init() {
        FirebaseApp.configure()
    }
    
    var body: some Scene {
        WindowGroup {
            NavigationView {
                switch sessionService.state {
                case .loggedIn:
                    HomeView().environmentObject(sessionService)
                case .loggedOut:
                    LoginView()
                }
            }
        }
    }
}
