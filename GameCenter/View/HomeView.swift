//
//  ContentView.swift
//  GameCenter
//
//  Created by Hamit Seyrek on 14.03.2022.
//

import SwiftUI
import FirebaseFirestoreSwift
import Firebase

struct HomeView: View {
    
    @StateObject var homeViewModel = HomeViewModel()
    @EnvironmentObject var sessionService: SessionServiceImpl
    
    var body: some View {
        
        VStack(alignment: .leading, spacing: 16) {
            
            VStack(alignment: .leading, spacing: 16) {
                
                Text("Name: \(sessionService.userDetails?.firstName ?? "N/A")")
                Text("Surname:  \(sessionService.userDetails?.lastName ?? "N/A")")
                Text("Occupation:  \(sessionService.userDetails?.occupation ?? "N/A")")
            }
            
            ButtonComponentView(title: "Play",
                                background: .green,
                                foreground: .white,
                                border: .clear) {
                homeViewModel.isGameviewPresented = true
            }
            
            ButtonComponentView(title: "Logout") {
                sessionService.logout()
            }
            
            Text("Winner Value:  \(sessionService.winnerOfUser)")
        }
        .fullScreenCover(isPresented: $homeViewModel.isGameviewPresented, content: {
            GameView(gameViewModel: GameViewModel())
        })
        .padding(.horizontal, 15)
        .navigationTitle("Home Page")
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            HomeView()
                .environmentObject(SessionServiceImpl() )
        }
    }
}
