//
//  ContentView.swift
//  GameCenter
//
//  Created by Hamit Seyrek on 29.03.2022.
//

import SwiftUI

struct ContentView: View {
    
    let horizontalPadding: CGFloat = 30
    
    var body: some View {
        
        ScrollView {
            
            VStack {
                
                VStack (alignment: .leading, spacing: 13) {
                    
                    WelcomeHeaderView()
                        .padding(.horizontal, horizontalPadding)
                    
                    SearchTextField()
                        .padding(.horizontal, horizontalPadding)
                    
                    CardPickerView(uiScreenBounds: UIScreen.main.bounds)
                        .padding(.horizontal, horizontalPadding)
                        .padding(.vertical)
                    
                    Text("Recommended Games").modifier(Header3())
                        .padding(.horizontal, horizontalPadding)
                    
                    ScrollView (.horizontal, showsIndicators: false) {
                        
                        LazyHStack (spacing: 14) {
                            
                            CardView(game: Game.example1())
                            
                            CardView(game: Game.example1())
                        }
                    }
                    .padding(.horizontal, horizontalPadding)
                }
                
            }.background(Color("Background").edgesIgnoringSafeArea(.all))
        }
    }
}



struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
