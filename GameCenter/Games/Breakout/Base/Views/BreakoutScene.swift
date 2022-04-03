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
        physicsWorld.gravity = .zero
        
        // background and World
        background.position = CGPoint(x: size.width / 2, y: size.height / 2)
        background.zPosition = 10
        background.setScale(0.65)
        //addChild (background)
        
        // Player and Ball
        paddel.position = CGPoint(x: size.width / 2, y: 25)
        paddel.size.width = paddel.size.width / 1.5
        paddel.size.height = paddel.size.height / 2
        paddel.zPosition = 10
        addChild(paddel)
        
        ball.position.x = paddel.position.x
        ball.position.y = paddel.position.y + ball.size.height / 3.5
        ball.size.width = ball.size.width / 3.5
        ball.size.height = ball.size.height / 3.5
        ball.physicsBody = SKPhysicsBody(circleOfRadius: ball.size.height / 3.5)
        ball.physicsBody?.friction = 0
        ball.physicsBody?.restitution = 1
        ball.physicsBody?.linearDamping = 0
        ball.physicsBody?.angularDamping = 0
        ball.physicsBody?.allowsRotation = false
        addChild(ball)
        
        ball.physicsBody?.applyImpulse(CGVector(dx: 10, dy: -10))
        
        // frame
        let frame = SKPhysicsBody (edgeLoopFrom: self.frame)
        frame.friction = 0
        self.physicsBody = frame
        
        // stone
        makeStone(reihe: 7, bitmask: 0b100, y: Int(scene!.size.height - 177), name: "breakoutBrick")
        makeStone(reihe: 7, bitmask: 0b100, y: Int(scene!.size.height - 200), name: "breakoutBrick1")
        makeStone(reihe: 7, bitmask: 0b100, y: Int(scene!.size.height - 223), name: "breakoutBrick2")
    }
    
    override func touchesMoved(_ touches: Set<UITouch>, with event: UIEvent?) {
        
        for touch in touches {
            
            let location = touch.location(in: self)
            paddel.position.x = location.x
        }
    }
    
    override func update (_ currentTime: TimeInterval) {
        
        if paddel.position.x < 50 {
            paddel.position.x = 50
        }
        
        if paddel.position.x > self.size.width - paddel.size.width / 2 {
            paddel.position.x = self.size.width - paddel.size.width / 2
        }
    }
    
    func makeStone(reihe: Int, bitmask: UInt32, y: Int, name: String) {
        for i in 1...reihe {
            let brick = SKSpriteNode (imageNamed: name)
            brick.size.width = self.scene!.size.width / 9.8
            brick.position = CGPoint(x: 30 + i * Int(brick.size.width), y: y)
            brick.zPosition = 10
            brick.name = "Brick" + String(i)
            addChild (brick)
        }
    }
}
