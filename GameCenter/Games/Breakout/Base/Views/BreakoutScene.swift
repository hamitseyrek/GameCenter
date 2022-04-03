//
//  BreakoutScene.swift
//  GameCenter
//
//  Created by Hamit Seyrek on 3.04.2022.
//

import Foundation
import Foundation
import SpriteKit
import GameKit

class BreakoutGameScene: SKScene {
    
    let background = SKSpriteNode(imageNamed: "breakoutBackground")
    let paddel = SKSpriteNode(imageNamed: "breakoutPaddle")
    let ball = SKSpriteNode(imageNamed: "breakoutBall")
    
    override func didMove (to view: SKView) {
        
        scene?.size = view.bounds.size
        scene?.scaleMode = .aspectFill
        
        // background and World
        background.position = CGPoint(x: size.width / 2, y: size.height / 2)
        background.zPosition = 1
        background.setScale(0.65)
        addChild (background)
        
        // Player and Ball
        paddel.position = CGPoint(x: size.width / 2, y: 25)
        paddel.zPosition = 10
        addChild(paddel)
        
        ball.position.x = paddel.position.x
        ball.position.y = paddel.position.y + ball.size.height / 2
        ball.size.width = ball.size.width / 2
        ball.size.height = ball.size.height / 2
        ball.zPosition = 10
        addChild (ball)
        
    }
}
