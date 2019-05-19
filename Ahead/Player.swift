//
//  Player.swift
//  Ahead
//
//  Created by Adel Salikhov on 18/05/2019.
//  Copyright © 2019 Adel Salikhov. All rights reserved.
//

import Foundation
import  SpriteKit


class Player: SKSpriteNode {
    //MARK: - Init
    init() {
        let playerSize = CGSize(width: 31, height: 31)
        super.init(texture: Circle, color: .red, size: playerSize)
        setup()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    //MARK: - Setup
    func setup() {
        name = "player"
        physicsBody = SKPhysicsBody(circleOfRadius: frame.size.width / 2)
        position = CGPoint(x: 200, y: 200)
    }
}
