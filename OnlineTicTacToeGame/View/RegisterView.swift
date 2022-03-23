//
//  RegisterView.swift
//  OnlineTicTacToeGame
//
//  Created by Hamit Seyrek on 23.03.2022.
//

import SwiftUI

struct RegisterView: View {
    
    var body: some View {
        
        NavigationView {
            
            VStack(spacing: 32) {
                
                VStack(spacing: 16) {
                    
                    InputTextFieldView(text: .constant(""), placeholder: "Email", keyboardType: .emailAddress, sfSymbols: "envelope")
                    InputPasswordFieldView(password: .constant(""), placeholder: "Password", sfSymbols: "lock")
                    
                    Divider()
                    
                    InputTextFieldView(text: .constant(""), placeholder: "First Name", keyboardType: .namePhonePad, sfSymbols: nil)
                    
                    InputTextFieldView(text: .constant(""), placeholder: "Last Name", keyboardType: .namePhonePad, sfSymbols: nil)
                    
                    InputTextFieldView(text: .constant(""), placeholder: "Occupation", keyboardType: .namePhonePad, sfSymbols: nil)
                }
                ButtonComponentView(title: "Sign Up") {
                    
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
