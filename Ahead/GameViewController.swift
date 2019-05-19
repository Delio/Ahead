//
//  GameViewController.swift
//  Ahead
//
//  Created by Adel Salikhov on 29/04/2019.
//  Copyright © 2019 Adel Salikhov. All rights reserved.
//

import UIKit
import SpriteKit
import GameplayKit

class GameViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        if let view = self.view as! SKView? {
            // Load the SKScene from 'GameScene.sks'
            if let scene = SKScene(fileNamed: "GameScene") {
                // Set the scale mode to scale to fit the window
                //scene.scaleMode = .aspectFill

                // Present the scene
                view.presentScene(scene)
            }

            view.ignoresSiblingOrder = true
            view.showsPhysics = true
            view.showsDrawCount = true

            view.showsFPS = true
            view.showsNodeCount = true
        }
    }


}
