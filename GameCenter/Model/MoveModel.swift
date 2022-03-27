//
//  MoveModel.swift
//  GameCenter
//
//  Created by Hamit Seyrek on 17.03.2022.
//

import Foundation

struct MoveModel: Codable {
    let isPlayerOne: Bool
    let boardIndex: Int
    
    var indicator: String {
        isPlayerOne ? "xmark" : "circle"
    }
}
