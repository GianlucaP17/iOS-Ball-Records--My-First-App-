//
//  GameScene.swift
//  Ball Records!
//
//  Created by Monica Gaiga on 04/01/16.
//  Copyright (c) 2016 Monica Gaiga. All rights reserved.
//


import SpriteKit
import UIKit

class HomeScene: SKScene, SKPhysicsContactDelegate {
    
    var Ground = SKSpriteNode()
    var Ground2 = SKSpriteNode()
    var Ground3 = SKSpriteNode()
    var play = SKSpriteNode()
    var shopBTN = SKSpriteNode()
    var rscorBTN = SKSpriteNode()
    var diffBTN = SKSpriteNode()
    var tkeyBTN = SKSpriteNode()
    var getkeyBTN = SKSpriteNode()  
    var hg = SKLabelNode()
    var scoreLbl = SKLabelNode()
    var keyl = SKLabelNode()
    
    var keymore = MyVariables.keymore

    
    var key1 = NSUserDefaults.standardUserDefaults().integerForKey("highscore")
    
    func createScene(){
        
        let punteggio = NSUserDefaults.standardUserDefaults().integerForKey("lastscore")
        
        self.physicsWorld.contactDelegate = self
        
        backgroundColor = SKColor(red:85/225.0, green:185/255.0, blue:195/225.0, alpha:1.0)
                
        let Palla = SKSpriteNode(imageNamed: "PallaHome")
        Palla.position = CGPointMake(0 + self.frame.width / 2, 0 + self.frame.height / 2)
        Palla.setScale(0.7)
        Palla.zPosition = 1
        self.addChild(Palla)
        
        let Nuvolagrande = SKSpriteNode(imageNamed: "NuvolaGrande")
        Nuvolagrande.position = CGPointMake( -100 + self.size.width/2, +140 + self.size.height/2)
        Nuvolagrande.setScale(0.3)
        Nuvolagrande.zPosition = 1
        self.addChild(Nuvolagrande)
        
        let Nuvola = SKSpriteNode(imageNamed: "Nuvola")
        Nuvola.position = CGPointMake( +100 + self.size.width/2, -100 + self.size.height/2)
        Nuvola.setScale(0.3)
        Nuvola.zPosition = 1
        self.addChild(Nuvola)
        
        let casaImage = SKSpriteNode(imageNamed: "Casa")
        casaImage.position = CGPointMake( 0 + self.size.width/2, -260 + self.size.height/2)
        casaImage.setScale(0.05)
        casaImage.zPosition = 1
        self.addChild(casaImage)
        
        hg = SKLabelNode(fontNamed: "Noteworthy")
        hg.text = "Last Score:"
        hg.fontSize = 25
        hg.zPosition = 2
        hg.position = CGPoint(x: 0 + self.frame.width / 2, y: 50 + self.frame.height / 2)
        
        self.addChild(hg)
        
        keyl = SKLabelNode(fontNamed: "Noteworthy")
        keyl.position = CGPoint(x: 8 + self.frame.width / 2, y: +245 + self.frame.height / 2)
        keyl.fontColor = UIColor.blackColor()
        keyl.text = "\(key1)"
        keyl.fontSize = 25
        keyl.zPosition = 8
        
        self.addChild(keyl)
        
        scoreLbl = SKLabelNode(fontNamed: "Noteworthy")
        scoreLbl.position = CGPoint(x: 0 + self.frame.width / 2, y: -10 + self.frame.height / 2)
        scoreLbl.fontColor = UIColor.redColor()
        scoreLbl.text = "\(punteggio)"
        scoreLbl.fontSize = 30
        scoreLbl.zPosition = 2
        
        self.addChild(scoreLbl)
        
        Ground3 = SKSpriteNode(imageNamed: "Titolo")
        Ground3.position = CGPoint(x: 0 + self.frame.width / 2, y: 360 + self.frame.height / 2)
        Ground3.setScale(0.5)
        Ground3.physicsBody?.affectedByGravity = false
        Ground3.physicsBody?.dynamic = false
        Ground3.zPosition = 2
        
        self.addChild(Ground3)
        
        Ground2 = SKSpriteNode(imageNamed: "Ground")
        Ground2.position = CGPoint(x: 0 + self.frame.width / 2, y: 340 + self.frame.height / 2)
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
        
        PlayBTN()
        ShopBTN()
        RecentScorBTN()
        DiffBTN()
        TkeyBTN()
        GetkeyBTN()
        
    }
    
    func PlayBTN(){
        
        play = SKSpriteNode(imageNamed: "Play")
        play.size = CGSize(width: 120, height: 65)
        play.position = CGPoint(x: self.frame.width / 2 , y: self.frame.height / 2 + 100)
        play.zPosition = 3
        
        self.addChild(play)
        
    }
    
    func ShopBTN(){
        
        shopBTN = SKSpriteNode(imageNamed: "Shop")
        shopBTN.size = CGSize(width: 120, height: 70)
        shopBTN.position = CGPoint(x: self.frame.width / 2 + 150, y: self.frame.height / 2 - 250)
        shopBTN.zPosition = 7
        
        self.addChild(shopBTN)
        
    }
    
    func RecentScorBTN(){
        
        rscorBTN = SKSpriteNode(imageNamed: "Recentlyscore")
        rscorBTN.size = CGSize(width: 120, height: 70)
        rscorBTN.position = CGPoint(x: self.frame.width / 2 - 150, y: self.frame.height / 2 - 250)
        rscorBTN.zPosition = 7
        
        self.addChild(rscorBTN)
        
    }
    
    func DiffBTN (){
        
        diffBTN = SKSpriteNode(imageNamed: "Difficulty")
        diffBTN.size = CGSize(width: 120, height: 70)
        diffBTN.position = CGPoint(x: self.frame.width / 2 - 150, y: self.frame.height / 2 + 270)
        diffBTN.zPosition = 7
        
        self.addChild(diffBTN)
        
    }
    
    func TkeyBTN(){
        
        tkeyBTN = SKSpriteNode(imageNamed: "TotKeys")
        tkeyBTN.size = CGSize(width: 120, height: 70)
        tkeyBTN.position = CGPoint(x: self.frame.width / 2 , y: self.frame.height / 2 + 270)
        tkeyBTN.zPosition = 7
        
        self.addChild(tkeyBTN)
        
    }
    
    func GetkeyBTN(){
        
        getkeyBTN = SKSpriteNode(imageNamed: "Getkey")
        getkeyBTN.size = CGSize(width: 120, height: 70)
        getkeyBTN.position = CGPoint(x: self.frame.width / 2 + 150, y: self.frame.height / 2 + 270)
        getkeyBTN.zPosition = 7
        
        self.addChild(getkeyBTN)
        
    }
    
    override func didMoveToView(view: SKView){
                
        createScene()
        
    }
    
    func didBeginContact(contact: SKPhysicsContact){
    }
    
    override func touchesBegan(touches: Set<UITouch>, withEvent event: UIEvent?){
        
        for touch in touches{
            
            let location = touch.locationInNode(self)
            
            if self.nodeAtPoint(location) == self.play {
                
                let gameScene = GameSceneNormal(fileNamed:"GameScene")
                gameScene!.scaleMode = SKSceneScaleMode.AspectFill
                self.scene!.view?.presentScene(gameScene)
                
            }
            
            if self.nodeAtPoint(location) == self.shopBTN {
                
                let gameScene = HomeShop(fileNamed:"GameScene")
                gameScene!.scaleMode = SKSceneScaleMode.AspectFill
                self.scene!.view?.presentScene(gameScene)
                
            }
            
            if self.nodeAtPoint(location) == self.diffBTN {
                
                let gameScene = DifficultyScene(fileNamed:"GameScene")
                gameScene!.scaleMode = SKSceneScaleMode.AspectFill
                self.scene!.view?.presentScene(gameScene)
                
            }
            
            if self.nodeAtPoint(location) == self.getkeyBTN {
                    
                NSNotificationCenter.defaultCenter().postNotificationName("internetCheck", object: self)
                
                if (NSUserDefaults.standardUserDefaults().boolForKey("internet")) {
                
                NSNotificationCenter.defaultCenter().postNotificationName("showid", object: self)
                    
                    if keymore == true {
                
                key1 += 1
                
                keyl.text = "\(key1)"
                
                NSUserDefaults.standardUserDefaults().integerForKey("highscore")
                NSUserDefaults.standardUserDefaults().setInteger(key1, forKey: "highscore")
                NSUserDefaults.standardUserDefaults().synchronize()
                
                    
                print("highscore:", NSUserDefaults.standardUserDefaults().integerForKey("highscore"))
                        
                    }
                }
                
            }
            
            if self.nodeAtPoint(location) == self.tkeyBTN {
                
                /*
                
                key1 -= 2
                
                keyl.text = "\(key1)"
                
                guard key1 > 1 else {
                    key1 = 0
                    keyl.text = "\(key1)"
                    
                    NSUserDefaults.standardUserDefaults().integerForKey("highscore")
                    NSUserDefaults.standardUserDefaults().setInteger(key1, forKey: "highscore")
                    NSUserDefaults.standardUserDefaults().synchronize()
                    
                    print("highscore:", NSUserDefaults.standardUserDefaults().integerForKey("highscore"))
                    
                    return
                }
                
                NSUserDefaults.standardUserDefaults().integerForKey("highscore")
                NSUserDefaults.standardUserDefaults().setInteger(key1, forKey: "highscore")
                NSUserDefaults.standardUserDefaults().synchronize()
                
                
                print("highscore:", NSUserDefaults.standardUserDefaults().integerForKey("highscore"))
                
                */      

            }
        
            if self.nodeAtPoint(location) == self.rscorBTN {
                
                NSNotificationCenter.defaultCenter().postNotificationName("gamecenter", object: self)
                
            }
            
        }
    }
    
    override func update(currentTime: CFTimeInterval){
        
    }
    
}
