//
//  LoginViewModel.swift
//  GameCenter
//
//  Created by Hamit Seyrek on 25.03.2022.
//

import Foundation
import Combine

enum LoginState {
    case successfull
    case failed(error: Error)
    case na
}

protocol LoginViewModel {
    func login()
    var service: LoginService { get }
    var state: LoginState { get }
    var credential: User { get }
    var hasError: Bool { get }
    init(service: LoginService)
}

final class LoginViewModelImp: ObservableObject, LoginViewModel {
    
    @Published var hasError: Bool = false
    @Published var state: LoginState = .na
    @Published var credential: User = User.new
    
    private var subsciptions = Set<AnyCancellable>()
    
    let service: LoginService
    
    init(service: LoginService) {
        self.service = service
        setupErrorSubscriptions()
    }
    
    func login() {
        
        service.login(with: credential)
            .sink { res in
                
                switch res {
                case .failure(let err):
                    self.state = .failed(error: err)
                default: break
                }
                
            } receiveValue: { [weak self] in
                self?.state = .successfull
            }
            .store(in: &subsciptions)
    }
}

private extension LoginViewModelImp {
    
    func setupErrorSubscriptions () {
        
        $state
        
            .map { state -> Bool in
                switch state {
                case .successfull,
                        .na:
                    return false
                case .failed:
                    return true
                }
            }
            .assign(to: &$hasError)
    }
}
