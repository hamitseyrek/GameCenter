//
//  FirebaseService.swift
//  OnlineTicTacToeGame
//
//  Created by Hamit Seyrek on 19.03.2022.
//

import Foundation
import Firebase
import FirebaseFirestoreSwift
import Combine

final class FirebaseService:ObservableObject {
    static let shared = FirebaseService()
    @Published var game: GameModel!
    
    init() { }
}
