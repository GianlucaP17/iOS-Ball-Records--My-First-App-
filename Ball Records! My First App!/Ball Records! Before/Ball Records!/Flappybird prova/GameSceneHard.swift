//
//  GameSceneHard.swift
//  Ball Records!
//
//  Created by Monica Gaiga on 04/01/16.
//  Copyright (c) 2016 Monica Gaiga. All rights reserved.
//

import SpriteKit
import UIKit
import GoogleMobileAds


struct PhysicsCatagoryH {
    
    static let Ghost : UInt32 = 0x1 << 1
    static let Ground : UInt32 = 0x1 << 2
    static let Wall : UInt32 = 0x1 << 3
    static let Score : UInt32 = 0x1 << 4
    static let Barre : UInt32 = 0x1 << 5
    static let Stella : UInt32 = 0x1 << 6
    
}


class GameSceneHard: SKScene, SKPhysicsContactDelegate {
    
    var interstitial: GADInterstitial!
        
    var Ground = SKSpriteNode()
    var Ghost = SKSpriteNode()
    var wallPair = SKNode()
    var Ground2 = SKSpriteNode()
    var Barre = SKNode()
    var BarreSize = SKSpriteNode()
    var gameStarted = Bool()
    var gameplay = Bool()
    var gamesecond = Bool()
    var score = Int()
    var run = Int()
    var Rcount = Int()
    var scoreLbl = SKLabelNode(fontNamed: "Noteworthy")
    var restartcount = SKLabelNode()
    var difficulty = SKLabelNode(fontNamed: "Hiragino Mincho ProN")
    var died = Bool()
    var restartBTN = SKSpriteNode()
    var menuBTN = SKSpriteNode()
    var menuBTNGame = SKSpriteNode()
    var pausa = SKSpriteNode()
    var resume = SKSpriteNode()
    var sound = SKAction.playSoundFileNamed("pop.wav", waitForCompletion: false)
    var soundground = SKAction.playSoundFileNamed("hitGround.wav", waitForCompletion: false)
    var soundstella = SKAction.playSoundFileNamed("star.wav", waitForCompletion: false)
    var tapToStart = SKLabelNode(fontNamed: "Noteworthy")
    var tapToreStart = SKLabelNode(fontNamed: "Noteworthy")
    var scoreStella = SKLabelNode(fontNamed: "Noteworthy")
    var Stella = SKNode()
    var StellaSize = SKSpriteNode()
    var key1 = NSUserDefaults.standardUserDefaults().integerForKey("highscore")
    var keyl = SKLabelNode()
    var tkeyBTN = SKSpriteNode()
    var replay = SKSpriteNode()
    var Palla = SKSpriteNode()
    var or = SKLabelNode()
    
    
    var background1 = SKSpriteNode()
    var background2 = SKSpriteNode()
    var background3 = SKSpriteNode()
    var background4 = SKSpriteNode()
    var background5 = SKSpriteNode()
    var background6 = SKSpriteNode()
    var background7 = SKSpriteNode()
    var background8 = SKSpriteNode()
    var background9 = SKSpriteNode()
    var background10 = SKSpriteNode()
    var background11 = SKSpriteNode()
    var background12 = SKSpriteNode()
    var background13 = SKSpriteNode()
    var background14 = SKSpriteNode()
    var background15 = SKSpriteNode()
    var background16 = SKSpriteNode()
    var background17 = SKSpriteNode()
    var background18 = SKSpriteNode()
    var bgImage = SKSpriteNode()
    
    var moveAndRemove = SKAction()
    var moveAndRemove1 = SKAction()
    var moveAndRemove2 = SKAction()
    var moveAndRemove3 = SKAction()
    var moveAndRemove4 = SKAction()
    var moveAndRemove1D = SKAction()
    var moveAndRemove2D = SKAction()
    var moveAndRemove3D = SKAction()
    var moveAndRemove4D = SKAction()
    var moveAndRemove1S = SKAction()
    var moveAndRemove2S = SKAction()
    var moveAndRemove3S = SKAction()
    
    var moveAndRemoveS = SKAction()
    var moveAndRemoveS1 = SKAction()
    var moveAndRemoveS2 = SKAction()

    
    func restartScene(){
        
        self.removeAllChildren()
        self.removeAllActions()
        died = false
        gameStarted = false
        gameplay = false
        score = 0
        run = 0
        Rcount = 0
        self.physicsWorld.speed = 1.0
        self.speed = 1.0
        createScene()
        
    }
    
    
    func replayScene(){
        
        self.replay.hidden = true
        self.keyl.hidden = true
        self.tkeyBTN.hidden = true
        self.restartBTN.hidden = true
        self.pausa.hidden = true
        self.menuBTN.hidden = true
        self.menuBTNGame.hidden = true
        self.or.hidden = true
        self.Palla.hidden = true
        self.restartcount.hidden = true
        difficulty.hidden = true
        gameplay = true
        gamesecond = false
        
        if Ghost.position.y >= pausa.position.y {
            
            Ghost.position = CGPointMake(Ghost.position.x, Ghost.position.y - 80)
            
        }
        
        self.tapToreStart.hidden = false
        
        
    }
    
    func replayScene2(){
        
        self.replay.hidden = true
        self.keyl.hidden = true
        self.tkeyBTN.hidden = true
        self.restartBTN.hidden = true
        self.pausa.hidden = true
        self.menuBTN.hidden = true
        self.menuBTNGame.hidden = true
        self.difficulty.hidden = true
        self.scene!.paused = false
        self.gamesecond = false
        self.Palla.hidden = true
        self.or.hidden = true
        self.restartcount.hidden = true
        
        
        if Ghost.position.y >= pausa.position.y {
            
            Ghost.position = CGPointMake(Ghost.position.x, Ghost.position.y - 80)
            
        }
        
        self.tapToreStart.hidden = false
        
        
    }
    
    func background(){
        
        if ((NSUserDefaults.standardUserDefaults().objectForKey("BG")) != nil){
            
            background1 = SKSpriteNode(imageNamed: "Background01n")
            background2 = SKSpriteNode(imageNamed: "Background02n")
            background3 = SKSpriteNode(imageNamed: "Background03n")
            background4 = SKSpriteNode(imageNamed: "Background04n")
            background5 = SKSpriteNode(imageNamed: "Background05n")
            background6 = SKSpriteNode(imageNamed: "Background06n")
            background7 = SKSpriteNode(imageNamed: "Background07n")
            background8 = SKSpriteNode(imageNamed: "Background08n")
            background9 = SKSpriteNode(imageNamed: "Background09n")
            background10 = SKSpriteNode(imageNamed: "Background10n")
            background11 = SKSpriteNode(imageNamed: "Background11n")
            background12 = SKSpriteNode(imageNamed: "Background12n")
            background13 = SKSpriteNode(imageNamed: "Background13n")
            background14 = SKSpriteNode(imageNamed: "Background14n")
            background15 = SKSpriteNode(imageNamed: "Background15n")
            background16 = SKSpriteNode(imageNamed: "Background16n")
            background17 = SKSpriteNode(imageNamed: "Backgroundcn")
            background18 = SKSpriteNode(imageNamed: "Backgroundc1")
            
            bgImage = SKSpriteNode(imageNamed: "Sfondo2")
            
            
            background8.anchorPoint = CGPointZero
            background8.size = CGSize(width: 600, height: 200)
            background8.position = CGPoint(x: -300 + self.frame.width / 2, y: self.frame.height / 2 + 1038)
            background8.zPosition = -15
            background8.setScale(1.0)
            self.addChild(background8)
            
            background7.anchorPoint = CGPointZero
            background7.size = CGSize(width: 600, height: 200)
            background7.position = CGPoint(x: -300 + self.frame.width / 2, y: self.frame.height / 2 + 840)
            background7.zPosition = -15
            background7.setScale(1.0)
            self.addChild(background7)
            
            background6.anchorPoint = CGPointZero
            background6.size = CGSize(width: 600, height: 200)
            background6.position = CGPoint(x: -300 + self.frame.width / 2, y: self.frame.height / 2 + 643)
            background6.zPosition = -15
            background6.setScale(1.0)
            self.addChild(background6)
            
            background5.anchorPoint = CGPointZero
            background5.size = CGSize(width: 600, height: 200)
            background5.position = CGPoint(x: -300 + self.frame.width / 2, y: self.frame.height / 2 + 445)
            background5.zPosition = -15
            background5.setScale(1.0)
            self.addChild(background5)
            
            background4.anchorPoint = CGPointZero
            background4.size = CGSize(width: 600, height: 200)
            background4.position = CGPoint(x: -300 + self.frame.width / 2, y: self.frame.height / 2 + 248)
            background4.zPosition = -15
            background4.setScale(1.0)
            self.addChild(background4)
            
            background3.anchorPoint = CGPointZero
            background3.size = CGSize(width: 600, height: 200)
            background3.position = CGPoint(x: -300 + self.frame.width / 2, y: self.frame.height / 2 + 50)
            background3.zPosition = -15
            background3.setScale(1.0)
            self.addChild(background3)
            
            background2.anchorPoint = CGPointZero
            background2.size = CGSize(width: 600, height: 200)
            background2.position = CGPoint(x: -300 + self.frame.width / 2, y: self.frame.height / 2 - 122)
            background2.zPosition = -15
            background2.setScale(1.0)
            self.addChild(background2)
            
            background1.anchorPoint = CGPointZero
            background1.size = CGSize(width: 600, height: 200)
            background1.position = CGPoint(x: -300 + self.frame.width / 2, y: self.frame.height / 2 - 320)
            background1.zPosition = -15
            self.addChild(background1)
            
            bgImage.size = CGSize(width: 1000, height: 1000)
            bgImage.position = CGPointMake(self.size.width/2, self.size.height/2)
            bgImage.zPosition = -16
            self.addChild(bgImage)
            
        }
        
        if !((NSUserDefaults.standardUserDefaults().objectForKey("BG")) != nil){
            
            background1 = SKSpriteNode(imageNamed: "Backgrounds01")
            background2 = SKSpriteNode(imageNamed: "Backgrounds02")
            background3 = SKSpriteNode(imageNamed: "Backgrounds03")
            background4 = SKSpriteNode(imageNamed: "Backgrounds04")
            background5 = SKSpriteNode(imageNamed: "Backgrounds05")
            background6 = SKSpriteNode(imageNamed: "Backgrounds06")
            background7 = SKSpriteNode(imageNamed: "Backgrounds07")
            background8 = SKSpriteNode(imageNamed: "Backgrounds08")
            background9 = SKSpriteNode(imageNamed: "Backgrounds09")
            background10 = SKSpriteNode(imageNamed: "Backgrounds10")
            background11 = SKSpriteNode(imageNamed: "Backgrounds11")
            background12 = SKSpriteNode(imageNamed: "Backgrounds12")
            background13 = SKSpriteNode(imageNamed: "Backgrounds13")
            background14 = SKSpriteNode(imageNamed: "Backgrounds14")
            background15 = SKSpriteNode(imageNamed: "Backgrounds15")
            background16 = SKSpriteNode(imageNamed: "Backgrounds12")
            background17 = SKSpriteNode(imageNamed: "Backgroundc")
            background18 = SKSpriteNode(imageNamed: "Backgroundc1")
            
            bgImage = SKSpriteNode(imageNamed: "Sfondo")
            
            
            background8.anchorPoint = CGPointZero
            background8.size = CGSize(width: 600, height: 200)
            background8.position = CGPoint(x: -300 + self.frame.width / 2, y: self.frame.height / 2 + 1038)
            background8.zPosition = -15
            background8.setScale(1.0)
            self.addChild(background8)
            
            background7.anchorPoint = CGPointZero
            background7.size = CGSize(width: 600, height: 200)
            background7.position = CGPoint(x: -300 + self.frame.width / 2, y: self.frame.height / 2 + 840)
            background7.zPosition = -15
            background7.setScale(1.0)
            self.addChild(background7)
            
            background6.anchorPoint = CGPointZero
            background6.size = CGSize(width: 600, height: 200)
            background6.position = CGPoint(x: -300 + self.frame.width / 2, y: self.frame.height / 2 + 643)
            background6.zPosition = -15
            background6.setScale(1.0)
            self.addChild(background6)
            
            background5.anchorPoint = CGPointZero
            background5.size = CGSize(width: 600, height: 200)
            background5.position = CGPoint(x: -300 + self.frame.width / 2, y: self.frame.height / 2 + 445)
            background5.zPosition = -15
            background5.setScale(1.0)
            self.addChild(background5)
            
            background4.anchorPoint = CGPointZero
            background4.size = CGSize(width: 600, height: 200)
            background4.position = CGPoint(x: -300 + self.frame.width / 2, y: self.frame.height / 2 + 248)
            background4.zPosition = -15
            background4.setScale(1.0)
            self.addChild(background4)
            
            background3.anchorPoint = CGPointZero
            background3.size = CGSize(width: 600, height: 200)
            background3.position = CGPoint(x: -300 + self.frame.width / 2, y: self.frame.height / 2 + 50)
            background3.zPosition = -15
            background3.setScale(1.0)
            self.addChild(background3)
            
            background2.anchorPoint = CGPointZero
            background2.size = CGSize(width: 600, height: 200)
            background2.position = CGPoint(x: -300 + self.frame.width / 2, y: self.frame.height / 2 - 122)
            background2.zPosition = -15
            background2.setScale(1.0)
            self.addChild(background2)
            
            background1.anchorPoint = CGPointZero
            background1.size = CGSize(width: 600, height: 200)
            background1.position = CGPoint(x: -300 + self.frame.width / 2, y: self.frame.height / 2 - 320)
            background1.zPosition = -15
            self.addChild(background1)
            
            bgImage.size = CGSize(width: 1000, height: 1000)
            bgImage.position = CGPointMake(self.size.width/2, self.size.height/2)
            bgImage.zPosition = -16
            
            
        }
    }
    
    func createScene(){
        
        self.physicsWorld.contactDelegate = self
        
        /*
        let bgImage = SKSpriteNode(imageNamed: "Sfondo")
        bgImage.position = CGPointMake(self.size.width/2, self.size.height/2)
        self.addChild(bgImage)
        */
        
        backgroundColor = SKColor.blackColor()
        
        background()
        
        createGhost()

        //scaleFactor = self.size.width / 320.0
        
        difficulty.position = CGPoint(x: self.frame.width / 2, y: self.frame.height / 2 + 250)
        difficulty.text = "Hard"
        difficulty.fontColor = UIColor.redColor()
        difficulty.fontSize = 60
        difficulty.zPosition = 5
        difficulty.hidden = false
        
        self.addChild(difficulty)
        
        tapToStart.position = CGPoint(x: self.frame.width / 2, y: self.frame.height / 2 + 100)
        tapToStart.text = "Tap To Start!"
        tapToStart.zPosition = 5
        tapToStart.hidden = false
        
        self.addChild(tapToStart)
        
        tapToreStart.position = CGPoint(x: self.frame.width / 2, y: self.frame.height / 2 + 110)
        tapToreStart.text = "Tap To Resume!"
        tapToreStart.fontSize = 40
        tapToreStart.zPosition = 7
        tapToreStart.hidden = true
        
        self.addChild(tapToreStart)
        
        scoreLbl.position = CGPoint(x: self.frame.width / 2, y: self.frame.height / 2 + self.frame.height / 2.5)
        scoreLbl.text = "\(score)"
        scoreLbl.fontColor = UIColor.redColor()
        scoreLbl.zPosition = 5
        scoreLbl.hidden = true
        
        self.addChild(scoreLbl)
        
        scoreStella.position = CGPoint(x: self.frame.width / 2, y: self.frame.height / 2 + 150)
        scoreStella.text = "+1!"
        scoreStella.zPosition = 5
        scoreStella.hidden = true
        
        self.addChild(scoreStella)
        
        Ground2 = SKSpriteNode(imageNamed: "Ground")
        Ground2.setScale(0.5)
        Ground2.position = CGPoint(x: 0 + self.frame.width / 2, y: 410 + self.frame.height / 2)
        Ground2.physicsBody = SKPhysicsBody(rectangleOfSize: Ground2.size)
        Ground2.physicsBody?.categoryBitMask = PhysicsCatagoryH.Ground
        Ground2.physicsBody?.collisionBitMask = PhysicsCatagoryH.Ghost
        Ground2.physicsBody?.contactTestBitMask  = PhysicsCatagoryH.Ghost
        Ground2.physicsBody?.affectedByGravity = false
        Ground2.physicsBody?.dynamic = false
        Ground2.zPosition = 1
        
        self.addChild(Ground2)
        
        Ground = SKSpriteNode(imageNamed: "Ground")
        Ground.setScale(0.5)
        Ground.position = CGPoint(x: 0 + self.frame.width / 2, y: -330 + self.frame.height / 2)
        Ground.physicsBody = SKPhysicsBody(rectangleOfSize: Ground.size)
        Ground.physicsBody?.categoryBitMask = PhysicsCatagory.Ground
        Ground.physicsBody?.collisionBitMask = PhysicsCatagory.Ghost
        Ground.physicsBody?.contactTestBitMask  = PhysicsCatagory.Ghost
        Ground.physicsBody?.affectedByGravity = false
        Ground.physicsBody?.dynamic = false
        Ground.zPosition = 2
        
        self.addChild(Ground)
        
        Ground = SKSpriteNode(imageNamed: "Ground")
        Ground.position = CGPoint(x: -0 + self.frame.width / 2, y: -358 + self.frame.height / 2 )
        Ground.size = CGSize(width: 600, height: 65)
        Ground.physicsBody?.affectedByGravity = false
        Ground.physicsBody?.dynamic = false
        Ground.zPosition = 1
        
        self.addChild(Ground)
        
        resume = SKSpriteNode(imageNamed: "ResumeBTNI")
        resume.size = CGSize(width: 80, height: 80)
        resume.position = CGPoint(x: self.frame.width / 2, y: self.frame.height / 2)
        resume.zPosition = 4
        resume.hidden = true
        
        self.addChild(resume)
        
        pausa = SKSpriteNode(imageNamed: "PausaBTNI")
        pausa.size = CGSize(width: 55, height: 50)
        pausa.position = CGPoint(x: self.frame.width / 2 + 170, y: self.frame.height / 2 + 320)
        pausa.zPosition = 4
        pausa.hidden = true
        
        self.addChild(pausa)
        
        menuBTNGame = SKSpriteNode(imageNamed: "Tastohome")
        menuBTNGame.size = CGSize(width: 70, height: 60)
        menuBTNGame.position = CGPoint(x: self.frame.width / 2 - 120, y: self.frame.height / 2 + 250)
        menuBTNGame.zPosition = 7
        menuBTNGame.hidden = true
        
        self.addChild(menuBTNGame)
        
    }
    
    func createGhost(){
        
        //  (circleOfRadius: Ghost.frame.height / 2 + 5)  "+ 5"   perchè altrimenti la forza di grvità diminuisce in quanto sembra proporzionata all'altezza
        
        if ((NSUserDefaults.standardUserDefaults().objectForKey("ball")) != nil){
            
            Ghost = SKSpriteNode(imageNamed: "Ghost")
            Ghost.size = CGSize(width: 60, height: 70)
            Ghost.position = CGPoint(x: self.frame.width / 2 - Ghost.frame.width + 70, y: self.frame.height / 2)
            Ghost.physicsBody = SKPhysicsBody(circleOfRadius: Ghost.frame.height / 2 + 5)
            Ghost.physicsBody?.categoryBitMask = PhysicsCatagory.Ghost
            Ghost.physicsBody?.collisionBitMask = PhysicsCatagory.Ground
            Ghost.physicsBody?.contactTestBitMask = PhysicsCatagory.Ground | PhysicsCatagory.Score | PhysicsCatagory.Barre | PhysicsCatagory.Stella
            Ghost.physicsBody?.affectedByGravity = false
            Ghost.physicsBody?.dynamic = true
            Ghost.zPosition = 1
            
            self.addChild(Ghost)
            
            return
            
        }
        
        if ((NSUserDefaults.standardUserDefaults().objectForKey("ball2")) != nil){
            
            Ghost = SKSpriteNode(imageNamed: "PallaRossa")
            Ghost.size = CGSize(width: 60, height: 60)
            Ghost.position = CGPoint(x: self.frame.width / 2 - Ghost.frame.width + 70, y: self.frame.height / 2)
            Ghost.physicsBody = SKPhysicsBody(circleOfRadius: Ghost.frame.height / 2 + 10)
            Ghost.physicsBody?.categoryBitMask = PhysicsCatagory.Ghost
            Ghost.physicsBody?.collisionBitMask = PhysicsCatagory.Ground
            Ghost.physicsBody?.contactTestBitMask = PhysicsCatagory.Ground | PhysicsCatagory.Score | PhysicsCatagory.Barre | PhysicsCatagory.Stella
            Ghost.physicsBody?.affectedByGravity = false
            Ghost.physicsBody?.dynamic = true
            Ghost.zPosition = 1
            
            self.addChild(Ghost)
            
            return
            
        }
        
        if ((NSUserDefaults.standardUserDefaults().objectForKey("ball3")) != nil){
            
            Ghost = SKSpriteNode(imageNamed: "PallaNera")
            Ghost.size = CGSize(width: 60, height: 60)
            Ghost.position = CGPoint(x: self.frame.width / 2 - Ghost.frame.width + 70, y: self.frame.height / 2)
            Ghost.physicsBody = SKPhysicsBody(circleOfRadius: Ghost.frame.height / 2 + 10)
            Ghost.physicsBody?.categoryBitMask = PhysicsCatagory.Ghost
            Ghost.physicsBody?.collisionBitMask = PhysicsCatagory.Ground
            Ghost.physicsBody?.contactTestBitMask = PhysicsCatagory.Ground | PhysicsCatagory.Score | PhysicsCatagory.Barre | PhysicsCatagory.Stella
            Ghost.physicsBody?.affectedByGravity = false
            Ghost.physicsBody?.dynamic = true
            Ghost.zPosition = 1
            
            self.addChild(Ghost)
            
            return
            
        }
        
        if ((NSUserDefaults.standardUserDefaults().objectForKey("ball4")) != nil){
            
            Ghost = SKSpriteNode(imageNamed: "PallaBasket")
            Ghost.size = CGSize(width: 60, height: 60)
            Ghost.position = CGPoint(x: self.frame.width / 2 - Ghost.frame.width + 70, y: self.frame.height / 2)
            Ghost.physicsBody = SKPhysicsBody(circleOfRadius: Ghost.frame.height / 2 + 10)
            Ghost.physicsBody?.categoryBitMask = PhysicsCatagory.Ghost
            Ghost.physicsBody?.collisionBitMask = PhysicsCatagory.Ground
            Ghost.physicsBody?.contactTestBitMask = PhysicsCatagory.Ground | PhysicsCatagory.Score | PhysicsCatagory.Barre | PhysicsCatagory.Stella
            Ghost.physicsBody?.affectedByGravity = false
            Ghost.physicsBody?.dynamic = true
            Ghost.zPosition = 1
            
            self.addChild(Ghost)
            
            return
            
        }
        
        Ghost = SKSpriteNode(imageNamed: "PallaGialla")
        Ghost.size = CGSize(width: 60, height: 60)
        Ghost.position = CGPoint(x: self.frame.width / 2 - Ghost.frame.width + 70, y: self.frame.height / 2)
        Ghost.physicsBody = SKPhysicsBody(circleOfRadius: Ghost.frame.height / 2 + 10)
        Ghost.physicsBody?.categoryBitMask = PhysicsCatagory.Ghost
        Ghost.physicsBody?.collisionBitMask = PhysicsCatagory.Ground
        Ghost.physicsBody?.contactTestBitMask = PhysicsCatagory.Ground | PhysicsCatagory.Score | PhysicsCatagory.Barre | PhysicsCatagory.Stella
        Ghost.physicsBody?.affectedByGravity = false
        Ghost.physicsBody?.dynamic = true
        Ghost.zPosition = 1
        
        self.addChild(Ghost)
        
    }
    
    override func didMoveToView(view: SKView){
        /* Setup your scene here */
        
        NSNotificationCenter.defaultCenter().addObserver(self, selector: #selector(GameSceneHard.pauseGame), name: "pauseGame", object: nil)

        
        createScene()
        
    }
    
    func playSoundTac(sound : SKAction){
        runAction(sound)
    }
    
    func playSoundGround(sound : SKAction){
        runAction(soundground)
    }
    
    func playSoundStella(sound : SKAction){
        runAction(soundstella)
    }
    
    func PausaBTN(){
        
        pausa = SKSpriteNode(imageNamed: "PausaBTNI")
        pausa.size = CGSize(width: 55, height: 50)
        pausa.position = CGPoint(x: self.frame.width / 2 + 170, y: self.frame.height / 2 + 320)
        pausa.zPosition = 4
        
        self.addChild(pausa)
        
    }
    
    func resumeBTN(){
        
        resume = SKSpriteNode(imageNamed: "ResumeBTNI")
        resume.size = CGSize(width: 80, height: 80)
        resume.position = CGPoint(x: self.frame.width / 2, y: self.frame.height / 2)
        resume.zPosition = 3
        
        self.addChild(resume)
    }
    
    func MenuBTNG(){
        
        menuBTNGame = SKSpriteNode(imageNamed: "Tastohome")
        menuBTNGame.size = CGSize(width: 70, height: 60)
        menuBTNGame.position = CGPoint(x: self.frame.width / 2 - 120, y: self.frame.height / 2 + 250)
        menuBTNGame.zPosition = 7
        
        self.addChild(menuBTNGame)
        
    }
    
    func pauseGame(){
        
        if gamesecond == true {
            
            self.scene!.paused = true // to pause the game
            self.physicsWorld.speed = 0.0
            self.speed = 0.0
            resume.hidden = true
            pausa.hidden = true
            menuBTNGame.hidden = true
            
            return
            
        }
        
        if gameplay == false {
            
            self.scene!.paused = true // to pause the game
            self.physicsWorld.speed = 0.0
            self.speed = 0.0
            resume.hidden = false
            pausa.hidden = true
            menuBTNGame.hidden = false
            
            return
            
        }
        
        if gameStarted == true {
            
            self.scene!.paused = true // to pause the game
            self.physicsWorld.speed = 0.0
            self.speed = 0.0
            gameplay = false
            resume.hidden = false
            pausa.hidden = true
            menuBTNGame.hidden = false
            
            return
            
        }
    }
    
    func pauseGame2(){
        self.scene!.paused = true // to pause the game
        self.physicsWorld.speed = 0.0
        self.speed = 0.0
        gameplay = false
        
    }
    
    func didBeginContact(contact: SKPhysicsContact) {
        let firstBody = contact.bodyA
        let secondBody = contact.bodyB
        
        if firstBody.categoryBitMask == PhysicsCatagoryN.Score && secondBody.categoryBitMask == PhysicsCatagoryN.Ghost || firstBody.categoryBitMask == PhysicsCatagoryN.Ghost && secondBody.categoryBitMask == PhysicsCatagoryN.Score {
            
            score += 1
            scoreLbl.text = "\(score)"
            
            if score == 10 {
                key1 += 3
                NSUserDefaults.standardUserDefaults().integerForKey("highscore")
                NSUserDefaults.standardUserDefaults().setInteger(key1, forKey: "highscore")
                NSUserDefaults.standardUserDefaults().synchronize()
                print("Key+ :",NSUserDefaults.standardUserDefaults().integerForKey("highscore"))
                let aggkey = SKLabelNode(fontNamed: "Noteworthy")
                aggkey.position = CGPoint(x: self.frame.width / 2, y: self.frame.height / 2 + 150)
                aggkey.text = "+3 Keys!"
                aggkey.zPosition = 5
                aggkey.fontColor = UIColor.cyanColor()
                aggkey.hidden = true
                self.addChild(aggkey)
                let show = SKAction.runBlock({() in aggkey.hidden = false})
                let hide = SKAction.runBlock({() in aggkey.hidden = true})
                let delay = SKAction.waitForDuration(1.0)
                let SpawnDelay = SKAction.sequence([show,delay,hide])
                let spawnDelay = SKAction.repeatAction(SpawnDelay, count: 1)
                self.runAction(spawnDelay)
                
            }
            
            if score == 20 {
                key1 += 5
                NSUserDefaults.standardUserDefaults().integerForKey("highscore")
                NSUserDefaults.standardUserDefaults().setInteger(key1, forKey: "highscore")
                NSUserDefaults.standardUserDefaults().synchronize()
                print("Key+ :",NSUserDefaults.standardUserDefaults().integerForKey("highscore"))
                let aggkey = SKLabelNode(fontNamed: "Noteworthy")
                aggkey.position = CGPoint(x: self.frame.width / 2, y: self.frame.height / 2 + 150)
                aggkey.text = "+5 Keys!"
                aggkey.zPosition = 5
                aggkey.fontColor = UIColor.cyanColor()
                aggkey.hidden = true
                self.addChild(aggkey)
                let show = SKAction.runBlock({() in aggkey.hidden = false})
                let hide = SKAction.runBlock({() in aggkey.hidden = true})
                let delay = SKAction.waitForDuration(1.0)
                let SpawnDelay = SKAction.sequence([show,delay,hide])
                let spawnDelay = SKAction.repeatAction(SpawnDelay, count: 1)
                self.runAction(spawnDelay)
            }
            
            if score == 30 || score == 40 || score == 50 || score == 60 || score == 70 || score == 80 || score == 90 || score == 100 {
                key1 += 10
                NSUserDefaults.standardUserDefaults().integerForKey("highscore")
                NSUserDefaults.standardUserDefaults().setInteger(key1, forKey: "highscore")
                NSUserDefaults.standardUserDefaults().synchronize()
                print("Key+ :",NSUserDefaults.standardUserDefaults().integerForKey("highscore"))
                let aggkey = SKLabelNode(fontNamed: "Noteworthy")
                aggkey.position = CGPoint(x: self.frame.width / 2, y: self.frame.height / 2 + 150)
                aggkey.text = "+10 Keys!"
                aggkey.zPosition = 5
                aggkey.fontColor = UIColor.cyanColor()
                aggkey.hidden = true
                self.addChild(aggkey)
                let show = SKAction.runBlock({() in aggkey.hidden = false})
                let hide = SKAction.runBlock({() in aggkey.hidden = true})
                let delay = SKAction.waitForDuration(1.0)
                let SpawnDelay = SKAction.sequence([show,delay,hide])
                let spawnDelay = SKAction.repeatAction(SpawnDelay, count: 1)
                self.runAction(spawnDelay)
            }
            
            if score == 110 {
                
                let aggkey = SKLabelNode(fontNamed: "Noteworthy")
                aggkey.position = CGPoint(x: self.frame.width / 2, y: self.frame.height / 2 + 150)
                aggkey.text = "No More Keys!"
                aggkey.zPosition = 5
                aggkey.fontColor = UIColor.cyanColor()
                aggkey.hidden = true
                self.addChild(aggkey)
                let show = SKAction.runBlock({() in aggkey.hidden = false})
                let hide = SKAction.runBlock({() in aggkey.hidden = true})
                let delay = SKAction.waitForDuration(1.0)
                let SpawnDelay = SKAction.sequence([show,delay,hide])
                let spawnDelay = SKAction.repeatAction(SpawnDelay, count: 1)
                self.runAction(spawnDelay)
                
            }
            
            wallPair.removeFromParent()
            
            
        }
        
        if firstBody.categoryBitMask == PhysicsCatagoryN.Stella && secondBody.categoryBitMask == PhysicsCatagoryN.Ghost || firstBody.categoryBitMask == PhysicsCatagoryN.Ghost && secondBody.categoryBitMask == PhysicsCatagoryN.Stella {
            
            playSoundStella(soundstella)
            score += 1
            scoreLbl.text = "\(score)"
            let show = SKAction.runBlock({() in self.scoreStella.hidden = false})
            let hide = SKAction.runBlock({() in self.scoreStella.hidden = true})
            let delay = SKAction.waitForDuration(1.0)
            let SpawnDelay = SKAction.sequence([show,delay,hide])
            let spawnDelay = SKAction.repeatAction(SpawnDelay, count: 1)
            self.runAction(spawnDelay)
            Stella.removeFromParent()
            
            if score == 10 {
                key1 += 3
                NSUserDefaults.standardUserDefaults().integerForKey("highscore")
                NSUserDefaults.standardUserDefaults().setInteger(key1, forKey: "highscore")
                NSUserDefaults.standardUserDefaults().synchronize()
                print("Key + :",NSUserDefaults.standardUserDefaults().integerForKey("highscore"))
                let aggkey = SKLabelNode(fontNamed: "Noteworthy")
                aggkey.position = CGPoint(x: self.frame.width / 2, y: self.frame.height / 2 + 150)
                aggkey.text = "+3 Keys!"
                aggkey.zPosition = 5
                aggkey.fontColor = UIColor.cyanColor()
                aggkey.hidden = true
                self.addChild(aggkey)
                let show = SKAction.runBlock({() in aggkey.hidden = false})
                let hide = SKAction.runBlock({() in aggkey.hidden = true})
                let delay = SKAction.waitForDuration(1.0)
                let SpawnDelay = SKAction.sequence([show,delay,hide])
                let spawnDelay = SKAction.repeatAction(SpawnDelay, count: 1)
                self.runAction(spawnDelay)
                
            }
            
            if score == 20 {
                key1 += 5
                NSUserDefaults.standardUserDefaults().integerForKey("highscore")
                NSUserDefaults.standardUserDefaults().setInteger(key1, forKey: "highscore")
                NSUserDefaults.standardUserDefaults().synchronize()
                print("Key + :",NSUserDefaults.standardUserDefaults().integerForKey("highscore"))
                let aggkey = SKLabelNode(fontNamed: "Noteworthy")
                aggkey.position = CGPoint(x: self.frame.width / 2, y: self.frame.height / 2 + 150)
                aggkey.text = "+5 Keys!"
                aggkey.zPosition = 5
                aggkey.fontColor = UIColor.cyanColor()
                aggkey.hidden = true
                self.addChild(aggkey)
                let show = SKAction.runBlock({() in aggkey.hidden = false})
                let hide = SKAction.runBlock({() in aggkey.hidden = true})
                let delay = SKAction.waitForDuration(1.0)
                let SpawnDelay = SKAction.sequence([show,delay,hide])
                let spawnDelay = SKAction.repeatAction(SpawnDelay, count: 1)
                self.runAction(spawnDelay)
            }
            
            if score == 30 || score == 40 || score == 50 || score == 60 || score == 70 || score == 80 || score == 90 || score == 100 {
                key1 += 10
                NSUserDefaults.standardUserDefaults().integerForKey("highscore")
                NSUserDefaults.standardUserDefaults().setInteger(key1, forKey: "highscore")
                NSUserDefaults.standardUserDefaults().synchronize()
                print("Key+ :",NSUserDefaults.standardUserDefaults().integerForKey("highscore"))
                let aggkey = SKLabelNode(fontNamed: "Noteworthy")
                aggkey.position = CGPoint(x: self.frame.width / 2, y: self.frame.height / 2 + 150)
                aggkey.text = "+10 Keys!"
                aggkey.zPosition = 5
                aggkey.fontColor = UIColor.cyanColor()
                aggkey.hidden = true
                self.addChild(aggkey)
                let show = SKAction.runBlock({() in aggkey.hidden = false})
                let hide = SKAction.runBlock({() in aggkey.hidden = true})
                let delay = SKAction.waitForDuration(1.0)
                let SpawnDelay = SKAction.sequence([show,delay,hide])
                let spawnDelay = SKAction.repeatAction(SpawnDelay, count: 1)
                self.runAction(spawnDelay)
            }
            
            if score == 110 {
                
                let aggkey = SKLabelNode(fontNamed: "Noteworthy")
                aggkey.position = CGPoint(x: self.frame.width / 2, y: self.frame.height / 2 + 150)
                aggkey.text = "No More Keys!"
                aggkey.zPosition = 5
                aggkey.fontColor = UIColor.cyanColor()
                aggkey.hidden = true
                self.addChild(aggkey)
                let show = SKAction.runBlock({() in aggkey.hidden = false})
                let hide = SKAction.runBlock({() in aggkey.hidden = true})
                let delay = SKAction.waitForDuration(1.0)
                let SpawnDelay = SKAction.sequence([show,delay,hide])
                let spawnDelay = SKAction.repeatAction(SpawnDelay, count: 1)
                self.runAction(spawnDelay)
                
            }
            
            
            
        }
        
        if firstBody.categoryBitMask == PhysicsCatagory.Ghost && secondBody.categoryBitMask == PhysicsCatagory.Barre || firstBody.categoryBitMask == PhysicsCatagory.Barre && secondBody.categoryBitMask == PhysicsCatagory.Ghost {
            
            let suono = SKAction.runBlock({
                () in
                self.playSoundGround(self.soundground)
                
            })
            
            let gameover = SKAction.runBlock({
                () in
                
                firstBody.node?.removeFromParent()
                self.GameoverScene()
            })
            
            let SpawnDelay = SKAction.sequence([suono,gameover])
            let spawnDelayForever = SKAction.repeatAction(SpawnDelay,count: 1)
            self.runAction(spawnDelayForever)
            
        }
        
        if firstBody.categoryBitMask == PhysicsCatagory.Ghost && secondBody.categoryBitMask == PhysicsCatagory.Ground || firstBody.categoryBitMask == PhysicsCatagory.Ground && secondBody.categoryBitMask == PhysicsCatagory.Ghost{
            
            let suono = SKAction.runBlock({
                () in
                self.playSoundGround(self.soundground)
                
            })
            
            let gameover = SKAction.runBlock({
                () in
                self.GameoverScene()
            })
            
            let SpawnDelay = SKAction.sequence([suono,gameover])
            let spawnDelayForever = SKAction.repeatAction(SpawnDelay,count: 1)
            self.runAction(spawnDelayForever)
            
        }
    }
    
    func GameoverScene(){
        
        if score > 3 {
            
            NSNotificationCenter.defaultCenter().postNotificationName("showid2", object: self)
            
        }
        
        pauseGame2()
        
        MyVariables.yourVariable = score
        
        tapToreStart.hidden = true
        
        gamesecond = true
        
        NSUserDefaults.standardUserDefaults().integerForKey("lastscore")
        NSUserDefaults.standardUserDefaults().setInteger(score, forKey: "lastscore")
        NSUserDefaults.standardUserDefaults().synchronize()
        
        NSNotificationCenter.defaultCenter().postNotificationName("savegamecenter", object: self)
        
        Palla = SKSpriteNode(imageNamed: "PallaHome")
        Palla.position = CGPointMake(self.frame.width / 2, 320 + self.frame.height / 2)
        Palla.setScale(0.6)
        Palla.zPosition = 1
        Palla.hidden = false
        self.addChild(Palla)
        
        difficulty.position = CGPoint(x: self.frame.width / 2, y: self.frame.height / 2 + 190)
        difficulty.fontSize = 50
        difficulty.zPosition = 4
        difficulty.hidden = false
        
        replay = SKSpriteNode(imageNamed: "Resumego")
        replay.size = CGSize(width: 130, height: 75)
        replay.position = CGPoint(x: self.frame.width / 2, y: self.frame.height / 2 - 10)
        replay.hidden = false
        replay.zPosition = 8
        
        self.addChild(replay)
        
        restartcount = SKLabelNode(fontNamed: "Noteworthy")
        restartcount.position = CGPoint(x: self.frame.width / 2 - 145, y: self.frame.height / 2 + 310)
        restartcount.fontColor = SKColor(red:25/225.0, green:125/255.0, blue:225/225.0, alpha:1.0)
        restartcount.fontSize = 30
        restartcount.text = "Resume: \(Rcount)"
        restartcount.hidden = false
        restartcount.zPosition = 5
        
        self.addChild(restartcount)
        
        keyl = SKLabelNode(fontNamed: "Noteworthy")
        keyl.position = CGPoint(x: 150 + self.frame.width / 2, y: self.frame.height / 2 + 298)
        keyl.fontColor = UIColor.blackColor()
        keyl.fontSize = 25
        keyl.text = "\(key1)"
        keyl.hidden = false
        keyl.zPosition = 5
        
        self.addChild(keyl)
        
        or = SKLabelNode(fontNamed: "Courier")
        or.position = CGPoint(x: self.frame.width / 2, y: self.frame.height / 2 + 40)
        or.fontColor = UIColor.redColor()
        or.fontSize = 20
        or.text = "OR"
        or.hidden = false
        or.zPosition = 5
        
        self.addChild(or)
        
        tkeyBTN = SKSpriteNode(imageNamed: "TotKeys")
        tkeyBTN.size = CGSize(width: 120, height: 70)
        tkeyBTN.position = CGPoint(x: 140 + self.frame.width / 2 , y: self.frame.height / 2 + 320)
        tkeyBTN.zPosition = 4
        tkeyBTN.hidden = false
        
        self.addChild(tkeyBTN)
        
        restartBTN = SKSpriteNode(imageNamed: "Restart")
        restartBTN.size = CGSize(width: 130, height: 80)
        restartBTN.position = CGPoint(x: self.frame.width / 2, y: self.frame.height / 2 + 100)
        restartBTN.zPosition = 3
        restartBTN.hidden = false
        
        self.addChild(restartBTN)
        
        menuBTN = SKSpriteNode(imageNamed: "Tastohome")
        menuBTN.size = CGSize(width: 70, height: 60)
        menuBTN.position = CGPoint(x: self.frame.width / 2 - 150, y: self.frame.height / 2 - 250)
        menuBTN.zPosition = 3
        menuBTN.hidden = false
        
        self.addChild(menuBTN)
        
    }
    
    func restart(){
        self.scene!.paused = false
        restartScene()
    }
    
    
    override func touchesBegan(touches: Set<UITouch>, withEvent event: UIEvent?) {
        
        if gameStarted == false{
            
            gameStarted = true
            
            gameplay = true
            
            tapToStart.hidden = true
            
            difficulty.hidden = true
            
            scoreLbl.hidden = false
            
            PausaBTN()
            
            Ghost.physicsBody?.affectedByGravity = true
            
            let spawn = SKAction.runBlock({() in self.createWalls()})
            let spawn1 = SKAction.runBlock({() in self.createBarre1()})
            let spawn1D = SKAction.runBlock({() in self.createBarre1D()})
            let spawn1S = SKAction.runBlock({() in self.createBarre1S()})
            
            let spawn2 = SKAction.runBlock({() in self.createBarre2()})
            let spawn2D = SKAction.runBlock({() in self.createBarre2D()})
            let spawn2S = SKAction.runBlock({() in self.createBarre2S()})

            let spawn3 = SKAction.runBlock({() in self.createBarre3()})
            let spawn3D = SKAction.runBlock({() in self.createBarre3D()})
            let spawn3S = SKAction.runBlock({() in self.createBarre3S()})

            let spawn4 = SKAction.runBlock({() in self.createBarre4()})
            let spawn4D = SKAction.runBlock({() in self.createBarre4D()})
            let spawn4S = SKAction.runBlock({() in self.createBarre4S()})

            let spawn5 = SKAction.runBlock({() in self.createBarre5()})
            let spawn5D = SKAction.runBlock({() in self.createBarre5D()})
            let spawn5S = SKAction.runBlock({() in self.createBarre5S()})

            let spawn6 = SKAction.runBlock({() in self.createBarre6()})
            let spawn6D = SKAction.runBlock({() in self.createBarre6D()})
            let spawn6S = SKAction.runBlock({() in self.createBarre6S()})

            let spawn7 = SKAction.runBlock({() in self.createBarre7()})
            let spawn7D = SKAction.runBlock({() in self.createBarre7D()})
            let spawn7S = SKAction.runBlock({() in self.createBarre7S()})

            let spawn8 = SKAction.runBlock({() in self.createBarre8()})
            let spawn8D = SKAction.runBlock({() in self.createBarre8D()})
            //al posto di usare 8S uso 6S
            
            let spawn9 = SKAction.runBlock({() in self.createBarre9()})
            let spawn9D1 = SKAction.runBlock({() in self.createBarre9D()})
            let spawn9S = SKAction.runBlock({() in self.createBarre9S()})

            let spawnS = SKAction.runBlock({() in self.stellaFunc()})
            let spawnSD = SKAction.runBlock({() in self.stellaFunc2()})
            
            let random = SKAction.runBlock({()
                let array = [spawn1,spawn1D,spawn2,spawn2D,spawn3,spawn3D,spawn4,spawn4D]
                let randomIndex = Int(arc4random_uniform(UInt32(array.count)))
                self.runAction(array[randomIndex])
            })
            
            let random2 = SKAction.runBlock({()
                let array = [spawn1S,spawn2S,spawn3S,spawn4S]
                let randomIndex = Int(arc4random_uniform(UInt32(array.count)))
                self.runAction(array[randomIndex])
            })
            
            let randomA = SKAction.runBlock({()
                let array = [spawn5,spawn5D,spawn6,spawn6D,spawn7,spawn7D,spawn8,spawn8D]
                let randomIndex = Int(arc4random_uniform(UInt32(array.count)))
                self.runAction(array[randomIndex])
            })
            
            let random2A = SKAction.runBlock({()
                let array = [spawn5S,spawn6S,spawn7S,spawn6S]
                let randomIndex = Int(arc4random_uniform(UInt32(array.count)))
                self.runAction(array[randomIndex])
            })
            
            let randomB = SKAction.runBlock({()
                let array = [spawn9,spawn9D1,spawn9S]
                let randomIndex = Int(arc4random_uniform(UInt32(array.count)))
                self.runAction(array[randomIndex])
            })
            
            //distanza wall in tempo dopo tot secondi spawna quello dopo
            let delay = SKAction.waitForDuration(2.0)
            let delay1 = SKAction.waitForDuration(1.0)
            let delay2 = SKAction.waitForDuration(3.0)
            
            
            let SpawnDelay = SKAction.sequence([
                
                //1
                spawn,delay,        random,delay1, random2,delay1, random,delay2,
                //1
                spawn,delay,        random,delay1, random2,delay1, random,delay2,
                //1
                spawn,delay,        random,delay1, random2,delay1, random,delay1,  random,delay2,
                //1
                spawn,delay,        spawnS,delay1, random2,delay1, random,delay2,
                //1
                spawn,delay,        random,delay1, random,delay1, random2,delay2,
                //1
                spawn,delay,        random,delay1, spawnSD,random, delay1,random2,random,delay2,
                //1
                spawn,delay,        random,delay1, random,delay1,  random,delay2,
                //1
                spawn,delay,        random,delay1, random,random2,delay2,
                
                
                //1
                spawn,delay,        spawnS,delay1, randomA,delay1, random2A,delay1, randomA,delay2,
                //1
                spawn,delay,        randomA,delay1, randomA,delay1, random2A,delay1, spawnSD,delay2,
                //1
                spawn,delay,        randomA,delay1, randomA,delay1,  randomA,delay2,
                //1
                spawn,delay,        randomA,delay1, randomA,randomA,delay2,
                //1
                spawn,delay,        randomA,delay1, randomA,delay1, random2A,delay1, randomA,delay2,
                //1
                spawn,delay,        randomA,delay1, random2A,delay1, spawnSD,delay2,
                //1
                spawn,delay,        randomA,delay1, randomA,delay1, random2A,randomA,delay2,
                
                
                //1
                spawn,delay,        randomB,delay1, randomB,delay1,  randomB,delay2,
                //1
                spawn,delay,        randomB,delay1, randomB,delay1,  randomB,delay2,
                //1
                spawn,delay,        randomB,delay1, spawnS,delay1,   spawn9S,delay2,
                //1
                spawn,delay,        randomB,delay1, randomB,delay1,  randomB,delay2,
                
                //1
                spawn,delay,        randomB,delay1, randomB,delay1,  randomB,delay2,
                //1
                spawn,delay,        randomB,delay1, randomB,delay1,  randomB,delay2,
                //1
                spawn,delay,        randomB,delay1, spawnSD,delay1,  randomB,delay2,
                //1
                spawn,delay,        randomB,delay1, randomB,delay1,  randomB,delay2,
                
                
                
                
                ])
            
            let spawnDelayForever = SKAction.repeatActionForever(SpawnDelay)
            //se vuoi che si fermi a 2  let spawnDelayForever = SKAction.repeatAction(SpawnDelay,count: 2)
            self.runAction(spawnDelayForever)
            
            //livelli
            let distance = CGFloat(self.frame.width + 1000 + wallPair.frame.width) //puoi tolgiere "*distance" ma la velocità cambia
            let movePipes = SKAction.moveToY(-distance, duration: NSTimeInterval( 0.003 * distance))
            
            //stella
            let distanceS = CGFloat(self.frame.width + Stella.frame.width) //puoi tolgiere "*distance" ma la velocità cambia
            let movePipesS = SKAction.moveToX(distanceS, duration: NSTimeInterval( 0.003 * distanceS))
            let movePipesS2 = SKAction.moveToX(-distanceS, duration: NSTimeInterval( 0.003 * distanceS))
            
            let distanceS1 = CGFloat(-400)
            let movePipesS1 = SKAction.moveToY(distanceS1, duration: 7)
            
            let distance2 = CGFloat(self.frame.width - 390 + Barre.frame.width) //puoi tolgiere "*distance" ma la velocità cambia
            //se c'è il - davanti alla distnace va verso destra
            let movePipes1 = SKAction.moveToX(distance2, duration: NSTimeInterval( 0.004 * distance2))
            let movePipes2 = SKAction.moveToX(distance2, duration: NSTimeInterval( 0.003 * distance2))
            let movePipes3 = SKAction.moveToX(distance2, duration: NSTimeInterval( 0.002 * distance2))
            let movePipes4 = SKAction.moveToX(distance2, duration: NSTimeInterval( 0.001 * distance2))
            
            //se c'è il - davanti alla distance va verso destra
            let movePipes1D = SKAction.moveToX(-distance2, duration: NSTimeInterval( 0.004 * distance2))
            let movePipes2D = SKAction.moveToX(-distance2, duration: NSTimeInterval( 0.003 * distance2))
            let movePipes3D = SKAction.moveToX(-distance2, duration: NSTimeInterval( 0.002 * distance2))
            let movePipes4D = SKAction.moveToX(-distance2, duration: NSTimeInterval( 0.001 * distance2))
            
            let diagonale = CGPoint(x: +700 , y: -1050)
            let movePipes1S = SKAction.moveTo(diagonale, duration: NSTimeInterval( 0.004 * distance2))
            
            let diagonale1 = CGPoint(x: +700 , y: +1050)
            let movePipes2S = SKAction.moveTo(diagonale1, duration: NSTimeInterval( 0.004 * distance2))
            
            let diagonale2 = CGPoint(x: -700 , y: -1050)
            let movePipes3S = SKAction.moveTo(diagonale2, duration: NSTimeInterval( 0.004 * distance2))
            
            
            
            let removePipes = SKAction.removeFromParent()
            
            moveAndRemove = SKAction.sequence([movePipes, removePipes])
            moveAndRemoveS = SKAction.sequence([movePipesS, removePipes])
            
            
            moveAndRemove1 = SKAction.sequence([movePipes1, removePipes])
            moveAndRemove2 = SKAction.sequence([movePipes2, removePipes])
            moveAndRemove3 = SKAction.sequence([movePipes3, removePipes])
            moveAndRemove4 = SKAction.sequence([movePipes4, removePipes])
            
            moveAndRemove2 = SKAction.sequence([movePipes2, removePipes])
            moveAndRemoveS1 = SKAction.sequence([movePipesS1, removePipes])
            moveAndRemoveS2 = SKAction.sequence([movePipesS2, removePipes])
            
            
            moveAndRemove1D = SKAction.sequence([movePipes1D, removePipes])
            moveAndRemove2D = SKAction.sequence([movePipes2D, removePipes])
            moveAndRemove3D = SKAction.sequence([movePipes3D, removePipes])
            moveAndRemove4D = SKAction.sequence([movePipes4D, removePipes])
            
            moveAndRemove1S = SKAction.sequence([movePipes1S, removePipes])
            moveAndRemove2S = SKAction.sequence([movePipes2S, removePipes])
            moveAndRemove3S = SKAction.sequence([movePipes3S, removePipes])
            
            
            
            
            Ghost.physicsBody?.velocity = CGVectorMake(0, 0)
            Ghost.physicsBody?.applyImpulse(CGVectorMake(0, 60))
            
            
            
            
            let spawn14 = SKAction.runBlock({() in self.createStella(); self.createStella();self.createStella(); self.createStella();self.createStella(); self.createStella()})
            
            //distanza wall in tempo dopo tot secondi spawna quello dopo
            let delay0 = SKAction.waitForDuration(1.0)
            let delay9 = SKAction.waitForDuration(74)
            
            
            let SpawnDelay2 = SKAction.sequence([
                
                delay9,spawn14,delay0,spawn14,delay0,spawn14,delay0,spawn14,delay0,spawn14,delay0,spawn14,delay0,spawn14,delay0,spawn14,delay0,spawn14,delay0,spawn14,delay0,spawn14,delay0,spawn14,delay0,spawn14,delay0,spawn14,delay0,spawn14,delay0,spawn14,delay0,spawn14,delay0,spawn14,delay0,spawn14,delay0,spawn14,delay0,spawn14,delay0,spawn14,delay0,spawn14,delay0,spawn14,delay0,spawn14,delay0,spawn14,delay0,spawn14,delay0,spawn14,delay0,spawn14,delay0,spawn14,delay0,spawn14,delay0,spawn14,delay0,spawn14,delay0,spawn14,delay0,spawn14,delay0,spawn14,delay0,spawn14,delay0,spawn14,delay0,spawn14,delay0,spawn14,delay0,spawn14,delay0,spawn14,delay0,spawn14,delay0,spawn14,delay0,spawn14,delay0,spawn14,delay0,spawn14,delay0,spawn14,delay0,spawn14,delay0,spawn14,delay0,spawn14,delay0,spawn14,delay0,spawn14,delay0,spawn14,delay0,spawn14,delay0,spawn14,delay0,spawn14,delay0,delay0,spawn14,delay0,spawn14,delay0,spawn14,delay0,spawn14,delay0,spawn14,delay0,spawn14,delay0,spawn14,delay0,spawn14,delay0,spawn14,delay0,spawn14,delay0,spawn14,delay0,spawn14,delay0,spawn14,delay0,spawn14,delay0,spawn14,delay0,spawn14,delay0,spawn14,delay0,spawn14,delay0,spawn14,delay0,spawn14,delay0,spawn14,delay0,spawn14,delay0,spawn14,delay0,spawn14,delay0,spawn14,delay0,spawn14,delay0,spawn14,delay0,spawn14,delay0,spawn14,delay0,spawn14,delay0,spawn14,delay0,spawn14,delay0,spawn14,delay0,spawn14,delay0,spawn14,delay0,spawn14,delay0,spawn14,delay0,spawn14,delay0,spawn14,delay0,spawn14,delay0,spawn14,delay0,spawn14,delay0,spawn14,delay0,spawn14,delay0,spawn14,delay0,spawn14,delay0,spawn14,delay0,spawn14,delay0,spawn14,delay0,spawn14,delay0,spawn14,delay0,spawn14,delay0,spawn14,delay0,spawn14,delay0,spawn14,delay0,spawn14,delay0,spawn14,delay0,spawn14,delay0,spawn14,delay0,spawn14,delay0,spawn14,delay0,spawn14,delay0,spawn14,delay0,spawn14,delay0,spawn14,delay0,spawn14,delay0,spawn14,delay0,spawn14,delay0,spawn14,delay0,spawn14,delay0,spawn14,delay0,spawn14,delay0,spawn14,delay0,spawn14,delay0,spawn14,delay0,spawn14,delay0,spawn14,delay0,spawn14,delay0,spawn14,delay0,spawn14,delay0,spawn14,delay0,spawn14,delay0,spawn14,delay0,spawn14,delay0,spawn14,delay0,spawn14,delay0,spawn14,delay0,spawn14,delay0,spawn14,delay0,spawn14,delay0,spawn14,delay0,spawn14,delay0,spawn14,delay0,spawn14,delay0,spawn14,delay0,spawn14,delay0,spawn14,delay0,spawn14,delay0,spawn14,delay0,spawn14,delay0,spawn14,delay0,spawn14,delay0,spawn14,delay0,spawn14,delay0,spawn14,delay0,spawn14,delay0,spawn14,delay0,spawn14,delay0,spawn14,delay0,spawn14,delay0,spawn14,delay0,spawn14,delay0,spawn14,delay0,spawn14,delay0,spawn14,delay0,spawn14,delay0,spawn14,delay0,spawn14,delay0,spawn14,delay0,spawn14,delay0,spawn14,delay0,spawn14,delay0,spawn14,delay0,spawn14,delay0,spawn14,delay0,spawn14,delay0,spawn14,delay0,spawn14,delay0,spawn14,delay0,spawn14,delay0,spawn14,delay0,spawn14,delay0,spawn14,delay0,spawn14,delay0,spawn14,delay0,spawn14,delay0,spawn14,delay0,spawn14,delay0,spawn14,delay0,spawn14,delay0,spawn14,delay0,spawn14,delay0,spawn14,delay0,spawn14,delay0,spawn14,delay0,spawn14,delay0,spawn14,delay0,spawn14,delay0,spawn14,delay0,spawn14,delay0,spawn14,delay0,spawn14,delay0,spawn14,delay0,spawn14,delay0,spawn14,delay0,spawn14,delay0,spawn14,delay0,spawn14,delay0,spawn14,delay0,spawn14,delay0,spawn14,delay0,spawn14,delay0,spawn14,delay0,spawn14,delay0,spawn14,delay0,spawn14,delay0,spawn14,delay0,spawn14,delay0,spawn14,delay0,spawn14,delay0,spawn14,delay0,spawn14,delay0,spawn14,delay0,spawn14,delay0,spawn14,delay0,spawn14,delay0,spawn14,delay0,spawn14,delay0,spawn14,delay0,spawn14,delay0,spawn14,delay0,spawn14,delay0,spawn14,delay0,spawn14,delay0,spawn14,delay0,spawn14,delay0,spawn14,delay0,spawn14,delay0,spawn14,delay0,spawn14,delay0,spawn14,delay0,spawn14,delay0,spawn14,delay0,spawn14,delay0,spawn14,delay0,spawn14,delay0,spawn14,delay0,spawn14,delay0,spawn14,delay0,spawn14,delay0,spawn14,delay0,spawn14,delay0,spawn14,delay0,spawn14,delay0,spawn14,delay0,spawn14,delay0,spawn14,delay0,spawn14,delay0,spawn14,delay0,spawn14,delay0,spawn14,delay0,spawn14,delay0,spawn14,delay0,spawn14,delay0,spawn14,delay0,spawn14,delay0,spawn14,delay0,spawn14,delay0,spawn14,delay0,spawn14,delay0,spawn14,delay0,spawn14,delay0,spawn14,delay0,spawn14,delay0,spawn14,delay0,spawn14,delay0,spawn14,delay0,spawn14,delay0,spawn14,delay0,spawn14,delay0,spawn14,delay0,spawn14,delay0,spawn14,delay0,spawn14,delay0,spawn14,delay0,spawn14,delay0,spawn14,delay0,spawn14,delay0,spawn14,delay0,spawn14,delay0,spawn14,delay0,spawn14,delay0,spawn14,delay0,spawn14,delay0,spawn14,delay0,spawn14,delay0,spawn14,delay0,spawn14,delay0,spawn14,delay0,spawn14,delay0,spawn14,delay0,spawn14,delay0,spawn14,delay0,spawn14,delay0,spawn14,delay0,spawn14,delay0,spawn14,delay0,spawn14,delay0,spawn14,delay0,spawn14,delay0,spawn14,delay0,spawn14,delay0,spawn14,delay0,spawn14,delay0,spawn14,delay0,spawn14,delay0,spawn14,delay0,spawn14,delay0,spawn14,delay0,spawn14,delay0,spawn14,delay0,spawn14,delay0,spawn14,delay0,spawn14,delay0,spawn14,delay0,spawn14,delay0,spawn14,delay0,spawn14,delay0,spawn14,delay0,spawn14,delay0,spawn14,delay0,spawn14,delay0,spawn14,delay0,spawn14,delay0,spawn14,delay0,spawn14,delay0,spawn14,delay0,spawn14,delay0,spawn14,delay0,spawn14,delay0,spawn14,delay0,spawn14,delay0,spawn14,delay0,spawn14,delay0,spawn14,delay0,spawn14,delay0,spawn14,delay0,spawn14,delay0,spawn14,delay0,spawn14,delay0,spawn14,delay0,spawn14,delay0,spawn14,delay0,spawn14,delay0,spawn14,delay0,spawn14,delay0,spawn14,delay0,spawn14,delay0,spawn14,delay0,spawn14,delay0,spawn14,delay0,spawn14,delay0,spawn14,delay0,spawn14,delay0,spawn14,delay0,spawn14,delay0,spawn14,delay0,spawn14,delay0,spawn14,delay0,spawn14,delay0,spawn14,delay0,spawn14,delay0,spawn14,delay0,spawn14,delay0,spawn14,delay0,spawn14,delay0,spawn14,delay0,spawn14,delay0,spawn14,delay0,spawn14,delay0,spawn14,delay0,spawn14,delay0,spawn14,delay0,spawn14,delay0,spawn14,delay0,spawn14,delay0,spawn14,delay0,spawn14,delay0,spawn14,delay0,spawn14,delay0,spawn14,delay0,spawn14,delay0,spawn14,delay0,spawn14,delay0,spawn14,delay0,spawn14,delay0,spawn14,delay0,spawn14,delay0,spawn14,delay0,spawn14,delay0,spawn14,delay0,spawn14,delay0,spawn14,delay0,spawn14,delay0,spawn14,delay0,spawn14,delay0,spawn14,delay0,spawn14,delay0,spawn14,delay0,spawn14,delay0,spawn14,delay0,spawn14,delay0,spawn14,delay0,spawn14,delay0,spawn14,delay0,spawn14,delay0,spawn14,delay0,spawn14,delay0,spawn14,delay0,spawn14,delay0,spawn14,delay0,spawn14,delay0,spawn14,delay0,spawn14,delay0,spawn14,delay0,spawn14,delay0,spawn14,delay0,spawn14,delay0,spawn14,delay0,spawn14,delay0,spawn14,delay0,spawn14,delay0,spawn14,delay0,spawn14,delay0,spawn14,delay0,spawn14,delay0,spawn14,delay0,spawn14,delay0,spawn14,delay0,spawn14,delay0,spawn14,delay0,spawn14,delay0,spawn14,delay0,spawn14,delay0,spawn14,delay0,spawn14,delay0,spawn14,delay0,spawn14,delay0,spawn14,delay0,spawn14,delay0,spawn14,delay0,spawn14,delay0,spawn14,delay0,spawn14,delay0,spawn14,delay0,spawn14,delay0,spawn14,delay0,spawn14,delay0,spawn14,delay0,spawn14,delay0,spawn14,delay0,spawn14,delay0,spawn14,delay0,spawn14,delay0,spawn14,delay0,spawn14,delay0,spawn14,delay0,spawn14,delay0,spawn14,delay0,spawn14,delay0,spawn14,delay0,spawn14,delay0,spawn14,delay0,spawn14,delay0,spawn14,delay0,spawn14,delay0,spawn14,delay0,spawn14,delay0,spawn14,delay0,spawn14,delay0,spawn14,delay0,spawn14,delay0,spawn14,delay0,spawn14,delay0,spawn14,delay0,spawn14,delay0,spawn14,delay0,spawn14,delay0,spawn14,delay0,spawn14,delay0,spawn14,delay0,spawn14,delay0,spawn14,delay0,spawn14,delay0,spawn14,delay0,spawn14,delay0,spawn14,delay0,spawn14,delay0,spawn14,delay0,spawn14,delay0,spawn14,delay0,spawn14,delay0,spawn14,delay0,spawn14,delay0,spawn14,delay0,spawn14,delay0,spawn14,delay0,spawn14,delay0,spawn14,delay0,spawn14,delay0,spawn14,delay0,spawn14,delay0,spawn14,delay0,spawn14,delay0,spawn14,delay0,spawn14,delay0,spawn14,delay0,spawn14,delay0,spawn14,delay0,spawn14,delay0,spawn14,delay0,spawn14,delay0,spawn14,delay0,spawn14,delay0,spawn14,delay0,spawn14,delay0,spawn14,
                
                ])
            
            let spawnDelayForever2 = SKAction.repeatActionForever(SpawnDelay2)
            //se vuoi che si fermi a 2  let spawnDelay = SKAction.repeatAction(SpawnDelay,count: 2)
            self.runAction(spawnDelayForever2)
            
            
            let spawn4A = SKAction.runBlock({() in
                self.background9.anchorPoint = CGPointZero
                self.background9.size = CGSize(width: 600, height: 200)
                self.background9.position = CGPoint(x: -300 + self.frame.width / 2, y: self.background8.position.y + self.background8.size.height - 2)
                self.background9.zPosition = -15
                self.background9.setScale(1.0)
                self.addChild(self.background9)})
            
            let spawn5A = SKAction.runBlock({() in
                self.background10.anchorPoint = CGPointZero
                self.background10.size = CGSize(width: 600, height: 200)
                self.background10.position = CGPoint(x: -300 + self.frame.width / 2, y: self.background9.position.y + self.background9.size.height  - 2)
                self.background10.zPosition = -15
                self.background10.setScale(1.0)
                self.addChild(self.background10)})
            
            let spawn6A = SKAction.runBlock({() in
                self.background11.anchorPoint = CGPointZero
                self.background11.size = CGSize(width: 600, height: 200)
                self.background11.position = CGPoint(x: -300 + self.frame.width / 2, y: self.background10.position.y + self.background10.size.height - 2)
                self.background11.zPosition = -15
                self.background11.setScale(1.0)
                self.addChild(self.background11)})
            
            let spawn7A = SKAction.runBlock({() in
                self.background12.anchorPoint = CGPointZero
                self.background12.size = CGSize(width: 600, height: 200)
                self.background12.position = CGPoint(x: -300 + self.frame.width / 2, y: self.background11.position.y + self.background11.size.height - 2)
                self.background12.zPosition = -15
                self.background12.setScale(1.0)
                self.addChild(self.background12)})
            
            let spawn8A = SKAction.runBlock({() in
                self.background13.anchorPoint = CGPointZero
                self.background13.size = CGSize(width: 600, height: 200)
                self.background13.position = CGPoint(x: -300 + self.frame.width / 2, y: self.background12.position.y + self.background12.size.height - 2)
                self.background13.zPosition = -15
                self.background13.setScale(1.0)
                self.addChild(self.background13)})
            
            let spawn9A = SKAction.runBlock({() in
                self.background14.anchorPoint = CGPointZero
                self.background14.size = CGSize(width: 600, height: 200)
                self.background14.position = CGPoint(x: -300 + self.frame.width / 2, y: self.background13.position.y + self.background13.size.height - 2)
                self.background14.zPosition = -15
                self.background14.setScale(1.0)
                self.addChild(self.background14)})
            
            let spawn10A = SKAction.runBlock({() in
                self.background16.anchorPoint = CGPointZero
                self.background16.size = CGSize(width: 600, height: 200)
                self.background16.position = CGPoint(x: -300 + self.frame.width / 2, y: self.background14.position.y + self.background14.size.height - 2)
                self.background16.zPosition = -15
                self.background16.setScale(1.0)
                self.addChild(self.background16)})
            
            
            let spawn1B = SKAction.runBlock({() in
                self.background2.position = CGPointMake(self.background1.position.x, self.background16.position.y + self.background16.size.height - 2)
            })
            
            let spawn2B = SKAction.runBlock({() in
                self.background3.position = CGPointMake(self.background1.position.x,self.background2.position.y + self.background2.size.height - 2)
            })
            
            let spawn2B1 = SKAction.runBlock({() in
                self.background4.position = CGPointMake(self.background1.position.x,self.background3.position.y + self.background3.size.height - 2)
            })
            
            let spawn3B = SKAction.runBlock({() in
                self.background13.position = CGPointMake(self.background1.position.x, self.background4.position.y + self.background4.size.height - 2)
            })
            
            let spawn4B = SKAction.runBlock({() in
                self.background6.position = CGPointMake(self.background1.position.x, self.background13.position.y + self.background13.size.height - 2)
            })
            
            let spawn5B = SKAction.runBlock({() in
                self.background7.position = CGPointMake(self.background1.position.x, self.background6.position.y + self.background6.size.height - 2)
            })
            
            let spawn6B = SKAction.runBlock({() in
                self.background8.position = CGPointMake(self.background1.position.x, self.background7.position.y + self.background7.size.height - 2)
            })
            
            let spawn7B = SKAction.runBlock({() in
                self.background9.position = CGPointMake(self.background1.position.x, self.background8.position.y + self.background8.size.height - 2)
            })
            
            let spawn8B = SKAction.runBlock({() in
                self.background10.position = CGPointMake(self.background1.position.x, self.background9.position.y + self.background9.size.height - 2)
            })
            
            let spawn9B = SKAction.runBlock({() in
                self.background11.position = CGPointMake(self.background1.position.x, self.background10.position.y + self.background10.size.height - 2)
            })
            
            let spawn10B = SKAction.runBlock({() in
                self.background2.position = CGPointMake(self.background1.position.x, self.background11.position.y + self.background11.size.height - 2)
            })
            
            let spawn1C = SKAction.runBlock({() in
                self.background15.anchorPoint = CGPointZero
                self.background15.size = CGSize(width: 600, height: 200)
                self.background15.position = CGPoint(x: -300 + self.frame.width / 2, y: self.background2.position.y + self.background2.size.height - 2)
                self.background15.zPosition = -15
                self.background15.setScale(1.0)
                self.addChild(self.background15)})
            
            let spawn2C = SKAction.runBlock({() in
                self.background17.anchorPoint = CGPointZero
                self.background17.size = CGSize(width: 600, height: 2800)
                self.background17.position = CGPoint(x: -300 + self.frame.width / 2, y: self.background15.position.y + self.background15.size.height - 1)
                self.background17.zPosition = -15
                self.background17.setScale(1.0)
                self.addChild(self.background17)})
            
            let spawn3C = SKAction.runBlock({() in
                self.background18.anchorPoint = CGPointZero
                self.background18.size = CGSize(width: 600, height: 2800)
                self.background18.position = CGPoint(x: -300 + self.frame.width / 2, y: self.background17.position.y + self.background17.size.height - 5)
                self.background18.zPosition = -14
                self.background18.setScale(1.0)
                self.addChild(self.background18)})
            
            
            let spawn1A = SKAction.runBlock({() in self.background1.removeFromParent()})
            let spawn11A = SKAction.runBlock({() in self.background2.removeFromParent()})
            let spawn12A = SKAction.runBlock({() in self.background3.removeFromParent()})
            let spawn13A = SKAction.runBlock({() in self.background4.removeFromParent()})
            let spawn14A = SKAction.runBlock({() in self.background5.removeFromParent()})
            let spawn15A = SKAction.runBlock({() in self.background6.removeFromParent()})
            let spawn16A = SKAction.runBlock({() in self.background7.removeFromParent()})
            let spawn17A = SKAction.runBlock({() in self.background8.removeFromParent()})
            let spawn18A = SKAction.runBlock({() in self.background9.removeFromParent()})
            let spawn19A = SKAction.runBlock({() in self.background10.removeFromParent()})
            let spawn20A = SKAction.runBlock({() in self.background11.removeFromParent()})
            let spawn21A = SKAction.runBlock({() in self.background12.removeFromParent()})
            let spawn22A = SKAction.runBlock({() in self.background13.removeFromParent()})
            let spawn23A = SKAction.runBlock({() in self.background14.removeFromParent()})
            let spawn24A = SKAction.runBlock({() in self.background15.removeFromParent()})
            let spawn25A = SKAction.runBlock({() in self.background16.removeFromParent()})
            let spawn26A = SKAction.runBlock({() in self.background17.removeFromParent()})
            let spawn28A = SKAction.runBlock({() in self.background18.removeFromParent()})
            let spawn27A = SKAction.runBlock({() in self.bgImage.removeFromParent()})
            
            
            let delayA = SKAction.waitForDuration(1)
            let delayB = SKAction.waitForDuration(8)
            let delayC = SKAction.waitForDuration(3)
            let delayD = SKAction.waitForDuration(20)
            
            
            let SpawnDelayA = SKAction.sequence([
                
                delayC,spawn1A,spawn4A,delayA,spawn5A,
                delayA,spawn6A,delayA,spawn7A,
                delayA,spawn8A,delayA,spawn14A,spawn9A,delayA,spawn10A,
                
                spawn1B,delayA,spawn2B,delayA,spawn2B1,
                delayB,spawn3B,delayA,spawn4B,
                delayA,spawn5B,spawn6B,
                delayA,spawn7B,spawn8B,
                delayA,spawn9B,spawn10B,
                
                delayA,spawn2B,spawn2B1,
                delayB,spawn3B,spawn4B,
                delayA,spawn5B,spawn6B,
                delayA,spawn7B,spawn8B,
                delayA,spawn9B,spawn10B,
                
                delayA,spawn2B,delayA,spawn2B1,
                delayB,spawn3B,delayA,spawn4B,
                delayA,spawn5B,spawn6B,
                delayA,spawn7B,spawn8B,
                delayA,spawn9B,spawn10B,
                
                delayA,spawn2B,delayA,
                spawn2B1,spawn1C,
                delayA,spawn2C,delayB,spawn3C,
                spawn16A,spawn12A,spawn15A,
                spawn18A,spawn19A,spawn13A,spawn17A,
                
                spawn20A,delayB,spawn21A,spawn11A,
                spawn22A,spawn23A,delayB,
                delayB,
                
                spawn26A,spawn27A,delayB,
                spawn24A,spawn25A,delayB,delayD,
                delayD,delayD,delayB,delayB,spawn11A,spawn28A
                
                ])
            
            
            let spawncount = SKAction.repeatAction(SpawnDelayA, count: 1)
            
            self.runAction(spawncount)
            
        }
        else{
            
            if died == true{
                
                //////////////////////////////////////////////////////////////////
                //alla barra dai una posizione da dove iniziare poi con diagonale gli dici di muoversi in una direzone, non tiene contro del centro ma da dove
                //si è partiti, quindi da quella posizione si sposta di x e y segnate.
                //////////////////////////////////////////////////////////////////
                //da sinistra a destra diagonale
                //let diagonale = CGPoint(x: +700 , y: -1050)
                //barre.position = CGPoint(x: -350 + self.frame.height / 2, y: +720 + self.frame.height / 2)
                //////////////////////////////////////////////////////////////////
                //da destra a sinistra diagonale
                //let diagonale = CGPoint(x: -700 , y: -1050)
                //barre.position = CGPoint(x: +350 + self.frame.height / 2, y: +350 + self.frame.height / 2)
                //////////////////////////////////////////////////////////////////
                
                
            }
            else{
                Ghost.physicsBody?.velocity = CGVectorMake(0, 0)
                Ghost.physicsBody?.applyImpulse(CGVectorMake(0, 60))
            }
            
        }
        
        for touch in touches{
            
            let location = touch.locationInNode(self)
            
            if gameplay == true
            {
                playSoundTac(sound)
            }
            
            if self.nodeAtPoint(location) == self.pausa
            {
                pausa.removeFromParent ()  // to avoid error when you touch again
                
                pauseGame()
                resume.hidden = false
                pausa.hidden = true
                menuBTNGame.hidden = false
                gameplay = false
            }
            
            if self.nodeAtPoint(location) == self.resume
            {
                resume.hidden = true
                menuBTNGame.hidden = true
                self.physicsWorld.speed = 1.0
                self.speed = 1.0
                self.scene!.paused = false
                gameplay = true
                PausaBTN()
            }
            
            if self.nodeAtPoint(location) == self.menuBTN
            {
                NSNotificationCenter.defaultCenter().postNotificationName("showid", object: self)
                
                let nextScene = HomeScene(fileNamed:"GameScene")
                nextScene!.scaleMode = .AspectFill
                self.scene!.view?.presentScene(nextScene)
                
            }
            
            if self.nodeAtPoint(location) == self.menuBTNGame
            {
                NSNotificationCenter.defaultCenter().postNotificationName("showid", object: self)
                
                let gameScene = HomeScene(fileNamed:"GameScene")
                gameScene!.scaleMode = .AspectFill
                self.scene!.view?.presentScene(gameScene)
                
            }
            
            if self.nodeAtPoint(location) == self.tkeyBTN
            {
                
            }
            
            if self.nodeAtPoint(location) == self.replay
            {
                
                if key1 > 1 {
                    
                    Rcount += 1
                    print("Resume:",Rcount)
                    
                    key1 -= 2
                    
                    NSUserDefaults.standardUserDefaults().integerForKey("highscore")
                    NSUserDefaults.standardUserDefaults().setInteger(key1, forKey: "highscore")
                    NSUserDefaults.standardUserDefaults().synchronize()
                    
                    print("highscore:", NSUserDefaults.standardUserDefaults().integerForKey("highscore"))
                    
                    keyl.text = "\(key1)"
                    
                    self.scene!.paused = false
                    replayScene()
                    
                }
                    
                else {
                    
                    NSNotificationCenter.defaultCenter().postNotificationName("internetCheck", object: self)
                    
                    if (NSUserDefaults.standardUserDefaults().boolForKey("internet")) {
                        
                        if run < 5 {
                            
                            let alert = UIAlertController(title: "Ops!", message: "You can't resume the game, enought keys! Remember: you have a maximum of 5 resume!", preferredStyle: UIAlertControllerStyle.Alert)
                            alert.addAction(UIAlertAction(title: "Watch A Video", style: UIAlertActionStyle.Default)  { _ in
                                
                                self.run += 1
                                
                                print(self.run)
                                
                                self.Rcount += 1
                                print("Resume:",self.Rcount)
                                
                                NSNotificationCenter.defaultCenter().postNotificationName("showid", object: self)
                                
                                if MyVariables.keymore == true {
                                    
                                    self.replayScene2()
                                }
                                
                                })
                            
                            alert.addAction(UIAlertAction(title: "Get Keys!", style: UIAlertActionStyle.Default)  { _ in
                                
                                let gameScene = KeyShop(fileNamed:"GameScene")
                                gameScene!.scaleMode = SKSceneScaleMode.AspectFill
                                self.scene!.view?.presentScene(gameScene)
                                
                                })
                            
                            alert.addAction(UIAlertAction(title: "Cancel", style: UIAlertActionStyle.Default) { _ in })
                            
                            self.view?.window?.rootViewController?.presentViewController(alert, animated: true, completion: nil)
                            
                        }
                        
                        if run > 4 {
                            
                            let alert = UIAlertController(title: "Ops!", message: "You can't resume the game, you have done too many times! Ok for restart the game.", preferredStyle: UIAlertControllerStyle.Alert)
                            alert.addAction(UIAlertAction(title: "Cancel", style: UIAlertActionStyle.Default) { _ in })
                            alert.addAction(UIAlertAction(title: "OK", style: UIAlertActionStyle.Default)  { _ in
                                
                                self.scene!.paused = false
                                self.restartScene()
                                
                                })
                            
                            self.view?.window?.rootViewController?.presentViewController(alert, animated: true, completion: nil)
                            
                        }
                    }
                }
            }
            
            if self.nodeAtPoint(location) == self.restartBTN
            {
                self.scene!.paused = false
                restartScene()
            }
            
            if tapToreStart.hidden == false {
                
                died = false
                gameplay = true
                self.physicsWorld.speed = 1.0
                self.speed = 1.0
                
                tapToreStart.hidden = true
                pausa.hidden = false
                
            }
            
        }
    }
    
    // D DA SINISTRA
    // S DA DIAGONALE
    
    func createStella(){
        
        let stella = SKSpriteNode(imageNamed: "StellaC")
        stella.anchorPoint = CGPointZero
        stella.size = CGSize(width: 5, height: 5)
        stella.position = CGPoint(x: self.frame.width / 2, y: self.frame.height / 2 + 600)
        stella.zPosition = -1
        
        let randomPosition = CGFloat.random(min: -250, max: +250)
        stella.position.x = stella.position.x +  randomPosition
        
        let randomPosition1 = CGFloat.random(min: -150, max: +150)
        stella.position.y = stella.position.y +  randomPosition1
        
        stella.runAction(moveAndRemoveS1)
        self.addChild(stella)
        
    }
    
    func stellaFunc2(){
        
        self.physicsWorld.contactDelegate = self
        
        Stella = SKNode()
        StellaSize = SKSpriteNode()
        
        let stella = SKSpriteNode(imageNamed: "Stella")
        //misura da quando inizia a segnare che ci si a il tocco
        StellaSize.size = CGSize(width: 50, height: 70)
        stella.position = CGPoint(x: self.frame.height / 2 + 450, y: self.frame.height / 2)
        stella.setScale(0.4)
        stella.physicsBody = SKPhysicsBody(rectangleOfSize: StellaSize.size)
        stella.physicsBody?.categoryBitMask = PhysicsCatagoryN.Stella
        stella.physicsBody?.collisionBitMask = PhysicsCatagoryN.Ghost
        stella.physicsBody?.contactTestBitMask  = PhysicsCatagoryN.Ghost
        stella.physicsBody?.affectedByGravity = false
        stella.physicsBody?.dynamic = false
        Stella.zPosition = 3
        
        let randomPosition = CGFloat.random(min: -255, max: +275)
        stella.position.y = stella.position.y +  randomPosition
        
        Stella.addChild(StellaSize)
        Stella.addChild(stella)
        Stella.runAction(moveAndRemoveS2)
        self.addChild(Stella)
        
    }
    
    func stellaFunc(){
        
        self.physicsWorld.contactDelegate = self
        
        Stella = SKNode()
        StellaSize = SKSpriteNode()
        
        let stella = SKSpriteNode(imageNamed: "Stella")
        //misura da quando inizia a segnare che ci si a il tocco
        StellaSize.size = CGSize(width: 50, height: 70)
        stella.position = CGPoint(x: self.frame.height / 2 - 170, y: self.frame.height / 2)
        stella.setScale(0.4)
        stella.physicsBody = SKPhysicsBody(rectangleOfSize: StellaSize.size)
        stella.physicsBody?.categoryBitMask = PhysicsCatagoryN.Stella
        stella.physicsBody?.collisionBitMask = PhysicsCatagoryN.Ghost
        stella.physicsBody?.contactTestBitMask  = PhysicsCatagoryN.Ghost
        stella.physicsBody?.affectedByGravity = false
        stella.physicsBody?.dynamic = false
        Stella.zPosition = 3
        
        let randomPosition = CGFloat.random(min: -255, max: +275)
        stella.position.y = stella.position.y +  randomPosition
        
        Stella.addChild(StellaSize)
        Stella.addChild(stella)
        Stella.runAction(moveAndRemoveS)
        self.addChild(Stella)
        
    }
    
    func createBarre9S(){
        
        self.physicsWorld.contactDelegate = self
        
        Barre = SKNode()
        BarreSize = SKSpriteNode()
        
        let barre = SKSpriteNode(imageNamed: "ShuttleS")
        //misura da quando inizia a segnare che ci si a il tocco
        BarreSize.size = CGSize(width: 80, height: 40)
        //da dove parte
        barre.position = CGPoint(x: -350 + self.frame.height / 2, y: -720 + self.frame.height / 2)
        barre.setScale(0.1)
        barre.physicsBody = SKPhysicsBody(rectangleOfSize: BarreSize.size)
        barre.physicsBody?.categoryBitMask = PhysicsCatagoryN.Barre
        barre.physicsBody?.collisionBitMask = PhysicsCatagoryN.Ghost
        barre.physicsBody?.contactTestBitMask  = PhysicsCatagoryN.Ghost
        barre.physicsBody?.affectedByGravity = false
        barre.physicsBody?.dynamic = false
        Barre.zPosition = 0
        
        Barre.addChild(BarreSize)
        Barre.addChild(barre)
        Barre.runAction(moveAndRemove2S)
        self.addChild(Barre)
        
    }
    
    func createBarre9D(){
        
        self.physicsWorld.contactDelegate = self
        
        Barre = SKNode()
        BarreSize = SKSpriteNode()
        
        let barre = SKSpriteNode(imageNamed: "ShuttleD")
        //misura da quando inizia a segnare che ci si a il tocco
        BarreSize.size = CGSize(width: 100, height: 50)
        //da dove parte
        barre.position = CGPoint(x: self.frame.height / 2 + 450, y: self.frame.height / 2)
        barre.setScale(0.12)
        barre.physicsBody = SKPhysicsBody(rectangleOfSize: BarreSize.size)
        barre.physicsBody?.categoryBitMask = PhysicsCatagory.Barre
        barre.physicsBody?.collisionBitMask = PhysicsCatagory.Ghost
        barre.physicsBody?.contactTestBitMask  = PhysicsCatagory.Ghost
        barre.physicsBody?.affectedByGravity = false
        barre.physicsBody?.dynamic = false
        Barre.zPosition = 3
        
        let randomPosition = CGFloat.random(min: -255, max: +275)
        barre.position.y = barre.position.y +  randomPosition
        
        Barre.addChild(BarreSize)
        Barre.addChild(barre)
        Barre.runAction(moveAndRemove3D)
        self.addChild(Barre)
        
    }
    
    func createBarre9(){
        
        self.physicsWorld.contactDelegate = self
        
        Barre = SKNode()
        BarreSize = SKSpriteNode()
        
        let barre = SKSpriteNode(imageNamed: "Shuttle")
        //misura da quando inizia a segnare che ci si a il tocco
        BarreSize.size = CGSize(width: 100, height: 50)
        //da dove parte
        barre.position = CGPoint(x: self.frame.height / 2 - 170, y: self.frame.height / 2)
        barre.setScale(0.12)
        barre.physicsBody = SKPhysicsBody(rectangleOfSize: BarreSize.size)
        barre.physicsBody?.categoryBitMask = PhysicsCatagory.Barre
        barre.physicsBody?.collisionBitMask = PhysicsCatagory.Ghost
        barre.physicsBody?.contactTestBitMask  = PhysicsCatagory.Ghost
        barre.physicsBody?.affectedByGravity = false
        barre.physicsBody?.dynamic = false
        Barre.zPosition = 3
        
        let randomPosition = CGFloat.random(min: -255, max: +275)
        barre.position.y = barre.position.y +  randomPosition
        
        Barre.addChild(BarreSize)
        Barre.addChild(barre)
        Barre.runAction(moveAndRemove3)
        self.addChild(Barre)
        
    }
    
    func createBarre8D(){
        
        self.physicsWorld.contactDelegate = self
        
        Barre = SKNode()
        BarreSize = SKSpriteNode()
        
        let barre = SKSpriteNode(imageNamed: "AereoS")
        //misura da quando inizia a segnare che ci si a il tocco
        BarreSize.size = CGSize(width: 70, height: 20)
        barre.position = CGPoint(x: self.frame.height / 2 + 450, y: self.frame.height / 2)
        barre.setScale(0.15)
        barre.physicsBody = SKPhysicsBody(rectangleOfSize: BarreSize.size)
        barre.physicsBody?.categoryBitMask = PhysicsCatagoryN.Barre
        barre.physicsBody?.collisionBitMask = PhysicsCatagoryN.Ghost
        barre.physicsBody?.contactTestBitMask  = PhysicsCatagoryN.Ghost
        barre.physicsBody?.affectedByGravity = false
        barre.physicsBody?.dynamic = false
        Barre.zPosition = 3
        
        let randomPosition = CGFloat.random(min: -255, max: +275)
        barre.position.y = barre.position.y +  randomPosition
        
        Barre.addChild(BarreSize)
        Barre.addChild(barre)
        Barre.runAction(moveAndRemove4D)
        self.addChild(Barre)
        
        
    }
    
    func createBarre8(){
        
        self.physicsWorld.contactDelegate = self
        
        Barre = SKNode()
        BarreSize = SKSpriteNode()
        
        let barre = SKSpriteNode(imageNamed: "Aereo")
        //misura da quando inizia a segnare che ci si a il tocco
        BarreSize.size = CGSize(width: 100, height: 50)
        barre.position = CGPoint(x: self.frame.height / 2 - 170, y: self.frame.height / 2)
        barre.setScale(0.15)
        barre.physicsBody = SKPhysicsBody(rectangleOfSize: BarreSize.size)
        barre.physicsBody?.categoryBitMask = PhysicsCatagoryN.Barre
        barre.physicsBody?.collisionBitMask = PhysicsCatagoryN.Ghost
        barre.physicsBody?.contactTestBitMask  = PhysicsCatagoryN.Ghost
        barre.physicsBody?.affectedByGravity = false
        barre.physicsBody?.dynamic = false
        Barre.zPosition = 3
        
        let randomPosition = CGFloat.random(min: -255, max: +275)
        barre.position.y = barre.position.y +  randomPosition
        
        Barre.addChild(BarreSize)
        Barre.addChild(barre)
        Barre.runAction(moveAndRemove4)
        self.addChild(Barre)
        
        
    }
    
    func createBarre7S(){
        
        self.physicsWorld.contactDelegate = self
        
        Barre = SKNode()
        BarreSize = SKSpriteNode()
        
        let barre = SKSpriteNode(imageNamed: "VeloceD")
        //misura da quando inizia a segnare che ci si a il tocco
        BarreSize.size = CGSize(width: 80, height: 40)
        //da dove parte
        barre.position = CGPoint(x: -350 + self.frame.height / 2, y: +720 + self.frame.height / 2)
        barre.setScale(0.1)
        barre.physicsBody = SKPhysicsBody(rectangleOfSize: BarreSize.size)
        barre.physicsBody?.categoryBitMask = PhysicsCatagoryN.Barre
        barre.physicsBody?.collisionBitMask = PhysicsCatagoryN.Ghost
        barre.physicsBody?.contactTestBitMask  = PhysicsCatagoryN.Ghost
        barre.physicsBody?.affectedByGravity = false
        barre.physicsBody?.dynamic = false
        Barre.zPosition = 0
        
        Barre.addChild(BarreSize)
        Barre.addChild(barre)
        Barre.runAction(moveAndRemove1S)
        self.addChild(Barre)
        
    }
    
    func createBarre7D(){
        
        self.physicsWorld.contactDelegate = self
        
        Barre = SKNode()
        BarreSize = SKSpriteNode()
        
        let barre = SKSpriteNode(imageNamed: "AereoS")
        //misura da quando inizia a segnare che ci si a il tocco
        BarreSize.size = CGSize(width: 70, height: 20)
        barre.position = CGPoint(x: self.frame.height / 2 + 450, y: self.frame.height / 2)
        barre.setScale(0.15)
        barre.physicsBody = SKPhysicsBody(rectangleOfSize: BarreSize.size)
        barre.physicsBody?.categoryBitMask = PhysicsCatagoryN.Barre
        barre.physicsBody?.collisionBitMask = PhysicsCatagoryN.Ghost
        barre.physicsBody?.contactTestBitMask  = PhysicsCatagoryN.Ghost
        barre.physicsBody?.affectedByGravity = false
        barre.physicsBody?.dynamic = false
        Barre.zPosition = 3
        
        let randomPosition = CGFloat.random(min: -255, max: +275)
        barre.position.y = barre.position.y +  randomPosition
        
        Barre.addChild(BarreSize)
        Barre.addChild(barre)
        Barre.runAction(moveAndRemove3D)
        self.addChild(Barre)
        
        
    }
    
    func createBarre7(){
        
        self.physicsWorld.contactDelegate = self
        
        Barre = SKNode()
        BarreSize = SKSpriteNode()
        
        let barre = SKSpriteNode(imageNamed: "Aereo")
        //misura da quando inizia a segnare che ci si a il tocco
        BarreSize.size = CGSize(width: 100, height: 50)
        barre.position = CGPoint(x: self.frame.height / 2 - 170, y: self.frame.height / 2)
        barre.setScale(0.15)
        barre.physicsBody = SKPhysicsBody(rectangleOfSize: BarreSize.size)
        barre.physicsBody?.categoryBitMask = PhysicsCatagoryN.Barre
        barre.physicsBody?.collisionBitMask = PhysicsCatagoryN.Ghost
        barre.physicsBody?.contactTestBitMask  = PhysicsCatagoryN.Ghost
        barre.physicsBody?.affectedByGravity = false
        barre.physicsBody?.dynamic = false
        Barre.zPosition = 3
        
        let randomPosition = CGFloat.random(min: -255, max: +275)
        barre.position.y = barre.position.y +  randomPosition
        
        Barre.addChild(BarreSize)
        Barre.addChild(barre)
        Barre.runAction(moveAndRemove3)
        self.addChild(Barre)
        
        
    }
    
    func createBarre6S(){
        
        self.physicsWorld.contactDelegate = self
        
        Barre = SKNode()
        BarreSize = SKSpriteNode()
        
        let barre = SKSpriteNode(imageNamed: "VeloceD2D")
        //misura da quando inizia a segnare che ci si a il tocco
        BarreSize.size = CGSize(width: 80, height: 40)
        //da dove parte
        barre.position = CGPoint(x: 350 + self.frame.height / 2, y: +350 + self.frame.height / 2)
        barre.setScale(0.1)
        barre.physicsBody = SKPhysicsBody(rectangleOfSize: BarreSize.size)
        barre.physicsBody?.categoryBitMask = PhysicsCatagoryN.Barre
        barre.physicsBody?.collisionBitMask = PhysicsCatagoryN.Ghost
        barre.physicsBody?.contactTestBitMask  = PhysicsCatagoryN.Ghost
        barre.physicsBody?.affectedByGravity = false
        barre.physicsBody?.dynamic = false
        Barre.zPosition = 0
        
        Barre.addChild(BarreSize)
        Barre.addChild(barre)
        Barre.runAction(moveAndRemove3S)
        self.addChild(Barre)
        
    }
    
    func createBarre6D(){
        
        self.physicsWorld.contactDelegate = self
        
        Barre = SKNode()
        BarreSize = SKSpriteNode()
        
        let barre = SKSpriteNode(imageNamed: "AereoS")
        //misura da quando inizia a segnare che ci si a il tocco
        BarreSize.size = CGSize(width: 70, height: 20)
        barre.position = CGPoint(x: self.frame.height / 2 + 450, y: self.frame.height / 2)
        barre.setScale(0.15)
        barre.physicsBody = SKPhysicsBody(rectangleOfSize: BarreSize.size)
        barre.physicsBody?.categoryBitMask = PhysicsCatagoryN.Barre
        barre.physicsBody?.collisionBitMask = PhysicsCatagoryN.Ghost
        barre.physicsBody?.contactTestBitMask  = PhysicsCatagoryN.Ghost
        barre.physicsBody?.affectedByGravity = false
        barre.physicsBody?.dynamic = false
        Barre.zPosition = 3
        
        let randomPosition = CGFloat.random(min: -255, max: +275)
        barre.position.y = barre.position.y +  randomPosition
        
        Barre.addChild(BarreSize)
        Barre.addChild(barre)
        Barre.runAction(moveAndRemove2D)
        self.addChild(Barre)
        
    }
    
    func createBarre6(){
        
        self.physicsWorld.contactDelegate = self
        
        Barre = SKNode()
        BarreSize = SKSpriteNode()
        
        let barre = SKSpriteNode(imageNamed: "Aereo")
        //misura da quando inizia a segnare che ci si a il tocco
        BarreSize.size = CGSize(width: 100, height: 50)
        barre.position = CGPoint(x: self.frame.height / 2 - 170, y: self.frame.height / 2)
        barre.setScale(0.15)
        barre.physicsBody = SKPhysicsBody(rectangleOfSize: BarreSize.size)
        barre.physicsBody?.categoryBitMask = PhysicsCatagoryN.Barre
        barre.physicsBody?.collisionBitMask = PhysicsCatagoryN.Ghost
        barre.physicsBody?.contactTestBitMask  = PhysicsCatagoryN.Ghost
        barre.physicsBody?.affectedByGravity = false
        barre.physicsBody?.dynamic = false
        Barre.zPosition = 3
        
        let randomPosition = CGFloat.random(min: -255, max: +275)
        barre.position.y = barre.position.y +  randomPosition
        
        Barre.addChild(BarreSize)
        Barre.addChild(barre)
        Barre.runAction(moveAndRemove2)
        self.addChild(Barre)
        
    }
    
    func createBarre5S(){
        
        self.physicsWorld.contactDelegate = self
        
        Barre = SKNode()
        BarreSize = SKSpriteNode()
        
        let barre = SKSpriteNode(imageNamed: "VeloceD2")
        //misura da quando inizia a segnare che ci si a il tocco
        BarreSize.size = CGSize(width: 80, height: 40)
        //da dove parte
        barre.position = CGPoint(x: -350 + self.frame.height / 2, y: -700 + self.frame.height / 2)
        barre.setScale(0.1)
        barre.physicsBody = SKPhysicsBody(rectangleOfSize: BarreSize.size)
        barre.physicsBody?.categoryBitMask = PhysicsCatagoryN.Barre
        barre.physicsBody?.collisionBitMask = PhysicsCatagoryN.Ghost
        barre.physicsBody?.contactTestBitMask  = PhysicsCatagoryN.Ghost
        barre.physicsBody?.affectedByGravity = false
        barre.physicsBody?.dynamic = false
        Barre.zPosition = 0
        
        Barre.addChild(BarreSize)
        Barre.addChild(barre)
        Barre.runAction(moveAndRemove2S)
        self.addChild(Barre)
        
    }
    
    func createBarre5D(){
        
        self.physicsWorld.contactDelegate = self
        
        Barre = SKNode()
        BarreSize = SKSpriteNode()
        
        let barre = SKSpriteNode(imageNamed: "AereoS")
        //misura da quando inizia a segnare che ci si a il tocco
        BarreSize.size = CGSize(width: 70, height: 20)
        //da dove parte
        barre.position = CGPoint(x: self.frame.height / 2 + 450, y: self.frame.height / 2)
        barre.setScale(0.15)
        barre.physicsBody = SKPhysicsBody(rectangleOfSize: BarreSize.size)
        barre.physicsBody?.categoryBitMask = PhysicsCatagoryN.Barre
        barre.physicsBody?.collisionBitMask = PhysicsCatagoryN.Ghost
        barre.physicsBody?.contactTestBitMask  = PhysicsCatagoryN.Ghost
        barre.physicsBody?.affectedByGravity = false
        barre.physicsBody?.dynamic = false
        Barre.zPosition = 3
        
        let randomPosition = CGFloat.random(min: -255, max: +275)
        barre.position.y = barre.position.y +  randomPosition
        
        Barre.addChild(BarreSize)
        Barre.addChild(barre)
        Barre.runAction(moveAndRemove1D)
        self.addChild(Barre)
        
    }
    
    func createBarre5(){
        
        self.physicsWorld.contactDelegate = self
        
        Barre = SKNode()
        BarreSize = SKSpriteNode()
        
        let barre = SKSpriteNode(imageNamed: "Aereo")
        //misura da quando inizia a segnare che ci si a il tocco
        BarreSize.size = CGSize(width: 100, height: 50)
        //da dove parte
        barre.position = CGPoint(x: self.frame.height / 2 - 170, y: self.frame.height / 2)
        barre.setScale(0.15)
        barre.physicsBody = SKPhysicsBody(rectangleOfSize: BarreSize.size)
        barre.physicsBody?.categoryBitMask = PhysicsCatagoryN.Barre
        barre.physicsBody?.collisionBitMask = PhysicsCatagoryN.Ghost
        barre.physicsBody?.contactTestBitMask  = PhysicsCatagoryN.Ghost
        barre.physicsBody?.affectedByGravity = false
        barre.physicsBody?.dynamic = false
        Barre.zPosition = 3
        
        let randomPosition = CGFloat.random(min: -255, max: +275)
        barre.position.y = barre.position.y +  randomPosition
        
        Barre.addChild(BarreSize)
        Barre.addChild(barre)
        Barre.runAction(moveAndRemove1)
        self.addChild(Barre)
        
    }
    
    func createBarre4S(){
        
        self.physicsWorld.contactDelegate = self
        
        Barre = SKNode()
        BarreSize = SKSpriteNode()
        
        let barre = SKSpriteNode(imageNamed: "VeloceD")
        //misura da quando inizia a segnare che ci si a il tocco
        BarreSize.size = CGSize(width: 50, height: 10)
        //da dove parte
        barre.position = CGPoint(x: -350 + self.frame.height / 2, y: +720 + self.frame.height / 2)
        barre.setScale(0.1)
        barre.physicsBody = SKPhysicsBody(rectangleOfSize: BarreSize.size)
        barre.physicsBody?.categoryBitMask = PhysicsCatagoryN.Barre
        barre.physicsBody?.collisionBitMask = PhysicsCatagoryN.Ghost
        barre.physicsBody?.contactTestBitMask  = PhysicsCatagoryN.Ghost
        barre.physicsBody?.affectedByGravity = false
        barre.physicsBody?.dynamic = false
        Barre.zPosition = 0
        
        Barre.addChild(BarreSize)
        Barre.addChild(barre)
        Barre.runAction(moveAndRemove1S)
        self.addChild(Barre)
        
    }
    
    func createBarre4D(){
        
        self.physicsWorld.contactDelegate = self
        
        Barre = SKNode()
        BarreSize = SKSpriteNode()
        
        let barre = SKSpriteNode(imageNamed: "VeloceS")
        //misura da quando inizia a segnare che ci si a il tocco
        BarreSize.size = CGSize(width: 80, height: 40)
        barre.position = CGPoint(x: self.frame.height / 2 + 450, y: self.frame.height / 2)
        barre.setScale(0.1)
        barre.physicsBody = SKPhysicsBody(rectangleOfSize: BarreSize.size)
        barre.physicsBody?.categoryBitMask = PhysicsCatagoryN.Barre
        barre.physicsBody?.collisionBitMask = PhysicsCatagoryN.Ghost
        barre.physicsBody?.contactTestBitMask  = PhysicsCatagoryN.Ghost
        barre.physicsBody?.affectedByGravity = false
        barre.physicsBody?.dynamic = false
        Barre.zPosition = 3
        
        let randomPosition = CGFloat.random(min: -255, max: +275)
        barre.position.y = barre.position.y +  randomPosition
        
        Barre.addChild(BarreSize)
        Barre.addChild(barre)
        Barre.runAction(moveAndRemove4D)
        self.addChild(Barre)
        
        
    }
    
    func createBarre4(){
        
        self.physicsWorld.contactDelegate = self
        
        Barre = SKNode()
        BarreSize = SKSpriteNode()
        
        let barre = SKSpriteNode(imageNamed: "Veloce")
        //misura da quando inizia a segnare che ci si a il tocco
        BarreSize.size = CGSize(width: 80, height: 40)
        barre.position = CGPoint(x: self.frame.height / 2 - 170, y: self.frame.height / 2)
        barre.setScale(0.1)
        barre.physicsBody = SKPhysicsBody(rectangleOfSize: BarreSize.size)
        barre.physicsBody?.categoryBitMask = PhysicsCatagoryN.Barre
        barre.physicsBody?.collisionBitMask = PhysicsCatagoryN.Ghost
        barre.physicsBody?.contactTestBitMask  = PhysicsCatagoryN.Ghost
        barre.physicsBody?.affectedByGravity = false
        barre.physicsBody?.dynamic = false
        Barre.zPosition = 3
        
        let randomPosition = CGFloat.random(min: -255, max: +275)
        barre.position.y = barre.position.y +  randomPosition
        
        Barre.addChild(BarreSize)
        Barre.addChild(barre)
        Barre.runAction(moveAndRemove4)
        self.addChild(Barre)
        
        
    }
    
    func createBarre3S(){
        
        self.physicsWorld.contactDelegate = self
        
        Barre = SKNode()
        BarreSize = SKSpriteNode()
        
        let barre = SKSpriteNode(imageNamed: "MedioVD")
        //misura da quando inizia a segnare che ci si a il tocco
        BarreSize.size = CGSize(width: 50, height: 10)
        //da dove parte
        barre.position = CGPoint(x: -350 + self.frame.height / 2, y: +720 + self.frame.height / 2)
        barre.setScale(0.1)
        barre.physicsBody = SKPhysicsBody(rectangleOfSize: BarreSize.size)
        barre.physicsBody?.categoryBitMask = PhysicsCatagoryN.Barre
        barre.physicsBody?.collisionBitMask = PhysicsCatagoryN.Ghost
        barre.physicsBody?.contactTestBitMask  = PhysicsCatagoryN.Ghost
        barre.physicsBody?.affectedByGravity = false
        barre.physicsBody?.dynamic = false
        Barre.zPosition = 0
        
        Barre.addChild(BarreSize)
        Barre.addChild(barre)
        Barre.runAction(moveAndRemove1S)
        self.addChild(Barre)
        
    }
    
    func createBarre3D(){
        
        self.physicsWorld.contactDelegate = self
        
        Barre = SKNode()
        BarreSize = SKSpriteNode()
        
        let barre = SKSpriteNode(imageNamed: "MedioVS")
        //misura da quando inizia a segnare che ci si a il tocco
        BarreSize.size = CGSize(width: 80, height: 40)
        barre.position = CGPoint(x: self.frame.height / 2 + 450, y: self.frame.height / 2)
        barre.setScale(0.1)
        barre.physicsBody = SKPhysicsBody(rectangleOfSize: BarreSize.size)
        barre.physicsBody?.categoryBitMask = PhysicsCatagoryN.Barre
        barre.physicsBody?.collisionBitMask = PhysicsCatagoryN.Ghost
        barre.physicsBody?.contactTestBitMask  = PhysicsCatagoryN.Ghost
        barre.physicsBody?.affectedByGravity = false
        barre.physicsBody?.dynamic = false
        Barre.zPosition = 3
        
        let randomPosition = CGFloat.random(min: -255, max: +275)
        barre.position.y = barre.position.y +  randomPosition
        
        Barre.addChild(BarreSize)
        Barre.addChild(barre)
        Barre.runAction(moveAndRemove3D)
        self.addChild(Barre)
        
        
    }
    
    func createBarre3(){
        
        self.physicsWorld.contactDelegate = self
        
        Barre = SKNode()
        BarreSize = SKSpriteNode()
        
        let barre = SKSpriteNode(imageNamed: "MedioV")
        //misura da quando inizia a segnare che ci si a il tocco
        BarreSize.size = CGSize(width: 80, height: 40)
        barre.position = CGPoint(x: self.frame.height / 2 - 170, y: self.frame.height / 2)
        barre.setScale(0.1)
        barre.physicsBody = SKPhysicsBody(rectangleOfSize: BarreSize.size)
        barre.physicsBody?.categoryBitMask = PhysicsCatagoryN.Barre
        barre.physicsBody?.collisionBitMask = PhysicsCatagoryN.Ghost
        barre.physicsBody?.contactTestBitMask  = PhysicsCatagoryN.Ghost
        barre.physicsBody?.affectedByGravity = false
        barre.physicsBody?.dynamic = false
        Barre.zPosition = 3
        
        let randomPosition = CGFloat.random(min: -255, max: +275)
        barre.position.y = barre.position.y +  randomPosition
        
        Barre.addChild(BarreSize)
        Barre.addChild(barre)
        Barre.runAction(moveAndRemove3)
        self.addChild(Barre)
        
        
    }
    
    func createBarre2S(){
        
        self.physicsWorld.contactDelegate = self
        
        Barre = SKNode()
        BarreSize = SKSpriteNode()
        
        let barre = SKSpriteNode(imageNamed: "MedioLD")
        //misura da quando inizia a segnare che ci si a il tocco
        BarreSize.size = CGSize(width: 50, height: 10)
        //da dove parte
        barre.position = CGPoint(x: -350 + self.frame.height / 2, y: +720 + self.frame.height / 2)
        barre.setScale(0.1)
        barre.physicsBody = SKPhysicsBody(rectangleOfSize: BarreSize.size)
        barre.physicsBody?.categoryBitMask = PhysicsCatagoryN.Barre
        barre.physicsBody?.collisionBitMask = PhysicsCatagoryN.Ghost
        barre.physicsBody?.contactTestBitMask  = PhysicsCatagoryN.Ghost
        barre.physicsBody?.affectedByGravity = false
        barre.physicsBody?.dynamic = false
        Barre.zPosition = 0
        
        Barre.addChild(BarreSize)
        Barre.addChild(barre)
        Barre.runAction(moveAndRemove1S)
        self.addChild(Barre)
        
    }
    
    func createBarre2D(){
        
        self.physicsWorld.contactDelegate = self
        
        Barre = SKNode()
        BarreSize = SKSpriteNode()
        
        let barre = SKSpriteNode(imageNamed: "MedioLS")
        //misura da quando inizia a segnare che ci si a il tocco
        BarreSize.size = CGSize(width: 80, height: 40)
        barre.position = CGPoint(x: self.frame.height / 2 + 450, y: self.frame.height / 2)
        barre.setScale(0.1)
        barre.physicsBody = SKPhysicsBody(rectangleOfSize: BarreSize.size)
        barre.physicsBody?.categoryBitMask = PhysicsCatagoryN.Barre
        barre.physicsBody?.collisionBitMask = PhysicsCatagoryN.Ghost
        barre.physicsBody?.contactTestBitMask  = PhysicsCatagoryN.Ghost
        barre.physicsBody?.affectedByGravity = false
        barre.physicsBody?.dynamic = false
        Barre.zPosition = 3
        
        let randomPosition = CGFloat.random(min: -255, max: +275)
        barre.position.y = barre.position.y +  randomPosition
        
        Barre.addChild(BarreSize)
        Barre.addChild(barre)
        Barre.runAction(moveAndRemove2D)
        self.addChild(Barre)
        
    }
    
    func createBarre2(){
        
        self.physicsWorld.contactDelegate = self
        
        Barre = SKNode()
        BarreSize = SKSpriteNode()
        
        let barre = SKSpriteNode(imageNamed: "MedioL")
        //misura da quando inizia a segnare che ci si a il tocco
        BarreSize.size = CGSize(width: 80, height: 40)
        barre.position = CGPoint(x: self.frame.height / 2 - 170, y: self.frame.height / 2)
        barre.setScale(0.1)
        barre.physicsBody = SKPhysicsBody(rectangleOfSize: BarreSize.size)
        barre.physicsBody?.categoryBitMask = PhysicsCatagoryN.Barre
        barre.physicsBody?.collisionBitMask = PhysicsCatagoryN.Ghost
        barre.physicsBody?.contactTestBitMask  = PhysicsCatagoryN.Ghost
        barre.physicsBody?.affectedByGravity = false
        barre.physicsBody?.dynamic = false
        Barre.zPosition = 3
        
        let randomPosition = CGFloat.random(min: -255, max: +275)
        barre.position.y = barre.position.y +  randomPosition
        
        Barre.addChild(BarreSize)
        Barre.addChild(barre)
        Barre.runAction(moveAndRemove2)
        self.addChild(Barre)
        
    }
    
    func createBarre1S(){
        
        self.physicsWorld.contactDelegate = self
        
        Barre = SKNode()
        BarreSize = SKSpriteNode()
        
        let barre = SKSpriteNode(imageNamed: "PianoD")
        //misura da quando inizia a segnare che ci si a il tocco
        BarreSize.size = CGSize(width: 50, height: 10)
        //da dove parte
        barre.position = CGPoint(x: -350 + self.frame.height / 2, y: +720 + self.frame.height / 2)
        barre.setScale(0.1)
        barre.physicsBody = SKPhysicsBody(rectangleOfSize: BarreSize.size)
        barre.physicsBody?.categoryBitMask = PhysicsCatagoryN.Barre
        barre.physicsBody?.collisionBitMask = PhysicsCatagoryN.Ghost
        barre.physicsBody?.contactTestBitMask  = PhysicsCatagoryN.Ghost
        barre.physicsBody?.affectedByGravity = false
        barre.physicsBody?.dynamic = false
        Barre.zPosition = 0
        
        Barre.addChild(BarreSize)
        Barre.addChild(barre)
        Barre.runAction(moveAndRemove1S)
        self.addChild(Barre)
        
    }
    
    func createBarre1D(){
        
        self.physicsWorld.contactDelegate = self
        
        Barre = SKNode()
        BarreSize = SKSpriteNode()
        
        let barre = SKSpriteNode(imageNamed: "PianoS")
        //misura da quando inizia a segnare che ci si a il tocco
        BarreSize.size = CGSize(width: 80, height: 40)
        //da dove parte
        barre.position = CGPoint(x: self.frame.height / 2 + 450, y: self.frame.height / 2)
        barre.setScale(0.1)
        barre.physicsBody = SKPhysicsBody(rectangleOfSize: BarreSize.size)
        barre.physicsBody?.categoryBitMask = PhysicsCatagoryN.Barre
        barre.physicsBody?.collisionBitMask = PhysicsCatagoryN.Ghost
        barre.physicsBody?.contactTestBitMask  = PhysicsCatagoryN.Ghost
        barre.physicsBody?.affectedByGravity = false
        barre.physicsBody?.dynamic = false
        Barre.zPosition = 3
        
        let randomPosition = CGFloat.random(min: -255, max: +275)
        barre.position.y = barre.position.y +  randomPosition
        
        Barre.addChild(BarreSize)
        Barre.addChild(barre)
        Barre.runAction(moveAndRemove1D)
        self.addChild(Barre)
        
    }
    
    func createBarre1(){
        
        self.physicsWorld.contactDelegate = self
        
        Barre = SKNode()
        BarreSize = SKSpriteNode()
        
        let barre = SKSpriteNode(imageNamed: "Piano")
        //misura da quando inizia a segnare che ci si a il tocco
        BarreSize.size = CGSize(width: 80, height: 40)
        //da dove parte
        barre.position = CGPoint(x: self.frame.height / 2 - 170, y: self.frame.height / 2)
        barre.setScale(0.1)
        barre.physicsBody = SKPhysicsBody(rectangleOfSize: BarreSize.size)
        barre.physicsBody?.categoryBitMask = PhysicsCatagoryN.Barre
        barre.physicsBody?.collisionBitMask = PhysicsCatagoryN.Ghost
        barre.physicsBody?.contactTestBitMask  = PhysicsCatagoryN.Ghost
        barre.physicsBody?.affectedByGravity = false
        barre.physicsBody?.dynamic = false
        Barre.zPosition = 3
        
        let randomPosition = CGFloat.random(min: -255, max: +275)
        barre.position.y = barre.position.y +  randomPosition
        
        Barre.addChild(BarreSize)
        Barre.addChild(barre)
        Barre.runAction(moveAndRemove1)
        self.addChild(Barre)
        
    }
    
    func createWalls(){
        
        let scoreNode = SKSpriteNode()
        //larghezza e lunghezza linea dello score che è attaccata alle "wall"
        scoreNode.size = CGSize(width: 200, height: 1)
        scoreNode.position = CGPoint(x: self.frame.width / 2, y: self.frame.height)
        scoreNode.physicsBody = SKPhysicsBody(rectangleOfSize: scoreNode.size)
        scoreNode.physicsBody?.affectedByGravity = false
        scoreNode.physicsBody?.dynamic = false
        scoreNode.physicsBody?.categoryBitMask = PhysicsCatagoryH.Score
        scoreNode.physicsBody?.collisionBitMask = 0
        scoreNode.color = SKColor.redColor()
        scoreNode.zPosition = -1

        
        wallPair = SKNode()
        
        let btmWall = SKSpriteNode(imageNamed: "Rosso")
        btmWall.position = CGPoint(x: 0 + self.frame.height / 2, y: self.frame.height)
        btmWall.size = CGSize(width: 500, height: 25)
        btmWall.zPosition = 0

        
        wallPair.addChild(btmWall)
        //Posizione livello
        wallPair.zPosition = 1
        wallPair.addChild(scoreNode)
        wallPair.runAction(moveAndRemove)
        self.addChild(wallPair)
        
    }
    
    override func update(currentTime: CFTimeInterval) {
        
        if gameplay == true{
            
            background1.position = CGPointMake(background1.position.x, background1.position.y - 2.5)
            background2.position = CGPointMake(background2.position.x, background2.position.y - 2.5)
            background3.position = CGPointMake(background3.position.x, background3.position.y - 2.5)
            background4.position = CGPointMake(background4.position.x, background4.position.y - 2.5)
            background5.position = CGPointMake(background5.position.x, background5.position.y - 2.5)
            background6.position = CGPointMake(background6.position.x, background6.position.y - 2.5)
            background7.position = CGPointMake(background7.position.x, background7.position.y - 2.5)
            background8.position = CGPointMake(background8.position.x, background8.position.y - 2.5)
            background9.position = CGPointMake(background9.position.x, background9.position.y - 2.5)
            background10.position = CGPointMake(background10.position.x, background10.position.y - 2.5)
            background11.position = CGPointMake(background11.position.x, background11.position.y - 2.5)
            background12.position = CGPointMake(background12.position.x, background12.position.y - 2.5)
            background13.position = CGPointMake(background13.position.x, background13.position.y - 2.5)
            background14.position = CGPointMake(background14.position.x, background14.position.y - 2.5)
            background15.position = CGPointMake(background15.position.x, background15.position.y - 2.5)
            background16.position = CGPointMake(background16.position.x, background16.position.y - 2.5)
            background17.position = CGPointMake(background17.position.x, background17.position.y - 2.5)
            background18.position = CGPointMake(background18.position.x, background18.position.y - 2.5)
            
        }
        
        if gameStarted == false{
            background1.position = CGPointMake(background1.position.x, background1.position.y - 0)
            background2.position = CGPointMake(background2.position.x, background2.position.y - 0)
            background3.position = CGPointMake(background3.position.x, background3.position.y - 0)
            background4.position = CGPointMake(background4.position.x, background4.position.y - 0)
            background5.position = CGPointMake(background5.position.x, background5.position.y - 0)
            background6.position = CGPointMake(background6.position.x, background6.position.y - 0)
            background7.position = CGPointMake(background7.position.x, background7.position.y - 0)
            background8.position = CGPointMake(background8.position.x, background8.position.y - 0)
            background9.position = CGPointMake(background9.position.x, background9.position.y - 0)
            background10.position = CGPointMake(background10.position.x, background10.position.y - 0)
            background11.position = CGPointMake(background11.position.x, background11.position.y - 0)
            background12.position = CGPointMake(background12.position.x, background12.position.y - 0)
            background13.position = CGPointMake(background13.position.x, background13.position.y - 0)
            background14.position = CGPointMake(background14.position.x, background14.position.y - 0)
            background15.position = CGPointMake(background15.position.x, background15.position.y - 0)
            background16.position = CGPointMake(background16.position.x, background16.position.y - 0)
            background17.position = CGPointMake(background17.position.x, background17.position.y - 0)
            background18.position = CGPointMake(background18.position.x, background18.position.y - 0)
            
        }
    }
    
}