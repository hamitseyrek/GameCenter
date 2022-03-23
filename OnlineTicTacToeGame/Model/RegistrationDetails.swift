//
//  RegistrationDetails.swift
//  OnlineTicTacToeGame
//
//  Created by Hamit Seyrek on 23.03.2022.
//

import Foundation

struct RegistrationDetails: Codable {
    
    var email: String
    var password: String
    var firstName: String
    var lastName: String
    var occupation: String
}

extension RegistrationDetails {
    
    static var new: RegistrationDetails {
        
        RegistrationDetails (email: "",
                             password: "",
                             firstName: "",
                             lastName: "",
                             occupation: "")
    }
}
