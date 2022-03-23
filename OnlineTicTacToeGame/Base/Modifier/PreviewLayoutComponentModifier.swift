//
//  PreviewLayoutComponentModifier.swift
//  OnlineTicTacToeGame
//
//  Created by Hamit Seyrek on 22.03.2022.
//

import SwiftUI

struct PreviewLayoutComponentModifier: ViewModifier {
    
    let name: String
    
    func body(content: Content) -> some View {
        
        content
            .previewLayout(.sizeThatFits)
            .previewDisplayName(name)
            .padding()
    }
}

extension View {
    
    func preview(with name: String) -> some View {
        
        self.modifier(PreviewLayoutComponentModifier(name: name))
    }
}
