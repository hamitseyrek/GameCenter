//
//  SearchTextField.swift
//  GameCenter
//
//  Created by Hamit Seyrek on 30.03.2022.
//

import SwiftUI

struct SearchTextField: View {
    
    @State private var text: String = ""
    
    var body: some View {
        
        HStack {
            
            TextField("Seacrh for Games", text: $text)
                .modifier(GrayBodyStyle())
            
            Image(systemName: "magnifyingglass")
                .foregroundColor(Color("AccentColor"))
        }
        .padding()
        .background(RoundedRectangle(cornerRadius: 10)
            .fill(Color("BackgroundField")))
    }
}

struct SearchTextField_Previews: PreviewProvider {
    static var previews: some View {
        SearchTextField()
            .background(Color("Primary"))
    }
}
