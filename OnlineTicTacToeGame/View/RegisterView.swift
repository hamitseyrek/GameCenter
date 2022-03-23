//
//  RegisterView.swift
//  OnlineTicTacToeGame
//
//  Created by Hamit Seyrek on 23.03.2022.
//

import SwiftUI

struct RegisterView: View {
    
    @Environment(\.presentationMode) var presentationMode
    
    var body: some View {
        
        NavigationView {
            
            VStack(spacing: 32) {
                
                
            }
            .padding(.horizontal, 15)
            .navigationTitle("Register")
            .toolbar {
                Button {
                    presentationMode.wrappedValue.dismiss()
                } label: {
                    Image(systemName: "xmark")
                }

            }
        }
    }
}

struct RegisterView_Previews: PreviewProvider {
    static var previews: some View {
        RegisterView()
    }
}
