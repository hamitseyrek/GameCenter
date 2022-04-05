//
//  DoodleStartScene.swift
//  GameCenter
//
//  Created by Hamit Seyrek on 5.04.2022.
//

import Foundation
import SpriteKit
import GameKit

class DoodleStartScene1: SKScene {
    
    override func didMove(to view: SKView) {
        
         self.size = CGSize(width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height)
        scene?.scaleMode = .aspectFill
    }
}
