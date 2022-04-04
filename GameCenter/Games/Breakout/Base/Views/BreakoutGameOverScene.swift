//
//  BreakoutGameOverScene.swift
//  GameCenter
//
//  Created by Hamit Seyrek on 4.04.2022.
//

import Foundation
import SpriteKit

class BreakoutGameOverScene: SKScene {
    
    let gameOver = SKSpriteNode (imageNamed: "breakoutTextGameOver")
    
    override func didMove(to view: SKView) {
        backgroundColor = .systemBlue
        gameOver.position = CGPoint(x: size.width / 2, y: size.height / 2)
        gameOver.setScale(1.5)
        gameOver.zPosition = 5
        addChild(gameOver)
        
        let fire = SKEmitterNode (fileNamed: "fire")
        fire?.position = CGPoint(x: gameOver.position.x, y: gameOver.position.y - gameOver.size.height / 2)
        fire?.zPosition = 4
                                                                                               
        addChild (fire!)
    }
}
