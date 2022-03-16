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
        VStack {
            Button {
                homeViewModel.isGameviewPresented = true
            } label: {
                GameButtonView(title: "Play", backgroundColor: Color.green)
            }
        }
        .fullScreenCover(isPresented: $homeViewModel.isGameviewPresented) {
            GameView()
        }
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
