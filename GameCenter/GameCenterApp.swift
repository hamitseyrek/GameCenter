//
//  GameCenterApp.swift
//  GameCenter
//
//  Created by Hamit Seyrek on 14.03.2022.
//

import SwiftUI
import Firebase

@main
struct GameCenterApp: App {
    
    @StateObject var sessionService = SessionServiceImpl()
    
    init() {
        FirebaseApp.configure()
    }
    
    var body: some Scene {
        WindowGroup {
            //NavigationView {
                switch sessionService.state {
                case .loggedIn:
                    TabBarView().environmentObject(sessionService)
                case .loggedOut:
                    LoginView()
                }
            //}
            // // this fixed navigationTitle constraints error in terminal
            //.navigationViewStyle(StackNavigationViewStyle())
        }
    }
}
