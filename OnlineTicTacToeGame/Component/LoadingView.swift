//
//  LoadingView.swift
//  OnlineTicTacToeGame
//
//  Created by Hamit Seyrek on 17.03.2022.
//

import SwiftUI

struct LoadingView: View {
    var body: some View {
        ZStack {
            Color(.systemBackground)
                .edgesIgnoringSafeArea(.all)
            
            ProgressView()
                .progressViewStyle(CircularProgressViewStyle())
                .scaleEffect()
        }
    }
}
