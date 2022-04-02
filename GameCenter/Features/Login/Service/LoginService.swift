//
//  LoginService.swift
//  GameCenter
//
//  Created by Hamit Seyrek on 25.03.2022.
//

import Combine
import Foundation
import FirebaseAuth

protocol LoginService {
    
    func login (with credentials: User) -> AnyPublisher<Void, Error>
}

final class LoginServiceImpl: LoginService {
    func login(with credentials: User) -> AnyPublisher<Void, Error> {
        
        Deferred {
            
            Future { promise in
                
                Auth.auth().signIn(withEmail: credentials.email, password: credentials.password) { authResult, error in
                    
                    if let error = error {
                        promise(.failure(error))
                    } else {
                        promise(.success(()))
                    }
                }
            }
        }
        .receive(on: RunLoop.main)
        .eraseToAnyPublisher()
    }
    
    
}
