//
//  ContentView.swift
//  OnlineTicTacToeGame
//
//  Created by Hamit Seyrek on 14.03.2022.
//

import SwiftUI

struct HomeView: View {
    
    @StateObject var homeViewModel = HomeViewModel()
    
    var body: some View {
        
        VStack(alignment: .leading, spacing: 16) {
            
            VStack(alignment: .leading, spacing: 16) {
                
                Text("Name: ")
                Text("Surname: ")
                Text("Occupation: ")
            }
            
            ButtonComponentView(title: "Play",
                                background: .green,
                                foreground: .white,
                                border: .clear) {
                homeViewModel.isGameviewPresented = true
            }
            
            ButtonComponentView(title: "Logout") {
                
            }
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
        }
    }
}
