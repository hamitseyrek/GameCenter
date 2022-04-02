//
//  ForgotPasswordViewModel.swift
//  GameCenter
//
//  Created by Hamit Seyrek on 25.03.2022.
//

import Combine
import Foundation

protocol ForgotPasswordViewModel {
    
    func sendPasswordReset ()
    var service: ForgotPasswordService { get }
    var email: String { get }
    init(service: ForgotPasswordService)
}

final class ForgotPasswordViewModelImpl: ObservableObject, ForgotPasswordViewModel {
    
    @Published var email: String = ""
    let service: ForgotPasswordService
    
    private var subscription = Set<AnyCancellable>()
    
    init(service: ForgotPasswordService) {
        self.service = service
    }
    
    func sendPasswordReset() {
        
        service.sendPasswgrdReset(to: email)
            .sink { res in
                switch res {
                case .failure(let err):
                    print("Error !: ", err)
                default: break
                }
            } receiveValue: { _ in
                print("Sent password reset request!")
            }
            .store(in: &subscription)
        
    }
}
