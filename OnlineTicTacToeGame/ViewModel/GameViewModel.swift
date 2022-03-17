//
//  GameViewModel.swift
//  OnlineTicTacToeGame
//
//  Created by Hamit Seyrek on 17.03.2022.
//

import SwiftUI

final class GameViewModel: ObservableObject {
    let gridColumns: [GridItem] = [GridItem(.flexible(minimum: 10, maximum: 300)),GridItem(.flexible(minimum: 10, maximum: 300)),GridItem(.flexible(minimum: 10, maximum: 300))]
}
