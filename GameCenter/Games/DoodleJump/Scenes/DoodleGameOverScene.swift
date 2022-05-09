//
//  DoodleGameOverScene.swift
//  GameCenter
//
//  Created by Hamit Seyrek on 9.05.2022.
//

import Foundation
import SpriteKit

class DoodleGameOverScene: SKScene {
    
    let background = SKSpriteNode(imageNamed: "bg_layer1")
    let gameOver = SKSpriteNode(imageNamed: "textGameOver")
    
    override func didMove(to view: SKView) {
        
        background.position = CGPoint(x: size.width / 2, y: size.height / 2)
        addChild(background)
        
        gameOver.position = CGPoint(x: size.width / 2, y: size.height / 2)
        gameOver.setScale(1.6)
        gameOver.zPosition=5
        
        addChild(gameOver)
        
        let tapLabel = SKLabelNode()
        tapLabel.fontName = "Chalkduster"
        tapLabel.position = CGPoint(x: size.width / 2, y: size.height / 4)
        tapLabel.text = "Tap to Restart"
        tapLabel.fontSize=46
        tapLabel.fontColor = .black
        
        addChild(tapLabel)
        let outAction = SKAction.fadeOut (withDuration: 0.5)
        let inAction = SKAction.fadeIn(withDuration:0.5)
        let sequence = SKAction.sequence ([outAction, inAction])
        tapLabel.run(SKAction.repeatForever(sequence))
        
    }
    
    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        
        let gameScene = DoodleGameScene(size: self.size)
        let transition = SKTransition.crossFade(withDuration: 1)
        
        view?.presentScene(gameScene, transition: transition)
    }
}
