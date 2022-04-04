//
//  BreakoutView.swift
//  GameCenter
//
//  Created by Hamit Seyrek on 3.04.2022.
//

import SwiftUI
import SpriteKit

struct BreakoutView: View {
    
    let scene = BreakoutGameScene()
    
    var body: some View {
        SpriteView(scene: scene)
            .edgesIgnoringSafeArea(.all)
    }
}

struct BreakoutView_Previews: PreviewProvider {
    static var previews: some View {
        BreakoutView()
    }
}
