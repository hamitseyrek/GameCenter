//
//  ProfileView.swift
//  GameCenter
//
//  Created by Hamit Seyrek on 2.04.2022.
//

import SwiftUI

struct ProfileView: View {
    
    @EnvironmentObject var sessionService: SessionServiceImpl
    
    var body: some View {
        VStack {
            ButtonComponentView(title: "Logout") {
                sessionService.logout()
            }.padding(20)
        }
    }
}

struct ProfileView_Previews: PreviewProvider {
    static var previews: some View {
        ProfileView()
    }
}
