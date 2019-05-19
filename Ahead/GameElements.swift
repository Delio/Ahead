//
//  GameElements.swift
//  Ahead
//
//  Created by Adel Salikhov on 04/05/2019.
//  Copyright © 2019 Adel Salikhov. All rights reserved.
//

import SpriteKit



extension GameScene {
    
    func startOptions() {
        
        
        scene?.anchorPoint = CGPoint(x: 0.0, y: 0.0)
        self.backgroundColor = #colorLiteral(red: 0.2549019754, green: 0.2745098174, blue: 0.3019607961, alpha: 1)
        scene?.physicsWorld.gravity = .init(dx: 0, dy: -9.8)
        self.physicsWorld.contactDelegate = self; //where self is a current scene
       
    }
    
    func addEnvironment() {
        let mainFloor = SKSpriteNode(color: .green, size: CGSize(width: 600, height: 20))
        mainFloor.color = SKColor.green

        mainFloor.name = "mainFloor"
        mainFloor.position = CGPoint(x: 0, y: -180)
        mainFloor.physicsBody = SKPhysicsBody(rectangleOf: mainFloor.size)
        mainFloor.physicsBody?.isDynamic = false
        //let action = SKAction.rotate(byAngle: CGFloat(M_PI), duration:1)
        //mainFloor.physicsBody?.categoryBitMask = CollisionBitMask.mainFloor
        //mainFloor.physicsBody?.contactTestBitMask = CollisionBitMask.player | CollisionBitMask.mainFloor
        //mainFloor.physicsBody?.collisionBitMask = CollisionBitMask.ground | CollisionBitMask.player
        // mainFloor.run(SKAction.repeatForever(action))

        self.addChild(mainFloor)
        
        //var xCoord = -160.0 //x start coordinate square
        //var yCoord = -154.0 //y start coordinate square
        
        var xCoord = -282.0 //x start coordinate square
        var yCoord = -154.0 //y start coordinate square

        for square in 1...100 {
            let squareGround = SKSpriteNode(texture: TestTexture)
            //let squareGround = SKSpriteNode(color: .red, size: CGSize(width: 32, height: 32))
            squareGround.anchorPoint = CGPoint(x: 0.5, y: 0.5)
            squareGround.name = "squareGround" + "_" + "\(square)" //marking our blocks
            squareGround.physicsBody = SKPhysicsBody(rectangleOf: squareGround.size)
            squareGround.position = CGPoint(x: xCoord, y: yCoord)
            squareGround.isHidden = false

            squareGround.physicsBody?.isDynamic = false
            squareGround.physicsBody?.mass = 10
            //squareGround.physicsBody?.categoryBitMask = CollisionBitMask.ground
            //squareGround.physicsBody?.contactTestBitMask = CollisionBitMask.player | CollisionBitMask.ground
            //squareGround.physicsBody?.collisionBitMask = CollisionBitMask.ground | CollisionBitMask.player | CollisionBitMask.mainFloor
            squareGround.physicsBody?.collisionBitMask = CollisionBitMask.ground | CollisionBitMask.player | CollisionBitMask.mainFloor
            self.addChild(squareGround)

            let divideCom =  square % 18
            if divideCom == 0 {
                xCoord = -282
                yCoord += 32
            } else {
                xCoord += 32.0
            }
        }
        
        addChild(player)
        player.position.x = size.width / 2
        player.position.y = size.height / 2
        //let player = SKShapeNode(circleOfRadius: 50)
//        let player = SKSpriteNode(texture: Circle)
//        //touchCircle.xScale = 0.5
//        //touchCircle.yScale = 0.5
//        player.position = CGPoint(x: 0, y: 200)
//        player.name = "player"
//        player.scale(to: CGSize(width: 31, height: 31))
//        //player.fillColor = .green
//
//        //        touchCircle.physicsBody = SKPhysicsBody(rectangleOf: touchCircle.)
//        //touchCircle.physicsBody = SKPhysicsBody(circleOfRadius: touchCircle.size.width / 2)
//        player.physicsBody = SKPhysicsBody(circleOfRadius: player.frame.size.width / 2)
//        player.physicsBody?.isDynamic = false
//        //touchCircle.physicsBody?.categoryBitMask = CollisionBitMask.touchCircle
//        //touchCircle.physicsBody?.contactTestBitMask = 0b1
//        player.physicsBody?.mass = 100
//
//        player.physicsBody?.categoryBitMask = CollisionBitMask.player
//        player.physicsBody?.contactTestBitMask = CollisionBitMask.ground | CollisionBitMask.player  //register contact between player and ground
////        player.physicsBody?.collisionBitMask = CollisionBitMask.ground | CollisionBitMask.player | CollisionBitMask.mainFloor
//        
//
//        let action = SKAction.rotate(byAngle: CGFloat(M_PI), duration:1)
//        self.addChild(player)
        upButton()
        downButton()
        rightButton()
        leftButton()
        scene?.enumerateChildNodes(withName: "player") {
            (node, stop) in
            self.scene?.camera?.move(toParent: node)
        }
    }
    
    func upButton() {
        let upButton = UIButton(frame: CGRect(x: 470, y: 200, width: 100, height: 50))
        upButton.tag = 129
        upButton.backgroundColor = .red
        upButton.setTitle("UP button", for: .normal)
        upButton.addTarget(self, action: #selector(upButtonAction), for: .touchUpInside)

        self.view?.addSubview(upButton)
    }
    
    @objc func upButtonAction() {
        self.camera?.position.y += 10
        print("test")
    }
    
    func downButton() {
        let downButton = UIButton(frame: CGRect(x: 470, y: 250, width: 100, height: 50))
        downButton.tag = 129
        downButton.backgroundColor = .red
        downButton.setTitle("Down button", for: .normal)
        downButton.addTarget(self, action: #selector(downButtonAction), for: .touchUpInside)
        self.view?.addSubview(downButton)
    }
    
    @objc func downButtonAction() {
        self.camera?.position.y -= 10
    }
    
    func rightButton() {
        let rightButton = UIButton(frame: CGRect(x: 600, y: 250, width: 100, height: 50))
        rightButton.tag = 129
        rightButton.backgroundColor = .green
        rightButton.setTitle("Down button", for: .normal)
        rightButton.addTarget(self, action: #selector(rightButtonAction), for: .touchUpInside)
        self.view?.addSubview(rightButton)
    }
    
    @objc func rightButtonAction() {
        scene?.enumerateChildNodes(withName: "player") {
            (node, stop) in
            if node.physicsBody?.isDynamic == true {
            node.physicsBody?.isDynamic = false
            } else {
                node.physicsBody?.isDynamic = true
            }
        }
    }
    
    func leftButton() {
        let leftButton = UIButton(frame: CGRect(x: 400, y: 250, width: 100, height: 50))
        leftButton.tag = 129
        leftButton.backgroundColor = .green
        leftButton.setTitle("Left button", for: .normal)
        leftButton.addTarget(self, action: #selector(leftButtonAction), for: .touchUpInside)
        self.view?.addSubview(leftButton)
    }
    
    @objc func leftButtonAction() {
        scene?.enumerateChildNodes(withName: "player") {
            (node, stop) in
           
            
            //let fadeOut = SKAction.fadeOut(withDuration:2)
            //let fadeOut = SKAction.applyAngularImpulse(CGFloat(integerLiteral: 60), duration: 1) //figures go
//            var dx = cosf(Float(self.degToRad(degree: 0.0)))
//            var dy = sinf(Float(self.degToRad(degree: 180.0)))
            var dx = 0.0
            var dy = 90.0

            var rotation: CGFloat = 1
            let xVec: CGFloat = sin(rotation) * -10
            let yVec: CGFloat = cos(rotation) * 10
            let vector: CGVector = CGVector(dx: dx, dy: dy)
            //node.physicsBody?.applyImpulse(vector)
            node.physicsBody?.applyForce(CGVector(dx: 0, dy: 160))
            //node.position.x -= 10
            //let fadeOut = SKAction.move(by: vector, duration: 10)
            // let fadeOut = SKAction.applyForce(CGVector(dx: 0, dy: 160))
            //self.scene?.camera?.move(toParent: node)
            //node.position = CGPoint(x: 100, y: 100)
            //node.physicsBody?.applyImpulse(CGVector(dx: 0, dy: 100))
            //let fadeOut = SKAction.applyForce(CGVector(dx: 0, dy: 300), duration: 10)
            //let fadeOut = SKAction.resize(toWidth: 400, height: 400, duration: 2)
            //let fadeOut = SKAction.resize(toWidth: 50, height: 50, duration: 2)
            //node.physicsBody?.applyImpulse(CGVector(dx: dx, dy: dy))
            //node.physicsBody?.applyImpulse(CGVector(dx: 0, dy: 100))
            print("Forced")
            //node.run(fadeOut)
            //node.run(SKAction.hide())
        }
    }
}

extension GameScene: SKPhysicsContactDelegate {
    func didBegin(_ contact: SKPhysicsContact) {
        let hitDot_1 = contact.bodyA.node
        let hitDot_2 = contact.bodyB.node
        if hitDot_1?.name == "mainFloor" {
            return
        }
        if hitDot_1?.name == hitDot_1?.name && hitDot_2?.name == "player" {
       // if hitDot_1.name == "squareGround" || hitDot_2.name == "player" {
            print("find")
            //scene?.enumerateChildNodes(withName: "squareGround") {(node, stop) in
            guard let changeNodename = hitDot_1?.name else { return }
            //scene?.enumerateChildNodes(withName: "*squareGround*") {
            scene?.enumerateChildNodes(withName: changeNodename) {
                (node, stop) in
                
                let fadeOut = SKAction.removeFromParent()
                print(node.name)
                node.run(fadeOut)
            }
        }
    }
}
    

