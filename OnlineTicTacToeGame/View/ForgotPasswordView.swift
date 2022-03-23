//
//  ForgotPasswordView.swift
//  OnlineTicTacToeGame
//
//  Created by Hamit Seyrek on 23.03.2022.
//

import SwiftUI

struct ForgotPasswordView: View {
    
    var body: some View {
        
        NavigationView {
            
            VStack(spacing: 16) {
                
                VStack(spacing: 16) {
                    
                    InputTextFieldView(text: .constant(""), placeholder: "Email", keyboardType: .emailAddress, sfSymbols: "envelope")
                    
                    ButtonComponentView(title: "Send Password Reset") {
                        
                    }
                }
            }
            .padding(.horizontal, 16)
            .navigationTitle("Reset Password")
            .applyClose()
        }
    }
}

struct ForgotPasswordView_Previews: PreviewProvider {
    static var previews: some View {
        ForgotPasswordView()
    }
}
