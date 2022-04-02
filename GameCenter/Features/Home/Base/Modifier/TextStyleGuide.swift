//
//  TextStyleGuide.swift
//  GameCenter
//
//  Created by Hamit Seyrek on 29.03.2022.
//

import Foundation
import SwiftUI

struct Header1: ViewModifier {
    
    func body(content: Content) -> some View {
        
        content
            .font(.system(.largeTitle, design: .serif))
            .foregroundColor(Color("Primary"))
    }
}

struct Header2: ViewModifier {
    
    func body(content: Content) -> some View {
        
        content
            .font(.title)
            .foregroundColor(Color("Primary"))
    }
}

struct Header3: ViewModifier {
    
    func body(content: Content) -> some View {
        
        content
            .font(.headline)
            .foregroundColor(Color("Primary"))
    }
}

struct FootNote: ViewModifier {
    
    func body(content: Content) -> some View {
        
        content
            .font(.footnote)
            .foregroundColor(Color("Primary"))
    }
}

struct BodyStyle: ViewModifier {
    
    func body(content: Content) -> some View {
        
        content
            .font(.body)
            .foregroundColor(Color("Primary"))
    }
}

struct GrayBodyStyle: ViewModifier {
    
    func body(content: Content) -> some View {
        
        content
            .font(.body)
            .foregroundColor(Color.gray)
    }
}
