//
//  RegistrationService.swift
//  GameCenter
//
//  Created by Hamit Seyrek on 23.03.2022.
//

import Foundation
import Combine
import FirebaseFirestoreSwift
import Firebase

enum RegistrationKeys: String {
    case id
    case email
    case firstName
    case lastName
    case occupation
}

protocol RegistrationService {
    func register(with details: RegistrationDetails) -> AnyPublisher<Void, Error>
}

final class RegistrationServiceImp: RegistrationService {
    
    func register(with details: RegistrationDetails) -> AnyPublisher<Void, Error> {
        
        Deferred {
            
            Future { promise in
                
                Auth.auth().createUser(withEmail: details.email, password: details.password) { authResult, error in
                    
                    if let error = error {
                        promise(.failure(error))
                    } else {
                        
                        if let uid = authResult?.user.uid {
                            
                            let values = [
                                RegistrationKeys.firstName.rawValue: details.firstName,
                                RegistrationKeys.lastName.rawValue: details.lastName,
                                RegistrationKeys.occupation.rawValue: details.occupation,
                                RegistrationKeys.email.rawValue: details.email,
                                RegistrationKeys.id.rawValue: uid
                                
                            ] as [String : String]
                            
                            do {
                                try FirebaseReference(.User).document(uid).setData(from: values)
                                promise(.success(()))
                            } catch {
                                promise(.failure(error))
                            }
                            
                        } else {
                            promise(.failure(NSError(domain: "Invailed User ID", code: 0, userInfo: nil)))
                        }
                    }
                }
            }
        }
        .receive(on: RunLoop.main)
        .eraseToAnyPublisher()
    }
}
