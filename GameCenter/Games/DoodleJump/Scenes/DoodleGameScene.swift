//
//  DoodleGameScene.swift
//  GameCenter
//
//  Created by Hamit Seyrek on 5.04.2022.
//

import Foundation
import SpriteKit

class DoodleGameScene: SKScene, SKPhysicsContactDelegate {
    
    let background = SKSpriteNode(imageNamed: "doodleBackground")
    let player = SKSpriteNode(imageNamed: "doodle")
    let ground = SKSpriteNode(imageNamed: "doodlePlatform")
    let platform = SKSpriteNode(imageNamed: "doodleMainPlatform")
    
    enum bitmasks: UInt32 {
        case player = 0b1
        case platform = 0b10
    }
    
    override func didMove(to view: SKView) {
        
        self.size = CGSize(width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height)
        self.anchorPoint = .zero
        self.physicsWorld.contactDelegate = self
        
        background.position = CGPoint(x: size.width / 2, y: size.height / 2)
        background.zPosition = 1
        background.size.width = size.width
        background.size.height = size.height
        addChild(background)
        
        ground.position = CGPoint(x: size.width / 2, y: 10)
        ground.zPosition = 5
        ground.size.height = ground.size.height / 6
        ground.size.width = ground.size.width / 6
        ground.physicsBody = SKPhysicsBody(rectangleOf: ground.size)
        ground.physicsBody?.isDynamic = false
        ground.physicsBody?.allowsRotation = false
        ground.setScale(2.5)
        addChild(ground)
        
        player.position = CGPoint(x: size.width / 2, y: size.height / 10)
        player.zPosition = 10
        player.size.width = player.size.width / 4
        player.size.height = player.size.height / 4
        player.physicsBody = SKPhysicsBody(circleOfRadius: player.size.height / 2)
        player.physicsBody?.isDynamic = false // later is true
        player.physicsBody?.restitution = 1
        player.physicsBody?.friction = 0
        player.physicsBody?.angularDamping = 0
        player.setScale(0.5)
        player.physicsBody?.categoryBitMask = bitmasks.player.rawValue
        player.physicsBody?.collisionBitMask = 0
        player.physicsBody?.contactTestBitMask = bitmasks.platform.rawValue
        addChild (player)
        
        makePlatform()
    }
    
    func didBegin(_ contact: SKPhysicsContact) {
        
        let contactA: SKPhysicsBody
        let contactB: SKPhysicsBody
        
        if contact.bodyA.categoryBitMask < contact.bodyB.categoryBitMask {
            contactA = contact.bodyA // player
            contactB = contact.bodyB // platform
        } else {
            contactA = contact.bodyB // player
            contactB = contact.bodyA // platform
        }
        
        if contactA.categoryBitMask == bitmasks.player.rawValue && contactB.categoryBitMask == bitmasks.platform.rawValue {
            
            if player.physicsBody!.velocity.dy < 0 {
                player.physicsBody?.velocity = CGVector(dx: player.physicsBody!.velocity.dx, dy: 700)
            }
        }
    }
    
    override func touchesMoved(_ touches: Set<UITouch>, with event: UIEvent?) {
        
        for touch in touches {
            let location = touch.location(in: self)
            player.position.x = location.x
        }
    }
    
    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        
        player.physicsBody?.isDynamic = true
        player.physicsBody?.applyImpulse(CGVector(dx: 0, dy: 150))
    }
    
    func makePlatform() {
        
        platform.position = CGPoint(x: size.width / 2, y: size.height / 4)
        platform.zPosition = 5
        platform.size.width = platform.size.width
        platform.size.height = platform.size.height / 4
        platform.physicsBody = SKPhysicsBody(rectangleOf: platform.size)
        platform.physicsBody?.isDynamic = false
        platform.physicsBody?.allowsRotation = false
        platform.physicsBody?.affectedByGravity = false
        platform.physicsBody?.categoryBitMask = bitmasks.platform.rawValue
        platform.physicsBody?.collisionBitMask = 0
        platform.physicsBody?.contactTestBitMask = bitmasks.player.rawValue
        addChild (platform)
    }
}
