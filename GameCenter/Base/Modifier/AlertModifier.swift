//
//  AlertModifier.swift
//  OnlineTicTacToeGame
//
//  Created by Hamit Seyrek on 25.03.2022.
//

import SwiftUI

struct AlertModifier: ViewModifier {
    
    @Environment(\.presentationMode) var presentationMode
    var error: String
    
    func body(content: Content) -> some View {
        
        content
            .alert(isPresented: Binding<Bool>, error: <#T##LocalizedError?#>, actions: <#T##() -> View#>)
            .toolbar {
                Button {
                    presentationMode.wrappedValue.dismiss()
                } label: {
                    Image(systemName: "xmark")
                }
            }
    }
}

extension View {
    
    func showAlert() -> some View {
        
        self.modifier(CloseModifier())
    }
}
