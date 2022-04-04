//
//  BreakoutFinishScene.swift
//  GameCenter
//
//  Created by Hamit Seyrek on 5.04.2022.
//

import Foundation
import SpriteKit

class BreakoutFinishScene: SKScene {
    
    override func didMove(to view: SKView) {
        
        backgroundColor = .black
        let label = SKLabelNode(fontNamed: "Chalkduster")
        label.text = "Game Finish"
        label.fontColor = .red
        label.fontSize = 45
        label.position = CGPoint(x: size.width / 2, y: size.height / 2)
        addChild (label)
        
        let finishSpark = SKEmitterNode(fileNamed: "finishSpark")
        finishSpark?.position = CGPoint(x: size.width / 3, y: size.height / 3)
        addChild(finishSpark!)
    }
    
    
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        
       let scene = BreakoutGameScene(size: self.size)
       let transition = SKTransition.flipVertical(withDuration: 2)
       self.view?.presentScene (scene, transition: transition)
    }
}
