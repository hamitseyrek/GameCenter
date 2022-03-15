//
//  ContentView.swift
//  OnlineTicTacToeGame
//
//  Created by Hamit Seyrek on 14.03.2022.
//

import SwiftUI

struct HomeView: View {
    @State var isGameviewPresented = false

    var body: some View {
        VStack {
            Button {
                isGameviewPresented.toggle()
            } label: {
                GameButtonView(title: "Play", backgroundColor: Color.green)
            }
        }
        .fullScreenCover(isPresented: $isGameviewPresented) {
            GameView()
        }
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
