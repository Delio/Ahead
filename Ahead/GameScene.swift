//
//  GameScene.swift
//  Ahead
//
//  Created by Adel Salikhov on 29/04/2019.
//  Copyright © 2019 Adel Salikhov. All rights reserved.
//

import SpriteKit
import GameplayKit

class GameScene: SKScene {
    
    @IBOutlet var myView: SKView!
    
    var cam: SKCameraNode?
    //var player: SKSpriteNode!
    let player = Player()
    var selectedNode = SKSpriteNode()
    var groundArray = [SKSpriteNode]()
    
    
    
    
    //private var spinnyNode : SKShapeNode?
    private var lastUpdateTime : TimeInterval = 1
    
    override func sceneDidLoad() {
        
    }
    override func didMove(to view: SKView) {
        sceneSettings()
        super.didMove(to: view)
        cam = SKCameraNode()
        self.camera = cam
        self.addChild(cam!)
    }
        
    func sceneSettings() {
        
        addEnvironment()
        startOptions()
        
       
    }
    func degToRad(degree: Double) -> CGFloat {
        return CGFloat(degree / 180.0 * M_PI)
    }
    
    func selectNodeForTouch(touchLocation : CGPoint) {
        // 1
        let touchedNode = self.atPoint(touchLocation)
        
        if touchedNode is SKSpriteNode {
            // 2
            if !selectedNode.isEqual(touchedNode) {
                selectedNode.removeAllActions()
                selectedNode.run(SKAction.rotate(toAngle: 0.0, duration: 0.1))
                selectedNode.run(SKAction.setTexture(TestTexture))
                
                selectedNode = touchedNode as! SKSpriteNode
                
                 //3
            if ((touchedNode.name?.range(of: "squareGround")) != nil) {
                let sequence = SKAction.sequence([SKAction.setTexture(TestTextureChoose),
                                                  SKAction.rotate(byAngle: degToRad(degree: -14.0), duration: 0.1),
                                                  SKAction.rotate(byAngle: 0.0, duration: 0.1),
                                                  SKAction.rotate(byAngle: degToRad(degree: 14.0), duration: 0.1),
                                                  SKAction.removeFromParent() ])
                selectedNode.run(SKAction.repeatForever(sequence))
            }

//            if touchedNode.name! == "squareGround" {
//                    let sequence = SKAction.sequence([SKAction.rotate(byAngle: degToRad(degree: -7.0), duration: 0.1),
//                                                      SKAction.rotate(byAngle: 0.0, duration: 0.1),
//                                                      SKAction.rotate(byAngle: degToRad(degree: 7.0), duration: 0.1)])
//                    selectedNode.run(SKAction.repeatForever(sequence))
//                }
            }
        }
    }
    

    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        /* Called when a touch begins */
        for touch in touches {
        let location = touch.location(in: self)
        let positionInScene = touch.location(in: self)
            selectNodeForTouch(touchLocation: location)
        //addCircleTouch(point: location)
        }
//        for touch in touches {
//            let location = touch.location(in: self)
        
//           addCircleTouch(point: location)
//        }
    }
    


}
