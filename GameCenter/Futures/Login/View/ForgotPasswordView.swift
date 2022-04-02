//
//  ForgotPasswordView.swift
//  GameCenter
//
//  Created by Hamit Seyrek on 23.03.2022.
//

import SwiftUI

struct ForgotPasswordView: View {
    
    @Environment(\.presentationMode) var presentationMode
    @StateObject private var viewModel = ForgotPasswordViewModelImpl(service: ForgotPasswordServiceImpl())
    
    var body: some View {
        
        NavigationView {
            
            VStack(spacing: 16) {
                
                VStack(spacing: 16) {
                    
                    InputTextFieldView(text: .constant(viewModel.email), placeholder: "Email", keyboardType: .emailAddress, sfSymbols: "envelope")
                    
                    ButtonComponentView(title: "Send Password Reset") {
                        viewModel.sendPasswordReset()
                        presentationMode.wrappedValue.dismiss()
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
