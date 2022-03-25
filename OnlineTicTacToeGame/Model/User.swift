//
//  UserModel.swift
//  OnlineTicTacToeGame
//
//  Created by Hamit Seyrek on 18.03.2022.
//

import Foundation

struct User: Codable {
    
    var id = UUID().uuidString
    var email: String
    var password: String
    var firstName: String
    var lastName: String
    var occupation: String
}

extension User {
    
    static var new: User {
        
        User (email: "",
                             password: "",
                             firstName: "",
                             lastName: "",
                             occupation: "")
    }
}
