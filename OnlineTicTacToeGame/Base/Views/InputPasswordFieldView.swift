//
//  InputPasswordFieldView.swift
//  OnlineTicTacToeGame
//
//  Created by Hamit Seyrek on 22.03.2022.
//

import SwiftUI

struct InputPasswordFieldView: View {
    
    @Binding var password: String
    let placeholder: String
    let sfSymbols: String?
    private let textFieldLeading: CGFloat = 30
    
    var body: some View {
        
        SecureField(placeholder, text: $password)
            .frame(maxWidth: .infinity, minHeight: 44)
            .padding(.leading, sfSymbols == nil ? textFieldLeading / 2 : textFieldLeading)
            .background(
                
                ZStack(alignment: .leading) {
                    
                    if let systemImage = sfSymbols {
                        
                        Image(systemName: systemImage)
                            .font(.system(size: 16, weight: .semibold))
                            .padding(.leading, 5)
                            .foregroundColor(Color.gray.opacity(0.5))
                    }
                    
                    RoundedRectangle(cornerRadius: 10, style: .continuous)
                        .stroke(Color.gray.opacity(0.25))
                }
            )
    }
}

struct InputPasswordFieldView_Previews: PreviewProvider {
    static var previews: some View {
        InputPasswordFieldView(password: .constant(""), placeholder: "Password", sfSymbols: "lock")
            .preview(with: "Password Field")
    }
}
