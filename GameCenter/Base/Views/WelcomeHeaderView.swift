//
//  WelcomeHeaderView.swift
//  GameCenter
//
//  Created by Hamit Seyrek on 29.03.2022.
//

import SwiftUI

struct WelcomeHeaderView: View {
    var body: some View {
        
        HStack {
            
            VStack (alignment: .leading, spacing: 5) {
                
                Text("Günaydın")
                    .modifier(Header2())
                
                Text("Hamit")
                    .modifier(Header1())
            }
            
            Spacer()
            
            Image("MyProfile")
                .resizable()
                .scaledToFill()
                .frame(width: 80, height: 80)
                .clipShape(Circle())
        }
    }
}

struct WelcomeHeaderView_Previews: PreviewProvider {
    static var previews: some View {
        WelcomeHeaderView()
    }
}
