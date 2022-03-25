//
//  RegisterView.swift
//  OnlineTicTacToeGame
//
//  Created by Hamit Seyrek on 23.03.2022.
//

import SwiftUI

struct RegisterView: View {
    
    @StateObject private var registerViewModel = RegistrationViewModelImpl(
        service: RegistrationServiceImp()
    )
    
    var body: some View {
        
        NavigationView {
            
            VStack(spacing: 32) {
                
                VStack(spacing: 16) {
                    
                    InputTextFieldView(text: $registerViewModel.userDetails.email, placeholder: "Email", keyboardType: .emailAddress, sfSymbols: "envelope")
                    
                    InputPasswordFieldView(password: $registerViewModel.userDetails.password, placeholder: "Password", sfSymbols: "lock")
                    
                    Divider()
                    
                    InputTextFieldView(text: $registerViewModel.userDetails.firstName, placeholder: "First Name", keyboardType: .default, sfSymbols: nil)
                    
                    InputTextFieldView(text: $registerViewModel.userDetails.lastName, placeholder: "Last Name", keyboardType: .default, sfSymbols: nil)
                    
                    InputTextFieldView(text: $registerViewModel.userDetails.occupation, placeholder: "Occupation", keyboardType: .default, sfSymbols: nil)
                }
                ButtonComponentView(title: "Sign Up") {
                    registerViewModel.register()
                }
            }
            .padding(.horizontal, 15)
            .navigationTitle("Register")
            .applyClose()
            .alert(isPresented: $registerViewModel.hasError,
                   content: {
                
                if case .failed(let error) = registerViewModel.state {
                    return Alert(
                        title: Text("Error"),
                        message: Text(error.localizedDescription))
                } else {
                    return Alert(
                        title: Text("Error"),
                        message: Text("Something went wrong"))
                }
            })
        }
    }
}

struct RegisterView_Previews: PreviewProvider {
    static var previews: some View {
        RegisterView()
    }
}
