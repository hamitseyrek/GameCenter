//
//  BreakoutGameOverScene.swift
//  GameCenter
//
//  Created by Hamit Seyrek on 4.04.2022.
//

import Foundation
import SpriteKit

class BreakoutGameOverScene: SKScene {
    
    let gameOver = SKSpriteNode(imageNamed: "breakoutTextGameOver")
    
    override func didMove(to view: SKView) {
        
        backgroundColor = .systemBlue
        gameOver.size.width = gameOver.size.width / 4
        gameOver.position = CGPoint(x: size.width / 2, y: size.height / 2)
        gameOver.setScale(1.5)
        gameOver.zPosition = 5
        addChild(gameOver)
        
        let fire = SKEmitterNode (fileNamed: "fire")
        fire?.position = CGPoint(x: gameOver.position.x, y: gameOver.position.y - gameOver.size.height / 2)
        fire?.zPosition = 4
        addChild (fire!)
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        
       let scene = BreakoutGameScene(size: self.size)
       let transition = SKTransition.flipVertical(withDuration: 2)
       self.view?.presentScene (scene, transition: transition)
    }
}
