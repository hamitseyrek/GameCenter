//
//  SessionUserDetails.swift
//  GameCenter
//
//  Created by Hamit Seyrek on 24.03.2022.
//

import Foundation

struct SessionUserDetails: Codable {
    
    var id: String
    var email: String
    let firstName: String
    let lastName: String
    let occupation: String
}
