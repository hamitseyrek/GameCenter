//
//  WelcomeHeaderView.swift
//  GameCenter
//
//  Created by Hamit Seyrek on 29.03.2022.
//

import SwiftUI

struct WelcomeHeaderView: View {
    
    let userName: String
    
    var body: some View {
        
        HStack {
            
            VStack (alignment: .leading, spacing: 5) {
                
                Text("Günaydın")
                    .modifier(Header3())
                
                Text(userName)
                    .modifier(Header1())
            }
            
            Spacer()
            
            Image("MyProfile")
                .resizable()
                .scaledToFill()
                .frame(width: 70, height: 70)
                .clipShape(Circle())
        }
    }
}

struct WelcomeHeaderView_Previews: PreviewProvider {
    static var previews: some View {
        WelcomeHeaderView(userName: "Hamit Seyrek")
    }
}
