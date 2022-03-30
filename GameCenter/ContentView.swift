//
//  ContentView.swift
//  GameCenter
//
//  Created by Hamit Seyrek on 29.03.2022.
//

import SwiftUI

struct ContentView: View {
    
    //@StateObject var sessionService = SessionServiceImpl()
    let horizontalPadding: CGFloat = 30
    
    var body: some View {
        
        VStack {
            
            VStack (alignment: .leading, spacing: 10) {
                
                WelcomeHeaderView()
                    .padding(.horizontal, horizontalPadding)
                
                SearchTextField()
                    .padding(.horizontal, horizontalPadding)
                
                CardPickerView()
                    .padding(.horizontal, horizontalPadding)
                
                Text("Recommended Games").modifier(Header3())
                    .padding(.horizontal, horizontalPadding)
                
                ScrollView (.horizontal, showsIndicators: false) {
                    
                    LazyHStack (spacing: 14) {
                        
                        CardView(game: Game.example1())
                            .padding(.leading, 10)
                        CardView(game: Game.example1())
                            .padding(.trailing, 10)
                    }
                }
            }
            .background(Color("Background"))
        }
    }
}



struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
