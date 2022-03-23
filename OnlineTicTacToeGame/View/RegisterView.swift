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
                    
                    InputTextFieldView(text: $registerViewModel.userDetails.firstName, placeholder: "First Name", keyboardType: .namePhonePad, sfSymbols: nil)
                    
                    InputTextFieldView(text: $registerViewModel.userDetails.lastName, placeholder: "Last Name", keyboardType: .namePhonePad, sfSymbols: nil)
                    
                    InputTextFieldView(text: $registerViewModel.userDetails.occupation, placeholder: "Occupation", keyboardType: .namePhonePad, sfSymbols: nil)
                }
                ButtonComponentView(title: "Sign Up") {
                    registerViewModel.register()
                }
            }
            .padding(.horizontal, 15)
            .navigationTitle("Register")
            .applyClose()
        }
    }
}

struct RegisterView_Previews: PreviewProvider {
    static var previews: some View {
        RegisterView()
    }
}
