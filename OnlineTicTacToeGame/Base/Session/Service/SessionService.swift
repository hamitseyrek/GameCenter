//
//  SessionService.swift
//  OnlineTicTacToeGame
//
//  Created by Hamit Seyrek on 24.03.2022.
//

import Foundation
import Combine
import Firebase

enum SessionState {
    
    case loggedIn
    case loggedOut
}

protocol SessionService {
    
    var state: SessionState { get }
    var userDetails: SessionUserDetails? { get }
    
    func logout ()
}

final class SessionServiceImpl: ObservableObject, SessionService {
    
    static let shared = SessionServiceImpl()
    @Published var state: SessionState = .loggedOut
    @Published var userDetails: SessionUserDetails?
    
    
    private var handler: AuthStateDidChangeListenerHandle?
    
    init() {
        setupFirebaseAuthHandler()
    }
    
    func logout() {
        try? Auth.auth().signOut()
    }
}

private extension SessionServiceImpl {
    
    func setupFirebaseAuthHandler() {
        
        handler = Auth
            .auth()
            .addStateDidChangeListener { [weak self] res, user in
                guard let self = self else { return }
                 self.state = user == nil ? .loggedOut : .loggedIn
                if let uid = user?.uid {
                    self.handleRefresh(with: uid)
                }
            }
    }
    
    func handleRefresh(with uid: String) {
        
        FirebaseReference(.User).document(uid).getDocument(completion: { [weak self]  documentSnapshot, error in
            if error != nil {
                print("Error is here 33: ", error?.localizedDescription ?? "")
                return
            }
            print(1)
            if let snapshot = documentSnapshot {
                    self?.userDetails = try? snapshot.data(as: SessionUserDetails.self)
            }
            print(2)
            return
        })
    }
}

