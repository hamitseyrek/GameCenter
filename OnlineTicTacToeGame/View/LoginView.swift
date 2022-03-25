//
//  LoginView.swift
//  OnlineTicTacToeGame
//
//  Created by Hamit Seyrek on 22.03.2022.
//

import SwiftUI

struct LoginView: View {
    
    @State private var showRegistration = false
    @State private var showForgotPassword = false
    
    @StateObject var viewModel = LoginViewModelImp(service: LoginServiceImpl())
    
    var body: some View {
        
        VStack(spacing: 16) {
            
            VStack(spacing: 16) {
                
                InputTextFieldView(text: $viewModel.credential.email, placeholder: "Email", keyboardType: .emailAddress, sfSymbols: "envelope")
                
                InputPasswordFieldView(password: $viewModel.credential.password , placeholder: "Password", sfSymbols: "lock")
            }
            HStack {
                
                Spacer()
                
                Button {
                    showForgotPassword.toggle()
                } label: {
                    Text("Forgot Password?")
                }
                .font(.system(size: 16, weight: .bold))
                .sheet(isPresented: $showForgotPassword) {
                    ForgotPasswordView()
                }
            }
            
            VStack(spacing: 16) {
                
                ButtonComponentView(title: "Login") {
                    viewModel.login()
                }
                
                ButtonComponentView(title: "Register",
                                    background: .clear,
                                    foreground: .blue,
                                    border: .blue) {
                    showRegistration.toggle()
                }.sheet(isPresented: $showRegistration) {
                    RegisterView()
                }
            }
        }
        .padding(.horizontal, 15)
        .navigationTitle("Login")
    }
}

struct LoginView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            LoginView()
        }
    }
}
