//
//  DoodleJumpView.swift
//  GameCenter
//
//  Created by Hamit Seyrek on 5.04.2022.
//

import SwiftUI
import SpriteKit

class DoodleStartScene: SKScene {
    
    override func didMove(to view: SKView) {
        
         self.size = CGSize(width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height)
        scene?.scaleMode = .aspectFill
    }
    
    override func touchesBegan(_ touches: Set<UITouch>,
        with event: UIEvent?) {
        for touch in touches {
            let location = touch.location(in: self)
            let starNode = atPoint(location)
                            
            if starNode.name  == "doodleStartButton" {
                let game = DoodleGameScene(size: self.size)
                let transition = SKTransition.doorway (withDuration: 3)
                             
                self.view?.presentScene (game, transition:
                    transition)
            }
        }
    }
}

struct DoodleJumpView: View {
    
    let startScene = DoodleStartScene(fileNamed: "DoodleStartScene")
    
    var body: some View {
        SpriteView(scene: startScene!)
            .edgesIgnoringSafeArea(.all)
    }
}

struct DoodleJumpView_Previews: PreviewProvider {
    static var previews: some View {
        DoodleJumpView()
    }
}
