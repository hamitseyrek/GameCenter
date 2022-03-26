//
//  UserModel.swift
//  OnlineTicTacToeGame
//
//  Created by Hamit Seyrek on 18.03.2022.
//

import Foundation

struct User: Codable {
    
    var id: String
    var email: String
    var password: String
    var firstName: String
    var lastName: String
    var occupation: String
}

extension User {
    
    static var new: User {
        
        User (id: "",
              email: "",
              password: "",
              firstName: "",
              lastName: "",
              occupation: "")
    }
}
