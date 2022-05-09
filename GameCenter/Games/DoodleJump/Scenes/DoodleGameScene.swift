//
//  DoodleGameScene.swift
//  GameCenter
//
//  Created by Hamit Seyrek on 5.04.2022.
//

import Foundation
import SpriteKit
import GameplayKit

class DoodleGameScene: SKScene, SKPhysicsContactDelegate {
    
    let background = SKSpriteNode(imageNamed: "doodleBackground")
    let player = SKSpriteNode(imageNamed: "doodle")
    let ground = SKSpriteNode(imageNamed: "doodlePlatform")
    let gameOverLine = SKSpriteNode(color: .red, size: CGSize(width: 700, height: 10))
    var firstTouch = false
    
    let cam = SKCameraNode()
    
    enum bitmasks: UInt32 {
        case player = 0b1
        case platform = 0b10
        case gameOverLine = 0b100
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
        player.physicsBody?.contactTestBitMask = bitmasks.platform.rawValue | bitmasks.gameOverLine.rawValue
        addChild (player)
        
        gameOverLine.position = CGPoint(x: player.position.x, y: player.position.y - 200)
        gameOverLine.zPosition = 10
        gameOverLine.physicsBody = SKPhysicsBody(rectangleOf: gameOverLine.size)
        gameOverLine.physicsBody?.affectedByGravity = false
        gameOverLine.physicsBody?.allowsRotation = false
        gameOverLine.physicsBody?.categoryBitMask = bitmasks.gameOverLine.rawValue
        gameOverLine.physicsBody?.contactTestBitMask = bitmasks.platform.rawValue | bitmasks.player.rawValue
        addChild(gameOverLine)
        
        makePlatform()
        makePlatform2()
        makePlatform3()
        makePlatform4()
        makePlatform5()
        makePlatform6()
        
        cam.setScale(1)
        cam.position.x = player.position.x
        camera = cam
    }
    
    override func update(_ currentTime: TimeInterval) {
        
        cam.position.y = player.position.y + 250
        
        //background.position.x = player.position.x
        background.position.y = player.position.y
        
        if player.physicsBody!.velocity.dy > 0 {
            gameOverLine.position.y = player.position.y - 200
        }
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
        
        if contactB.categoryBitMask == bitmasks.gameOverLine.rawValue && contactA.categoryBitMask == bitmasks.platform.rawValue {
            contactA.node?.removeFromParent()
        }
        
        if contactA.categoryBitMask == bitmasks.player.rawValue && contactB.categoryBitMask == bitmasks.platform.rawValue {
            
            if player.physicsBody!.velocity.dy < 0 {
                player.physicsBody?.velocity = CGVector(dx: player.physicsBody!.velocity.dx, dy: 1400)
                contactB.node?.removeFromParent()
                makePlatform5()
                makePlatform6()
            }
        }
        
        if contactA.categoryBitMask == bitmasks.player.rawValue && contactB.categoryBitMask == bitmasks.gameOverLine.rawValue {
            gameOver()
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
        
        if firstTouch == false {
            player.physicsBody?.applyImpulse(CGVector(dx: 0, dy: 150))
        }
        
        firstTouch = true
    }
    
    func makePlatform() {
        
        let platform = SKSpriteNode(imageNamed: "doodleMainPlatform")
        platform.position = CGPoint(x: GKRandomDistribution(lowestValue: 70, highestValue: 700).nextInt(), y: GKRandomDistribution(lowestValue: 140, highestValue: 300).nextInt() + Int(player.position.y))
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
    
    func makePlatform2() {
        
        let platform = SKSpriteNode(imageNamed: "doodleMainPlatform")
        platform.position = CGPoint(x: GKRandomDistribution(lowestValue: 70, highestValue: 700).nextInt(), y: GKRandomDistribution(lowestValue: 350, highestValue: 550).nextInt() + Int(player.position.y))
        platform.zPosition = 5
        platform.setScale(0.4)
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
    
    func makePlatform3() {
        
        let platform = SKSpriteNode(imageNamed: "doodleMainPlatform")
        platform.position = CGPoint(x: GKRandomDistribution(lowestValue: 70, highestValue: 700).nextInt(), y: GKRandomDistribution(lowestValue: 600, highestValue: 800).nextInt() + Int(player.position.y))
        platform.zPosition = 5
        platform.setScale(0.4)
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
    
    func makePlatform4() {
        
        let platform = SKSpriteNode(imageNamed: "doodleMainPlatform")
        platform.position = CGPoint(x: GKRandomDistribution(lowestValue: 70, highestValue: 700).nextInt(), y: GKRandomDistribution(lowestValue: 850, highestValue: 1050).nextInt() + Int(player.position.y))
        platform.zPosition = 5
        platform.setScale(0.4)
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
    
    func makePlatform5() {
        
        let platform = SKSpriteNode(imageNamed: "doodleMainPlatform")
        platform.position = CGPoint(x: GKRandomDistribution(lowestValue: 70, highestValue: 700).nextInt(), y: GKRandomDistribution(lowestValue: 1100, highestValue: 1300).nextInt() + Int(player.position.y))
        platform.zPosition = 5
        platform.setScale(0.4)
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
    
    func makePlatform6() {
        
        let platform = SKSpriteNode(imageNamed: "doodleMainPlatform")
        platform.position = CGPoint(x: GKRandomDistribution(lowestValue: 70, highestValue: 700).nextInt(), y: GKRandomDistribution(lowestValue: 1350, highestValue: 1550).nextInt() + Int(player.position.y))
        platform.zPosition = 5
        platform.setScale(0.4)
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
    
    func gameOver() {
        
        let gameOverscene = DoodleGameOverScene(size: self.size)
        let transition = SKTransition.crossFade(withDuration: 0.5)
        
        view?.presentScene(gameOverscene, transition: transition)
    }
}
