//
//  ForgotPasswordService.swift
//  OnlineTicTacToeGame
//
//  Created by Hamit Seyrek on 25.03.2022.
//

import Combine
import Foundation
import FirebaseAuth

protocol ForgotPasswordService {
    func sendPasswgrdReset (to email: String) -> AnyPublisher<Void, Error>
}

final class ForgotPasswordServiceImpl: ForgotPasswordService {
    
    func sendPasswgrdReset(to email: String) -> AnyPublisher<Void, Error> {
        
        Deferred {
            
            Future { promise in
                
                Auth.auth().sendPasswordReset(withEmail: email) { error in
                    
                    if let err = error {
                        promise(.failure(err))
                    } else {
                        promise(.success(()))
                    }
                }
            }
        }
        .eraseToAnyPublisher()
    }
}
