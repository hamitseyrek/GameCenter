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

class BreakoutGameScene: SKScene, SKPhysicsContactDelegate {
    
    let background = SKSpriteNode(imageNamed: "breakoutBackground")
    let paddel = SKSpriteNode(imageNamed: "breakoutPaddle")
    let ball = SKSpriteNode(imageNamed: "breakoutBall")
    
    enum bitmasks: UInt32 {
        case frame = 0b1
        case paddel = 0b10
        case stone = 0b100
        case ball = 0b1000
    }
    
    override func didMove (to view: SKView) {
        
        scene?.size = view.bounds.size
        scene?.scaleMode = .aspectFill
        physicsWorld.gravity = .zero
        physicsWorld.contactDelegate = self
        self.isPaused = true
        
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
        paddel.physicsBody = SKPhysicsBody(rectangleOf: paddel.size)
        paddel.physicsBody?.friction = 0
        paddel.physicsBody?.allowsRotation = false
        paddel.physicsBody?.restitution = 1
        paddel.physicsBody?.isDynamic = false
        paddel.physicsBody?.categoryBitMask = bitmasks.paddel.rawValue
        paddel.physicsBody?.contactTestBitMask = bitmasks.ball.rawValue
        paddel.physicsBody?.collisionBitMask = bitmasks.ball.rawValue
        addChild (paddel)
                                              
        ball.position.x = paddel.position.x
        ball.position.y = paddel.position.y + ball.size.height / 3.5
        ball.size.width = ball.size.width / 3.5
        ball.size.height = ball.size.height / 3.5
        ball.physicsBody = SKPhysicsBody(circleOfRadius: ball.size.height)
        ball.physicsBody?.friction = 0
        ball.physicsBody?.restitution = 1
        ball.physicsBody?.linearDamping = 0
        ball.physicsBody?.angularDamping = 0
        ball.physicsBody?.allowsRotation = false
        ball.physicsBody?.categoryBitMask = bitmasks.ball.rawValue
        ball.physicsBody?.contactTestBitMask = bitmasks.paddel.rawValue | bitmasks.frame.rawValue | bitmasks.stone.rawValue
        ball.physicsBody?.collisionBitMask = bitmasks.paddel.rawValue | bitmasks.frame.rawValue | bitmasks.stone.rawValue
        addChild (ball)
                
        ball.physicsBody?.applyImpulse(CGVector(dx: 10, dy: 10))
        
        // frame
        let frame = SKPhysicsBody (edgeLoopFrom: self.frame)
        frame.friction = 0
        frame.categoryBitMask = bitmasks.frame.rawValue
        frame.contactTestBitMask = bitmasks.ball.rawValue
        frame.collisionBitMask = bitmasks.ball.rawValue
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
            brick.physicsBody = SKPhysicsBody(rectangleOf: brick.size)
            brick.physicsBody?.friction = 0
            brick.physicsBody?.allowsRotation = false
            brick.physicsBody?.restitution = 1
            brick.physicsBody?.isDynamic = false
            brick.physicsBody?.categoryBitMask = bitmasks.stone.rawValue
            brick.physicsBody?.contactTestBitMask = bitmasks.ball.rawValue
            brick.physicsBody?.collisionBitMask = bitmasks.ball.rawValue
            addChild (brick)
        }
    }
    
    func didBegin(_ contact: SKPhysicsContact) {
        
        let contactA: SKPhysicsBody
        let contactB: SKPhysicsBody
        
        if contact.bodyA.categoryBitMask < contact.bodyB.categoryBitMask {
             contactA = contact.bodyA
             contactB = contact.bodyB // ball
        } else {
             contactA = contact.bodyB
             contactB = contact.bodyA // ball
        }
        
        if contactA.categoryBitMask == bitmasks.stone.rawValue && contactB.categoryBitMask == bitmasks.ball.rawValue {
            
             contactA.node?.removeFromParent() // contactA = Stone
        }
        
        if contactA.categoryBitMask == bitmasks.paddel.rawValue && contactB.categoryBitMask == bitmasks.ball.rawValue {
            
            if contactB.node!.position.x <= contactA.node!.frame.midX - 5 {
                  contactB.node?.physicsBody?.velocity = CGVector(dx: 0, dy: 0)
                  contactB.node?.physicsBody?.applyImpulse(CGVector(dx: -10, dy: 10))
             }
            
            if contactB.node!.position.x >= contactA.node!.frame.midX + 5 {
                contactB.node?.physicsBody?.velocity = CGVector(dx: 0, dy: 0)
                contactB.node?.physicsBody?.applyImpulse(CGVector(dx: 10, dy: 10))
            }
        }
    }
}
