//
//  DifficultySelection.swift
//  Ball Records!
//
//  Created by Monica Gaiga on 04/01/16.
//  Copyright (c) 2016 Monica Gaiga. All rights reserved.
//

import UIKit
import SpriteKit
import GoogleMobileAds


class DifficultyScene: SKScene, SKPhysicsContactDelegate {
    
    var interstitial: GADInterstitial!
    
    var Ground = SKSpriteNode()
    var Ground2 = SKSpriteNode()
    var Ground3 = SKSpriteNode()
    var home = SKSpriteNode()
    var easy = SKSpriteNode()
    var normale = SKSpriteNode()
    var hard = SKSpriteNode()
    
    func createScene(){
        
        self.physicsWorld.contactDelegate = self
        
        backgroundColor = SKColor(red:85/225.0, green:185/255.0, blue:195/225.0, alpha:1.0)
                
        Ground3 = SKSpriteNode(imageNamed: "Titolo")
        Ground3.position = CGPoint(x: 0 + self.frame.width / 2, y: 360 + self.frame.height / 2)
        Ground3.setScale(0.5)
        Ground3.physicsBody?.affectedByGravity = false
        Ground3.physicsBody?.dynamic = false
        Ground3.zPosition = 2
        
        self.addChild(Ground3)
        
        
        Ground2 = SKSpriteNode(imageNamed: "Ground")
        Ground2.position = CGPoint(x: 0 + self.frame.width / 2, y: 335 + self.frame.height / 2)
        Ground2.setScale(0.5)
        Ground2.physicsBody?.affectedByGravity = false
        Ground2.physicsBody?.dynamic = false
        Ground2.zPosition = 1
        
        self.addChild(Ground2)
        
        
        Ground = SKSpriteNode(imageNamed: "Ground")
        Ground.position = CGPoint(x: 0 + self.frame.width / 2, y: -320 + self.frame.height / 2 )
        Ground.setScale(0.5)
        Ground.physicsBody?.affectedByGravity = false
        Ground.physicsBody?.dynamic = false
        Ground.zPosition = 1
        
        self.addChild(Ground)
        
        Ground = SKSpriteNode(imageNamed: "Ground")
        Ground.position = CGPoint(x: -0 + self.frame.width / 2, y: -358 + self.frame.height / 2 )
        Ground.size = CGSize(width: 600, height: 65)
        Ground.physicsBody?.affectedByGravity = false
        Ground.physicsBody?.dynamic = false
        Ground.zPosition = 0
        
        self.addChild(Ground)
        
        HomeBTN()
        EasyBTN()
        NormaleBTN()
        HardBTN()
        
    }
    
    func HomeBTN(){
        
        home = SKSpriteNode(imageNamed: "Tastohome")
        home.size = CGSize(width: 60, height: 50)
        home.position = CGPoint(x: 170 + self.frame.width / 2 , y: self.frame.height / 2 + 280)
        home.zPosition = 4
        
        self.addChild(home)
        
    }
    
    func EasyBTN(){
        
        easy = SKSpriteNode(imageNamed: "EasyD")
        easy.size = CGSize(width: 520, height: 205)
        easy.position = CGPoint(x: 0 + self.frame.width / 2 , y: 210 + self.frame.height / 2)
        easy.zPosition = 3
        
        self.addChild(easy)
        
    }
    
    func NormaleBTN(){
        
        normale = SKSpriteNode(imageNamed: "NormalD")
        normale.size = CGSize(width: 520, height: 205)
        normale.position = CGPoint(x: 0 + self.frame.width / 2 , y: +10 + self.frame.height / 2)
        normale.zPosition = 3
        
        self.addChild(normale)
        
    }
    
    func HardBTN(){
        
        hard = SKSpriteNode(imageNamed: "HardD")
        hard.size = CGSize(width: 520, height: 205)
        hard.position = CGPoint(x: 0 + self.frame.width / 2 , y: -193 + self.frame.height / 2)
        hard.zPosition = 3
        
        self.addChild(hard)
        
    }
    
    override func didMoveToView(view: SKView){
                
        createScene()
        
    }
    
    func didBeginContact(contact: SKPhysicsContact){
    }
    
    override func touchesBegan(touches: Set<UITouch>, withEvent event: UIEvent?){
        
        for touch in touches{
            
            let location = touch.locationInNode(self)
            
            if self.nodeAtPoint(location) == self.home {
                
                let gameScene = HomeScene(fileNamed:"GameScene")
                gameScene!.scaleMode = SKSceneScaleMode.AspectFill
                self.scene!.view?.presentScene(gameScene)
                
            }
            
            if self.nodeAtPoint(location) == self.easy {
                
                let gameScene = GameScene(fileNamed:"GameScene")
                gameScene!.scaleMode = SKSceneScaleMode.AspectFill
                self.scene!.view?.presentScene(gameScene)
                
            }
            
            if self.nodeAtPoint(location) == self.normale {
                
                let gameScene = GameSceneNormal(fileNamed:"GameScene")
                gameScene!.scaleMode = SKSceneScaleMode.AspectFill
                self.scene!.view?.presentScene(gameScene)
                
            }
            
            if self.nodeAtPoint(location) == self.hard {
                
                let gameScene = GameSceneHard(fileNamed:"GameScene")
                gameScene!.scaleMode = SKSceneScaleMode.AspectFill
                self.scene!.view?.presentScene(gameScene)
                
            }
        }
    }
    
    override func update(currentTime: CFTimeInterval){
    }
    
}