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

class GameScene: SKScene {
    
    let background = SKSpriteNode(imageNamed: "breakoutBackground")
    let paddel = SKSpriteNode(imageNamed: "breakoutPaddle")
    
    override func didMove (to view: SKView) {
        
        scene?.size = view.bounds.size
        scene?.scaleMode = .aspectFill
        
        // background and World
        background.position = CGPoint(x: size.width / 2, y: size.height / 2)
        background.zPosition = 1
        background.setScale(0.65)
        addChild (background)
        
        
    }
}
