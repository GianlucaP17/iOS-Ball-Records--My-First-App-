//
//  GameScene.swift
//  Ball Records!
//
//  Created by gianluca posca on 27/09/16.
//  Copyright © 2016 Monica Gaiga. All rights reserved.
//

import SpriteKit
import UIKit

struct PhysicsCatagory {
    
    static let Ghost : UInt32 = 0x1 << 1
    static let Ground : UInt32 = 0x1 << 2
    static let Wall : UInt32 = 0x1 << 3
    static let Score : UInt32 = 0x1 << 4
    static let Barre : UInt32 = 0x1 << 5
    static let Stella : UInt32 = 0x1 << 6
    
}

class GameScene: SKScene, SKPhysicsContactDelegate {
    
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
    var scoreLbl = SKLabelNode(fontNamed: "Noteworthy")
    var died = Bool()
    var restartBTN = SKSpriteNode()
    var pausa = SKSpriteNode()
    var resume = SKSpriteNode()
    var sound = SKAction.playSoundFileNamed("pop.wav", waitForCompletion: false)
    var soundground = SKAction.playSoundFileNamed("hitGround.wav", waitForCompletion: false)
    var soundstella = SKAction.playSoundFileNamed("star.wav", waitForCompletion: false)
    var soundLevel = SKAction.playSoundFileNamed("Ka-Ching.wav", waitForCompletion: false)
    var tapToStart = SKLabelNode(fontNamed: "Noteworthy")
    var tapToreStart = SKLabelNode(fontNamed: "Noteworthy")
    var scoreStella = SKLabelNode(fontNamed: "Noteworthy")
    var Stella = SKNode()
    var StellaSize = SKSpriteNode()
    var replay = SKSpriteNode()
    var Palla = SKSpriteNode()
    var Highscore = SKLabelNode(fontNamed: "Noteworthy")
    var HighscoreInt = Int()
    var sprite = SKSpriteNode()
    var PlayerBtn = SKSpriteNode()
    var RestartBtnPause = SKSpriteNode()
    

    
    var moveAndRemove = SKAction()
    var moveAndRemove1 = SKAction()
    var moveAndRemove2 = SKAction()
    var moveAndRemove3 = SKAction()
    var moveAndRemove4 = SKAction()
    var moveAndRemove1D = SKAction()
    var moveAndRemove2D = SKAction()
    var moveAndRemove3D = SKAction()
    var moveAndRemove4D = SKAction()
    
    var moveAndRemoveS = SKAction()
    var moveAndRemoveS1 = SKAction()
    var moveAndRemoveS2 = SKAction()
    
    var moveAndRemoveN = SKAction()


    var viewSelect = SKSpriteNode()
    var ChooseOne = SKLabelNode()
    var First = SKSpriteNode()
    var Second = SKSpriteNode()

    
    func restartScene(){
        
        self.removeAllChildren()
        self.removeAllActions()
        died = false
        gameStarted = false
        gameplay = false
        score = 0
        run = 0
        self.physicsWorld.speed = 1.0
        self.speed = 1.0
        createScene()
        
    }
    
    func replayScene(){
        
        self.replay.isHidden = true
        self.restartBTN.isHidden = true
        self.pausa.isHidden = true
        self.Palla.isHidden = true
        gameplay = true
        gamesecond = false
        
        if Ghost.position.y >= pausa.position.y {
            
            Ghost.position = CGPoint(x: Ghost.position.x, y: Ghost.position.y - 80)
            
        }
        
        self.tapToreStart.isHidden = false
        
        
    }
    
    func replayScene2(){
        
        self.replay.isHidden = true
        self.restartBTN.isHidden = true
        self.pausa.isHidden = true
        self.scene!.isPaused = false
        self.gamesecond = false
        self.Palla.isHidden = true
        
        
        if Ghost.position.y >= pausa.position.y {
            
            Ghost.position = CGPoint(x: Ghost.position.x, y: Ghost.position.y - 80)
            
        }
        
        self.tapToreStart.isHidden = false
        
        
    }
    
    func createTexture() {
        
        let texture = SKTexture(size: CGSize(width: 200, height: 1000), direction: GradientDirection.Up)
        texture.filteringMode = .nearest
        Colors.Primo = CGFloat.RandomColor()
        Colors.Secondo = CGFloat.RandomColor()
        sprite = SKSpriteNode(texture: texture)
        sprite.position = CGPoint(x:frame.midX, y: frame.midY)
        sprite.size = self.frame.size
        
        addChild(sprite)
        
    }
    
    func createScene(){
        
        self.physicsWorld.contactDelegate = self
        
        //backgroundColor = SKColor.black
        
        //background()
        
        createGhost()
        
        createTexture()
        
        ChoosePlayer()
        
        let defaults = UserDefaults.standard
        
        if !(defaults.value(forKey: "Highscore") == nil){
            
            HighscoreInt = defaults.value(forKey: "Highscore") as! Int
        }
            
            
        tapToreStart.position = CGPoint(x: self.frame.width / 2, y: self.frame.height / 2 + 110)
        tapToreStart.text = "Tap To Resume!"
        tapToreStart.fontSize = 40
        tapToreStart.zPosition = 7
        tapToreStart.isHidden = true
        
        self.addChild(tapToreStart)
        
        tapToStart.position = CGPoint(x: self.frame.width / 2, y: self.frame.height / 2 + 100)
        tapToStart.text = "Tap To Start!"
        tapToStart.zPosition = 5
        tapToStart.isHidden = false
        
        self.addChild(tapToStart)
        
        scoreLbl.position = CGPoint(x: self.frame.width / 2, y: self.frame.height / 2 + self.frame.height / 2.5)
        scoreLbl.text = "\(score)"
        scoreLbl.fontColor = UIColor.red
        scoreLbl.zPosition = 6
        scoreLbl.isHidden = true
        
        self.addChild(scoreLbl)
        
        scoreStella.position = CGPoint(x: self.frame.width / 2, y: self.frame.height / 2 + 150)
        scoreStella.text = "+1!"
        scoreStella.zPosition = 5
        scoreStella.isHidden = true
        
        self.addChild(scoreStella)
        
        Highscore.position = CGPoint(x: self.frame.width / 2 - 150, y: 330 + self.frame.height / 2)
        Highscore.setScale(0.6)
        Highscore.text = "Highscore: \(HighscoreInt)"
        //Highscore.fontColor = UIColor.cyan
        Highscore.zPosition = 1
        
        self.addChild(Highscore)
        
        Ground2 = SKSpriteNode(imageNamed: "Ground")
        Ground2.setScale(0.5)
        Ground2.position = CGPoint(x: 0 + self.frame.width / 2, y: 410 + self.frame.height / 2)
        Ground2.physicsBody = SKPhysicsBody(rectangleOf: Ground2.size)
        Ground2.physicsBody?.categoryBitMask = PhysicsCatagory.Ground
        Ground2.physicsBody?.collisionBitMask = PhysicsCatagory.Ghost
        Ground2.physicsBody?.contactTestBitMask  = PhysicsCatagory.Ghost
        Ground2.physicsBody?.affectedByGravity = false
        Ground2.physicsBody?.isDynamic = false
        Ground2.zPosition = 3
        
        self.addChild(Ground2)
        
        Ground = SKSpriteNode(imageNamed: "Ground")
        Ground.setScale(0.5)
        Ground.position = CGPoint(x: 0 + self.frame.width / 2, y: -345 + self.frame.height / 2)
        Ground.physicsBody = SKPhysicsBody(rectangleOf: Ground.size)
        Ground.physicsBody?.categoryBitMask = PhysicsCatagory.Ground
        Ground.physicsBody?.collisionBitMask = PhysicsCatagory.Ghost
        Ground.physicsBody?.contactTestBitMask  = PhysicsCatagory.Ghost
        Ground.physicsBody?.affectedByGravity = false
        Ground.physicsBody?.isDynamic = false
        Ground.zPosition = 3
        
        self.addChild(Ground)
        
        Ground = SKSpriteNode(imageNamed: "Ground")
        Ground.position = CGPoint(x: -0 + self.frame.width / 2, y: -358 + self.frame.height / 2 )
        Ground.size = CGSize(width: 600, height: 65)
        Ground.physicsBody?.affectedByGravity = false
        Ground.physicsBody?.isDynamic = false
        Ground.zPosition = 2
        
        self.addChild(Ground)
        
        resume = SKSpriteNode(imageNamed: "ResumeBTNI")
        resume.size = CGSize(width: 80, height: 80)
        resume.position = CGPoint(x: self.frame.width / 2, y: self.frame.height / 2)
        resume.zPosition = 4
        resume.isHidden = true
        
        self.addChild(resume)
        
        pausa = SKSpriteNode(imageNamed: "PausaBTNI")
        pausa.size = CGSize(width: 55, height: 50)
        pausa.position = CGPoint(x: self.frame.width / 2 + 170, y: self.frame.height / 2 + 320)
        pausa.zPosition = 4
        pausa.isHidden = true
        
        self.addChild(pausa)
        
        RestartBtnPause = SKSpriteNode(imageNamed: "RestartBtnPause")
        RestartBtnPause.size = CGSize(width: 55, height: 50)
        RestartBtnPause.position = CGPoint(x: self.frame.width / 2, y: self.frame.height / 2 + 100)
        RestartBtnPause.zPosition = 4
        RestartBtnPause.isHidden = true
        
        self.addChild(RestartBtnPause)
        
        
    }
    
    func ChoosePlayer() {
        
        PlayerBtn = SKSpriteNode(imageNamed: "Choose")
        PlayerBtn.size = CGSize(width: 60, height: 60)
        PlayerBtn.position = CGPoint(x: self.frame.width / 2 + 150, y: self.frame.height / 2 + 290)
        PlayerBtn.zPosition = 4
        PlayerBtn.isHidden = true
        
        self.addChild(PlayerBtn)
        
        
    }
    
    func ViewSelect() {
        
        PlayerBtn.isHidden = true
        
        ChooseOne = SKLabelNode(fontNamed: "Noteworthy")
        ChooseOne.position = CGPoint(x: self.frame.width / 2, y: self.frame.height / 2 + 150)
        ChooseOne.text = "Choose character:"
        ChooseOne.fontSize = 30
        ChooseOne.fontColor = UIColor.black
        ChooseOne.zPosition = 7
        
        self.addChild(ChooseOne)
        
        
        viewSelect = SKSpriteNode(imageNamed: "Nuvola")
        viewSelect.size = CGSize(width: 400, height: 250)
        viewSelect.position = CGPoint(x: self.frame.width / 2, y: self.frame.height / 2 + 130)
        viewSelect.zPosition = 6
        
        self.addChild(viewSelect)
        
        
        First = SKSpriteNode(imageNamed: "PallaGialla")
        First.size = CGSize(width: 50, height: 50)
        First.position = CGPoint(x: self.frame.width / 2 - 50, y: self.frame.height / 2 + 100)
        First.zPosition = 7
        
        self.addChild(First)
        
        
        Second = SKSpriteNode(imageNamed: "Ghost")
        Second.size = CGSize(width: 55, height: 70)
        Second.position = CGPoint(x: self.frame.width / 2 + 50, y: self.frame.height / 2 + 100)
        Second.zPosition = 7
        
        self.addChild(Second)
        
        
        
    }
    
    func createGhost(){
        
        let defaults = UserDefaults.standard
        
        if !(defaults.value(forKey: "Second") == nil){
            
            Ghost = SKSpriteNode(imageNamed: "Ghost")
            Ghost.size = CGSize(width: 60, height: 70)
            Ghost.position = CGPoint(x: self.frame.width / 2 - Ghost.frame.width + 70, y: self.frame.height / 2)
            Ghost.physicsBody = SKPhysicsBody(circleOfRadius: Ghost.frame.height / 2 + 4)
            Ghost.physicsBody?.categoryBitMask = PhysicsCatagory.Ghost
            Ghost.physicsBody?.collisionBitMask = PhysicsCatagory.Ground
            Ghost.physicsBody?.contactTestBitMask = PhysicsCatagory.Ground | PhysicsCatagory.Score | PhysicsCatagory.Barre | PhysicsCatagory.Stella
            Ghost.physicsBody?.affectedByGravity = false
            Ghost.physicsBody?.isDynamic = true
            Ghost.zPosition = 1 //passa sotto le nuvole, 3 per toglierlo
            
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
        Ghost.physicsBody?.isDynamic = true
        Ghost.zPosition = 1
        
        self.addChild(Ghost)
        
        
    }
    
    override func didMove(to view: SKView){
        /* Setup your scene here */
        
        NotificationCenter.default.addObserver(self, selector: #selector(GameScene.pauseGame), name: NSNotification.Name(rawValue: "pauseGame"), object: nil)
        
        createScene()
        
    }
    
    func playSoundTac(_ sound : SKAction){
        self.run(sound)
    }
    
    func playSoundGround(_ sound : SKAction){
        self.run(soundground)
    }
    
    func playSoundStella(_ sound : SKAction){
        self.run(soundstella)
    }
    
    func playSoundLevel(_ sound : SKAction){
        self.run(soundLevel)
    }
    
    func pauseGame(){
        
        if gamesecond == true {
            
            self.scene!.isPaused = true // to pause the game
            self.physicsWorld.speed = 0.0
            self.speed = 0.0
            resume.isHidden = true
            pausa.isHidden = true
            RestartBtnPause.isHidden = true
            
            return
            
        }
        
        if gameplay == false {
            
            self.scene!.isPaused = true // to pause the game
            self.physicsWorld.speed = 0.0
            self.speed = 0.0
            resume.isHidden = false
            pausa.isHidden = true
            RestartBtnPause.isHidden = false

            return
            
        }
        
        if gameStarted == true {
            
            self.scene!.isPaused = true // to pause the game
            self.physicsWorld.speed = 0.0
            self.speed = 0.0
            gameplay = false
            resume.isHidden = false
            pausa.isHidden = true
            RestartBtnPause.isHidden = false

            return
            
        }
    }
    
    func pauseGame2(){
        self.scene!.isPaused = true // to pause the game
        self.physicsWorld.speed = 0.0
        self.speed = 0.0
        gameplay = false
        
    }
    
    func didBegin(_ contact: SKPhysicsContact) {
        let firstBody = contact.bodyA
        let secondBody = contact.bodyB
        
        if firstBody.categoryBitMask == PhysicsCatagory.Score && secondBody.categoryBitMask == PhysicsCatagory.Ghost || firstBody.categoryBitMask == PhysicsCatagory.Ghost && secondBody.categoryBitMask == PhysicsCatagory.Score {
            
            score += 1
            scoreLbl.text = "\(score)"
            
            playSoundLevel(self.soundLevel)

            if HighscoreInt < score {
                HighscoreInt = score
                Highscore.text = "Highscore: \(HighscoreInt)"
                
                let spawn1 = SKAction.run ({() in self.Highscore.isHidden = true})
                let spawnL = SKAction.run ({() in self.Highscore.position = CGPoint(x: self.frame.width / 2 - 100, y: 330 + self.frame.height / 2)})
                
                let spawn = SKAction.run ({() in self.Highscore.setScale(1)})
                let spawn1a = SKAction.run ({() in self.Highscore.isHidden = false})
                let delay = SKAction.wait(forDuration: 0.5)
                let spawna = SKAction.run ({() in self.Highscore.setScale(0.6)})
                
                let spawnL1 = SKAction.run ({() in self.Highscore.position = CGPoint(x: self.frame.width / 2 - 150, y: 330 + self.frame.height / 2)})


                
                let spawnfinal = SKAction.sequence([spawn1, spawnL, spawn, spawn1a, delay, spawna, spawnL1])
                let spawnfinal1 = SKAction.repeat(spawnfinal, count: 1)
                self.run(spawnfinal1)
                
            }
            
            
            
            
            
            wallPair.removeFromParent()
            
            
        }
        
        if firstBody.categoryBitMask == PhysicsCatagory.Stella && secondBody.categoryBitMask == PhysicsCatagory.Ghost || firstBody.categoryBitMask == PhysicsCatagory.Ghost && secondBody.categoryBitMask == PhysicsCatagory.Stella {
            
            playSoundStella(soundstella)
            
            score += 1
            scoreLbl.text = "\(score)"
            playSoundLevel(self.soundLevel)
            
            if HighscoreInt < score {
                HighscoreInt = score
                
                Highscore.text = "Highscore: \(HighscoreInt)"
            
            }
            
            let show = SKAction.run({() in self.scoreStella.isHidden = false})
            let hide = SKAction.run({() in self.scoreStella.isHidden = true})
            let delay = SKAction.wait(forDuration: 1.0)
            let SpawnDelay = SKAction.sequence([show,delay,hide])
            let spawnDelay = SKAction.repeat(SpawnDelay, count: 1)
            self.run(spawnDelay)
            Stella.removeFromParent()
            
        }
        
        if firstBody.categoryBitMask == PhysicsCatagory.Ghost && secondBody.categoryBitMask == PhysicsCatagory.Barre || firstBody.categoryBitMask == PhysicsCatagory.Barre && secondBody.categoryBitMask == PhysicsCatagory.Ghost {
            
            let suono = SKAction.run({
                () in
                self.playSoundGround(self.soundground)
                
            })
            
            let gameover = SKAction.run({
                () in
                
                firstBody.node?.removeFromParent()
                self.GameoverScene()
            })
            
            let SpawnDelay = SKAction.sequence([suono,gameover])
            let spawnDelayForever = SKAction.repeat(SpawnDelay,count: 1)
            self.run(spawnDelayForever)
            
        }
        
        if firstBody.categoryBitMask == PhysicsCatagory.Ghost && secondBody.categoryBitMask == PhysicsCatagory.Ground || firstBody.categoryBitMask == PhysicsCatagory.Ground && secondBody.categoryBitMask == PhysicsCatagory.Ghost{
            
            let suono = SKAction.run({
                () in
                self.playSoundGround(self.soundground)
                
            })
            
            let gameover = SKAction.run({
                () in
                self.GameoverScene()
            })
            
            let SpawnDelay = SKAction.sequence([suono,gameover])
            let spawnDelayForever = SKAction.repeat(SpawnDelay,count: 1)
            self.run(spawnDelayForever)
            
        }
    }
    
    func GameoverScene(){
        
        pauseGame2()
        
        gamesecond = true
        
        tapToreStart.isHidden = true
        pausa.isHidden = true
        PlayerBtn.isHidden = false
        
        let defaults = UserDefaults.standard
        defaults.set(HighscoreInt, forKey: "Highscore")
        defaults.synchronize()
        
        Palla = SKSpriteNode(imageNamed: "PallaGialla")
        Palla.position = CGPoint(x: self.frame.width / 2, y: 320 + self.frame.height / 2)
        Palla.setScale(0.6)
        Palla.zPosition = 5
        Palla.isHidden = false
        
        self.addChild(Palla)
        
        restartBTN = SKSpriteNode(imageNamed: "Restart")
        restartBTN.size = CGSize(width: 130, height: 80)
        restartBTN.position = CGPoint(x: self.frame.width / 2, y: self.frame.height / 2)
        restartBTN.zPosition = 4
        restartBTN.isHidden = false
        
        self.addChild(restartBTN)
        
    }
    
    func restart(){
        self.scene!.isPaused = false
        restartScene()
    }

    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        
        if gameStarted == false{
            
            gameStarted = true
            
            gameplay = true
            
            tapToStart.isHidden = true
            
            scoreLbl.isHidden = false
            
            pausa.isHidden = false
            
            Ghost.physicsBody?.affectedByGravity = true
            
            let spawn = SKAction.run({() in self.createWalls()})
            let spawn1 = SKAction.run({() in self.createBarre1()})
            let spawn1D = SKAction.run({() in self.createBarre1D()})
            let spawn2 = SKAction.run({() in self.createBarre2()})
            let spawn2D = SKAction.run({() in self.createBarre2D()})
            let spawn3 = SKAction.run({() in self.createBarre3()})
            let spawn3D = SKAction.run({() in self.createBarre3D()})
            let spawn4 = SKAction.run({() in self.createBarre4()})
            let spawn4D = SKAction.run({() in self.createBarre4D()})
            
            let spawn5 = SKAction.run({() in self.createBarre5()})
            let spawn5D = SKAction.run({() in self.createBarre5D()})
            let spawn6 = SKAction.run({() in self.createBarre6()})
            let spawn6D = SKAction.run({() in self.createBarre6D()})
            let spawn7 = SKAction.run({() in self.createBarre7()})
            let spawn7D = SKAction.run({() in self.createBarre7D()})
            let spawn8 = SKAction.run({() in self.createBarre8()})
            let spawn8D = SKAction.run({() in self.createBarre8D()})
            
            let spawn9 = SKAction.run({() in self.createBarre9()})
            let spawn9D1 = SKAction.run({() in self.createBarre9S()})
            
            let spawnS = SKAction.run({() in self.stellaFunc()})
            let spawnSD = SKAction.run({() in self.stellaFunc2()})
            
            let spawnN = SKAction.run ({() in self.createNuvola()})
            let spawnN1 = SKAction.run ({() in self.createNuvola1()})
            let spawnN2 = SKAction.run ({() in self.createNuvola2()})
            let spawnN3 = SKAction.run ({() in self.createNuvola3()})
            
            let random = SKAction.run({()
                let array = [spawn1,spawn1D,spawn2,spawn2D,spawn3,spawn3D,spawn4,spawn4D]
                let randomIndex = Int(arc4random_uniform(UInt32(array.count)))
                self.run(array[randomIndex])
            })
            
            let random2 = SKAction.run({()
                let array = [spawn5,spawn5D,spawn6,spawn6D,spawn7,spawn7D,spawn8,spawn8D]
                let randomIndex = Int(arc4random_uniform(UInt32(array.count)))
                self.run(array[randomIndex])
            })
            
            let randomN = SKAction.run({()
                let array = [spawnN,spawnN1,spawnN2,spawnN3]
                let randomIndex = Int(arc4random_uniform(UInt32(array.count)))
                self.run(array[randomIndex])
            })
            
            
            //distanza wall in tempo dopo tot secondi spawna quello dopo
            let delay = SKAction.wait(forDuration: 2.0)
            let delay1 = SKAction.wait(forDuration: 1.0)
            let delay2 = SKAction.wait(forDuration: 3.0)
            
            
            let SpawnDelay = SKAction.sequence([
                
                //1
                spawn,delay,        random,delay1, random,random,delay2,
                //1
                spawn,delay,        random,random,delay1, random,delay2,
                //1
                spawn,delay,        random,delay1, random,delay1,  random,delay2,
                //1
                spawn,delay,        spawnS,delay1, random,delay2,
                //1
                spawn,delay,        random,delay1, random,random,delay2,
                //1
                spawn,delay,        random,delay1, spawnSD,delay2,
                //1
                spawn,delay,        random,delay1, random,delay1,  random,delay2,
                //1
                spawn,delay,        random,delay1, random,delay2,
                
                
                //1
                spawn,delay,        spawnS,delay1, random2,delay1, random2,delay2,
                //1
                spawn,delay,        random2,delay1, random2,delay1,  spawnSD,delay2,
                //1
                spawn,delay,        random2,delay1, random2,delay1,  random2,delay2,
                //1
                spawn,delay,        random2,delay1, random2,spawn8D,random2,delay2,
                //1
                spawn,delay,        random2,delay1, random2,delay1, random2,delay2,
                //1
                spawn,delay,        random2,delay1, random2,spawnSD,random2,delay2,
                //1
                spawn,delay,        random2,delay1, random2,delay1, random2,delay2,
                //1
                spawn,delay,        random2,delay1, random2,delay1,  random2,spawnS,delay2,
                
                //1
                spawn,delay,        spawn9,delay1, spawn9D1,delay1,  spawn9D1,delay2,
                //1
                spawn,delay,        spawn9D1,delay1, spawn9,delay1,  spawn9D1,spawnS,delay2,
                //1
                spawn,delay,        spawn9D1,delay1, spawn9D1,delay1,  spawn9,delay2,
                //1
                spawn,delay,        spawn9,delay1, spawn9D1,delay1,  spawn9D1,delay2,
                //1
                spawn,delay,        spawn9,spawnS,delay1, spawn9D1,delay1,  spawn9D1,delay2,
                //1
                spawn,delay,        spawn9D1,delay1, spawn9,delay1,  spawn9D1,delay2,
                //1
                spawn,delay,        spawn9D1,spawnS,delay1, spawn9D1,delay1,  spawn9,delay2,
                //1
                spawn,delay,        spawn9,delay1, spawn9D1,delay1,  spawn9D1,delay2,
                
                
                
                ])
            
            let SpawnDelay1 = SKAction.sequence([
                
                randomN, delay2
                
                ])
            
            let spawnDelayForever = SKAction.repeatForever(SpawnDelay)
            //se vuoi che si fermi a 2  let spawnDelayForever = SKAction.repeatAction(SpawnDelay,count: 2)
            self.run(spawnDelayForever)
            
            let spawnDelayForever1 = SKAction.repeatForever(SpawnDelay1)
            self.run(spawnDelayForever1)
            
            //livelli
            let distance = CGFloat(self.frame.width + 1000 + wallPair.frame.width) //puoi tolgiere "*distance" ma la velocità cambia
            let movePipes = SKAction.moveTo(y: -distance, duration: TimeInterval( 0.003 * distance))
            
            //stella
            let distanceS = CGFloat(self.frame.width + Stella.frame.width) //puoi tolgiere "*distance" ma la velocità cambia
            let movePipesS = SKAction.moveTo(x: distanceS, duration: TimeInterval( 0.003 * distanceS))
            
            let distanceS1 = CGFloat(-400)
            let movePipesS1 = SKAction.moveTo(y: distanceS1, duration: TimeInterval( 0.003 * distance))
            
            //stella
            let movePipesS2 = SKAction.moveTo(x: -distanceS, duration: TimeInterval( 0.003 * distanceS))
            
            //nuvola
            let movePipesN = SKAction.moveTo(y: -distance, duration: TimeInterval( 0.01 * distance))
            
            let distance2 = CGFloat(self.frame.width - 390 + Barre.frame.width) //puoi tolgiere "*distance" ma la velocità cambia
            //se c'è il - davanti alla distnace va verso destra
            let movePipes1 = SKAction.moveTo(x: distance2, duration: TimeInterval( 0.004 * distance2))
            let movePipes2 = SKAction.moveTo(x: distance2, duration: TimeInterval( 0.003 * distance2))
            let movePipes3 = SKAction.moveTo(x: distance2, duration: TimeInterval( 0.0025 * distance2))
            let movePipes4 = SKAction.moveTo(x: distance2, duration: TimeInterval( 0.0015 * distance2))
            
            //se c'è il - davanti alla distance va verso destra
            let movePipes1D = SKAction.moveTo(x: -distance2, duration: TimeInterval( 0.004 * distance2))
            let movePipes2D = SKAction.moveTo(x: -distance2, duration: TimeInterval( 0.003 * distance2))
            let movePipes3D = SKAction.moveTo(x: -distance2, duration: TimeInterval( 0.0025 * distance2))
            let movePipes4D = SKAction.moveTo(x: -distance2, duration: TimeInterval( 0.0015 * distance2))
            
            
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
            moveAndRemoveN = SKAction.sequence([movePipesN, removePipes])
            
            
            
            Ghost.physicsBody?.velocity = CGVector(dx: 0, dy: 0)
            Ghost.physicsBody?.applyImpulse(CGVector(dx: 0, dy: 60))

            
        }
        else{
            
            if died == true{
                
            }
            else{
                Ghost.physicsBody?.velocity = CGVector(dx: 0, dy: 0)
                Ghost.physicsBody?.applyImpulse(CGVector(dx: 0, dy: 55))    // Modifica livello gravità
            }
            
        }
        
        for touch in touches{
            
            let location = touch.location(in: self)
            
            if gameplay == true
            {
                playSoundTac(sound)
            }
            
            if self.atPoint(location) == self.pausa
            {
                
                pauseGame()
                resume.isHidden = false
                pausa.isHidden = true
                RestartBtnPause.isHidden = false
                gameplay = false
            }
            
            if self.atPoint(location) == self.resume
            {
                pausa.isHidden = false
                RestartBtnPause.isHidden = true
                resume.isHidden = true
                self.physicsWorld.speed = 1.0
                self.speed = 1.0
                self.scene!.isPaused = false
                gameplay = true
                
            }
            
            if self.atPoint(location) == self.restartBTN || self.atPoint(location) == self.RestartBtnPause
            {
                self.scene!.isPaused = false
                restartScene()
            }
            
            if tapToreStart.isHidden == false {
                
                died = false
                gameplay = true
                self.physicsWorld.speed = 1.0
                self.speed = 1.0
                
                tapToreStart.isHidden = true
                pausa.isHidden = false
                
            }
            
            if self.atPoint(location) == self.PlayerBtn {
                
                ViewSelect()
            }
            
            if self.atPoint(location) == self.First {
                
                viewSelect.isHidden = true
                ChooseOne.isHidden = true
                First.isHidden = true
                Second.isHidden = true
                PlayerBtn.isHidden = false

                
                let defaults = UserDefaults.standard
                defaults.set(true, forKey: "First")
                defaults.synchronize()
                
                if !(defaults.value(forKey: "Second") == nil){
                    
                    defaults.removeObject(forKey: "Second")
                }
                
            }
            
            if self.atPoint(location) == self.Second {
                
                viewSelect.isHidden = true
                ChooseOne.isHidden = true
                First.isHidden = true
                Second.isHidden = true
                PlayerBtn.isHidden = false

             
                let defaults = UserDefaults.standard
                defaults.set(true, forKey: "Second")
                defaults.synchronize()
                
                if !(defaults.value(forKey: "First") == nil){
                    
                    defaults.removeObject(forKey: "First")
                }
                
            }
            
        }
    }
    
    func createNuvola3(){
        
        let nuvola = SKSpriteNode(imageNamed: "NuvolaDestra")
        nuvola.anchorPoint = CGPoint()
        nuvola.size = CGSize(width: 300, height: 200)
        nuvola.position = CGPoint(x: self.frame.width / 2, y: self.frame.height / 2 + 400)
        nuvola.zPosition = 1
        
        let randomPosition = CGFloat.random(min: -200, max: +200)
        nuvola.position.x = nuvola.position.x +  randomPosition
        
        nuvola.run(moveAndRemoveN)
        self.addChild(nuvola)
        
        
    }
    
    func createNuvola2(){
        
        let nuvola = SKSpriteNode(imageNamed: "NuvolaSinistra")
        nuvola.anchorPoint = CGPoint()
        nuvola.size = CGSize(width: 300, height: 200)
        nuvola.position = CGPoint(x: self.frame.width / 2, y: self.frame.height / 2 + 400)
        nuvola.zPosition = 1
        
        let randomPosition = CGFloat.random(min: -200, max: +200)
        nuvola.position.x = nuvola.position.x +  randomPosition
        
        nuvola.run(moveAndRemoveN)
        self.addChild(nuvola)
        
        
    }

    func createNuvola1(){
        
        let nuvola = SKSpriteNode(imageNamed: "NuvolaGrande")
        nuvola.anchorPoint = CGPoint()
        nuvola.size = CGSize(width: 200, height: 100)
        nuvola.position = CGPoint(x: self.frame.width / 2, y: self.frame.height / 2 + 400)
        nuvola.zPosition = 1
        
        let randomPosition = CGFloat.random(min: -200, max: +200)
        nuvola.position.x = nuvola.position.x +  randomPosition
        
        nuvola.run(moveAndRemoveN)
        self.addChild(nuvola)
        
    }
    
    func createNuvola(){
        
        let nuvola = SKSpriteNode(imageNamed: "Nuvola")
        nuvola.anchorPoint = CGPoint()
        nuvola.size = CGSize(width: 200, height: 100)
        nuvola.position = CGPoint(x: self.frame.width / 2, y: self.frame.height / 2 + 400)
        nuvola.zPosition = 1
        
        let randomPosition = CGFloat.random(min: -200, max: +200)
        nuvola.position.x = nuvola.position.x +  randomPosition
        
        nuvola.run(moveAndRemoveN)
        self.addChild(nuvola)
        
        
    }
    
    func createStella(){
        
        let stella = SKSpriteNode(imageNamed: "StellaC")
        stella.anchorPoint = CGPoint()
        stella.size = CGSize(width: 5, height: 5)
        stella.position = CGPoint(x: self.frame.width / 2, y: self.frame.height / 2 + 600)
        stella.zPosition = -1
        
        let randomPosition = CGFloat.random(min: -250, max: +250)
        stella.position.x = stella.position.x +  randomPosition
        
        let randomPosition1 = CGFloat.random(min: -150, max: +150)
        stella.position.y = stella.position.y +  randomPosition1
        
        stella.run(moveAndRemoveS1)
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
        stella.physicsBody = SKPhysicsBody(rectangleOf: StellaSize.size)
        stella.physicsBody?.categoryBitMask = PhysicsCatagory.Stella
        stella.physicsBody?.collisionBitMask = PhysicsCatagory.Ghost
        stella.physicsBody?.contactTestBitMask  = PhysicsCatagory.Ghost
        stella.physicsBody?.affectedByGravity = false
        stella.physicsBody?.isDynamic = false
        Stella.zPosition = 3
        
        let randomPosition = CGFloat.random(min: -255, max: +275)
        stella.position.y = stella.position.y +  randomPosition
        
        Stella.addChild(StellaSize)
        Stella.addChild(stella)
        Stella.run(moveAndRemoveS2)
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
        stella.physicsBody = SKPhysicsBody(rectangleOf: StellaSize.size)
        stella.physicsBody?.categoryBitMask = PhysicsCatagory.Stella
        stella.physicsBody?.collisionBitMask = PhysicsCatagory.Ghost
        stella.physicsBody?.contactTestBitMask  = PhysicsCatagory.Ghost
        stella.physicsBody?.affectedByGravity = false
        stella.physicsBody?.isDynamic = false
        Stella.zPosition = 3
        
        let randomPosition = CGFloat.random(min: -255, max: +275)
        stella.position.y = stella.position.y +  randomPosition
        
        Stella.addChild(StellaSize)
        Stella.addChild(stella)
        Stella.run(moveAndRemoveS)
        self.addChild(Stella)
        
    }
    
    func createBarre9S(){
        
        self.physicsWorld.contactDelegate = self
        
        Barre = SKNode()
        BarreSize = SKSpriteNode()
        
        let barre = SKSpriteNode(imageNamed: "ShuttleD")
        //misura da quando inizia a segnare che ci si a il tocco
        BarreSize.size = CGSize(width: 100, height: 50)
        //da dove parte
        barre.position = CGPoint(x: self.frame.height / 2 + 450, y: self.frame.height / 2)
        barre.setScale(0.12)
        barre.physicsBody = SKPhysicsBody(rectangleOf: BarreSize.size)
        barre.physicsBody?.categoryBitMask = PhysicsCatagory.Barre
        barre.physicsBody?.collisionBitMask = PhysicsCatagory.Ghost
        barre.physicsBody?.contactTestBitMask  = PhysicsCatagory.Ghost
        barre.physicsBody?.affectedByGravity = false
        barre.physicsBody?.isDynamic = false
        Barre.zPosition = 3
        
        let randomPosition = CGFloat.random(min: -255, max: +275)
        barre.position.y = barre.position.y +  randomPosition
        
        Barre.addChild(BarreSize)
        Barre.addChild(barre)
        Barre.run(moveAndRemove3D)
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
        barre.physicsBody = SKPhysicsBody(rectangleOf: BarreSize.size)
        barre.physicsBody?.categoryBitMask = PhysicsCatagory.Barre
        barre.physicsBody?.collisionBitMask = PhysicsCatagory.Ghost
        barre.physicsBody?.contactTestBitMask  = PhysicsCatagory.Ghost
        barre.physicsBody?.affectedByGravity = false
        barre.physicsBody?.isDynamic = false
        Barre.zPosition = 3
        
        let randomPosition = CGFloat.random(min: -255, max: +275)
        barre.position.y = barre.position.y +  randomPosition
        
        Barre.addChild(BarreSize)
        Barre.addChild(barre)
        Barre.run(moveAndRemove3)
        self.addChild(Barre)
        
    }
    
    func createBarre8D(){
        
        self.physicsWorld.contactDelegate = self
        
        Barre = SKNode()
        BarreSize = SKSpriteNode()
        
        let barre = SKSpriteNode(imageNamed: "AereoS")
        //misura da quando inizia a segnare che ci si a il tocco
        BarreSize.size = CGSize(width: 100, height: 50)
        barre.position = CGPoint(x: self.frame.height / 2 + 450, y: self.frame.height / 2)
        barre.setScale(0.15)
        barre.physicsBody = SKPhysicsBody(rectangleOf: BarreSize.size)
        barre.physicsBody?.categoryBitMask = PhysicsCatagory.Barre
        barre.physicsBody?.collisionBitMask = PhysicsCatagory.Ghost
        barre.physicsBody?.contactTestBitMask  = PhysicsCatagory.Ghost
        barre.physicsBody?.affectedByGravity = false
        barre.physicsBody?.isDynamic = false
        Barre.zPosition = 3
        
        let randomPosition = CGFloat.random(min: -255, max: +275)
        barre.position.y = barre.position.y +  randomPosition
        
        Barre.addChild(BarreSize)
        Barre.addChild(barre)
        Barre.run(moveAndRemove4D)
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
        barre.physicsBody = SKPhysicsBody(rectangleOf: BarreSize.size)
        barre.physicsBody?.categoryBitMask = PhysicsCatagory.Barre
        barre.physicsBody?.collisionBitMask = PhysicsCatagory.Ghost
        barre.physicsBody?.contactTestBitMask  = PhysicsCatagory.Ghost
        barre.physicsBody?.affectedByGravity = false
        barre.physicsBody?.isDynamic = false
        Barre.zPosition = 3
        
        let randomPosition = CGFloat.random(min: -255, max: +275)
        barre.position.y = barre.position.y +  randomPosition
        
        Barre.addChild(BarreSize)
        Barre.addChild(barre)
        Barre.run(moveAndRemove4)
        self.addChild(Barre)
        
        
    }
    
    func createBarre7D(){
        
        self.physicsWorld.contactDelegate = self
        
        Barre = SKNode()
        BarreSize = SKSpriteNode()
        
        let barre = SKSpriteNode(imageNamed: "AereoS")
        //misura da quando inizia a segnare che ci si a il tocco
        BarreSize.size = CGSize(width: 100, height: 50)
        barre.position = CGPoint(x: self.frame.height / 2 + 450, y: self.frame.height / 2)
        barre.setScale(0.15)
        barre.physicsBody = SKPhysicsBody(rectangleOf: BarreSize.size)
        barre.physicsBody?.categoryBitMask = PhysicsCatagory.Barre
        barre.physicsBody?.collisionBitMask = PhysicsCatagory.Ghost
        barre.physicsBody?.contactTestBitMask  = PhysicsCatagory.Ghost
        barre.physicsBody?.affectedByGravity = false
        barre.physicsBody?.isDynamic = false
        Barre.zPosition = 3
        
        let randomPosition = CGFloat.random(min: -255, max: +275)
        barre.position.y = barre.position.y +  randomPosition
        
        Barre.addChild(BarreSize)
        Barre.addChild(barre)
        Barre.run(moveAndRemove3D)
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
        barre.physicsBody = SKPhysicsBody(rectangleOf: BarreSize.size)
        barre.physicsBody?.categoryBitMask = PhysicsCatagory.Barre
        barre.physicsBody?.collisionBitMask = PhysicsCatagory.Ghost
        barre.physicsBody?.contactTestBitMask  = PhysicsCatagory.Ghost
        barre.physicsBody?.affectedByGravity = false
        barre.physicsBody?.isDynamic = false
        Barre.zPosition = 3
        
        let randomPosition = CGFloat.random(min: -255, max: +275)
        barre.position.y = barre.position.y +  randomPosition
        
        Barre.addChild(BarreSize)
        Barre.addChild(barre)
        Barre.run(moveAndRemove3)
        self.addChild(Barre)
        
        
    }
    
    func createBarre6D(){
        
        self.physicsWorld.contactDelegate = self
        
        Barre = SKNode()
        BarreSize = SKSpriteNode()
        
        let barre = SKSpriteNode(imageNamed: "AereoS")
        //misura da quando inizia a segnare che ci si a il tocco
        BarreSize.size = CGSize(width: 100, height: 50)
        barre.position = CGPoint(x: self.frame.height / 2 + 450, y: self.frame.height / 2)
        barre.setScale(0.15)
        barre.physicsBody = SKPhysicsBody(rectangleOf: BarreSize.size)
        barre.physicsBody?.categoryBitMask = PhysicsCatagory.Barre
        barre.physicsBody?.collisionBitMask = PhysicsCatagory.Ghost
        barre.physicsBody?.contactTestBitMask  = PhysicsCatagory.Ghost
        barre.physicsBody?.affectedByGravity = false
        barre.physicsBody?.isDynamic = false
        Barre.zPosition = 3
        
        let randomPosition = CGFloat.random(min: -255, max: +275)
        barre.position.y = barre.position.y +  randomPosition
        
        Barre.addChild(BarreSize)
        Barre.addChild(barre)
        Barre.run(moveAndRemove2D)
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
        barre.physicsBody = SKPhysicsBody(rectangleOf: BarreSize.size)
        barre.physicsBody?.categoryBitMask = PhysicsCatagory.Barre
        barre.physicsBody?.collisionBitMask = PhysicsCatagory.Ghost
        barre.physicsBody?.contactTestBitMask  = PhysicsCatagory.Ghost
        barre.physicsBody?.affectedByGravity = false
        barre.physicsBody?.isDynamic = false
        Barre.zPosition = 3
        
        let randomPosition = CGFloat.random(min: -255, max: +275)
        barre.position.y = barre.position.y +  randomPosition
        
        Barre.addChild(BarreSize)
        Barre.addChild(barre)
        Barre.run(moveAndRemove2)
        self.addChild(Barre)
        
    }
    
    func createBarre5D(){
        
        self.physicsWorld.contactDelegate = self
        
        Barre = SKNode()
        BarreSize = SKSpriteNode()
        
        let barre = SKSpriteNode(imageNamed: "AereoS")
        //misura da quando inizia a segnare che ci si a il tocco
        BarreSize.size = CGSize(width: 100, height: 50)
        //da dove parte
        barre.position = CGPoint(x: self.frame.height / 2 + 450, y: self.frame.height / 2)
        barre.setScale(0.15)
        barre.physicsBody = SKPhysicsBody(rectangleOf: BarreSize.size)
        barre.physicsBody?.categoryBitMask = PhysicsCatagory.Barre
        barre.physicsBody?.collisionBitMask = PhysicsCatagory.Ghost
        barre.physicsBody?.contactTestBitMask  = PhysicsCatagory.Ghost
        barre.physicsBody?.affectedByGravity = false
        barre.physicsBody?.isDynamic = false
        Barre.zPosition = 3
        
        let randomPosition = CGFloat.random(min: -255, max: +275)
        barre.position.y = barre.position.y +  randomPosition
        
        Barre.addChild(BarreSize)
        Barre.addChild(barre)
        Barre.run(moveAndRemove1D)
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
        barre.physicsBody = SKPhysicsBody(rectangleOf: BarreSize.size)
        barre.physicsBody?.categoryBitMask = PhysicsCatagory.Barre
        barre.physicsBody?.collisionBitMask = PhysicsCatagory.Ghost
        barre.physicsBody?.contactTestBitMask  = PhysicsCatagory.Ghost
        barre.physicsBody?.affectedByGravity = false
        barre.physicsBody?.isDynamic = false
        Barre.zPosition = 3
        
        let randomPosition = CGFloat.random(min: -255, max: +275)
        barre.position.y = barre.position.y +  randomPosition
        
        Barre.addChild(BarreSize)
        Barre.addChild(barre)
        Barre.run(moveAndRemove1)
        self.addChild(Barre)
        
    }
    
    func createBarre4D(){
        
        self.physicsWorld.contactDelegate = self
        
        Barre = SKNode()
        BarreSize = SKSpriteNode()
        
        let barre = SKSpriteNode(imageNamed: "VeloceS")
        //misura da quando inizia a segnare che ci si a il tocco
        BarreSize.size = CGSize(width: 70, height: 30)
        barre.position = CGPoint(x: self.frame.height / 2 + 450, y: self.frame.height / 2)
        barre.setScale(0.1)
        barre.physicsBody = SKPhysicsBody(rectangleOf: BarreSize.size)
        barre.physicsBody?.categoryBitMask = PhysicsCatagory.Barre
        barre.physicsBody?.collisionBitMask = PhysicsCatagory.Ghost
        barre.physicsBody?.contactTestBitMask  = PhysicsCatagory.Ghost
        barre.physicsBody?.affectedByGravity = false
        barre.physicsBody?.isDynamic = false
        Barre.zPosition = 3
        
        let randomPosition = CGFloat.random(min: -255, max: +275)
        barre.position.y = barre.position.y +  randomPosition
        
        Barre.addChild(BarreSize)
        Barre.addChild(barre)
        Barre.run(moveAndRemove4D)
        self.addChild(Barre)
        
        
    }
    
    func createBarre4(){
        
        self.physicsWorld.contactDelegate = self
        
        Barre = SKNode()
        BarreSize = SKSpriteNode()
        
        let barre = SKSpriteNode(imageNamed: "Veloce")
        //misura da quando inizia a segnare che ci si a il tocco
        BarreSize.size = CGSize(width: 70, height: 30)
        barre.position = CGPoint(x: self.frame.height / 2 - 170, y: self.frame.height / 2)
        barre.setScale(0.1)
        barre.physicsBody = SKPhysicsBody(rectangleOf: BarreSize.size)
        barre.physicsBody?.categoryBitMask = PhysicsCatagory.Barre
        barre.physicsBody?.collisionBitMask = PhysicsCatagory.Ghost
        barre.physicsBody?.contactTestBitMask  = PhysicsCatagory.Ghost
        barre.physicsBody?.affectedByGravity = false
        barre.physicsBody?.isDynamic = false
        Barre.zPosition = 3
        
        let randomPosition = CGFloat.random(min: -255, max: +275)
        barre.position.y = barre.position.y +  randomPosition
        
        Barre.addChild(BarreSize)
        Barre.addChild(barre)
        Barre.run(moveAndRemove4)
        self.addChild(Barre)
        
        
    }
    
    func createBarre3D(){
        
        self.physicsWorld.contactDelegate = self
        
        Barre = SKNode()
        BarreSize = SKSpriteNode()
        
        let barre = SKSpriteNode(imageNamed: "MedioVS")
        //misura da quando inizia a segnare che ci si a il tocco
        BarreSize.size = CGSize(width: 70, height: 30)
        barre.position = CGPoint(x: self.frame.height / 2 + 450, y: self.frame.height / 2)
        barre.setScale(0.1)
        barre.physicsBody = SKPhysicsBody(rectangleOf: BarreSize.size)
        barre.physicsBody?.categoryBitMask = PhysicsCatagory.Barre
        barre.physicsBody?.collisionBitMask = PhysicsCatagory.Ghost
        barre.physicsBody?.contactTestBitMask  = PhysicsCatagory.Ghost
        barre.physicsBody?.affectedByGravity = false
        barre.physicsBody?.isDynamic = false
        Barre.zPosition = 3
        
        let randomPosition = CGFloat.random(min: -255, max: +275)
        barre.position.y = barre.position.y +  randomPosition
        
        Barre.addChild(BarreSize)
        Barre.addChild(barre)
        Barre.run(moveAndRemove3D)
        self.addChild(Barre)
        
        
    }
    
    func createBarre3(){
        
        self.physicsWorld.contactDelegate = self
        
        Barre = SKNode()
        BarreSize = SKSpriteNode()
        
        let barre = SKSpriteNode(imageNamed: "MedioV")
        //misura da quando inizia a segnare che ci si a il tocco
        BarreSize.size = CGSize(width: 70, height: 30)
        barre.position = CGPoint(x: self.frame.height / 2 - 170, y: self.frame.height / 2)
        barre.setScale(0.1)
        barre.physicsBody = SKPhysicsBody(rectangleOf: BarreSize.size)
        barre.physicsBody?.categoryBitMask = PhysicsCatagory.Barre
        barre.physicsBody?.collisionBitMask = PhysicsCatagory.Ghost
        barre.physicsBody?.contactTestBitMask  = PhysicsCatagory.Ghost
        barre.physicsBody?.affectedByGravity = false
        barre.physicsBody?.isDynamic = false
        Barre.zPosition = 3
        
        let randomPosition = CGFloat.random(min: -255, max: +275)
        barre.position.y = barre.position.y +  randomPosition
        
        Barre.addChild(BarreSize)
        Barre.addChild(barre)
        Barre.run(moveAndRemove3)
        self.addChild(Barre)
        
        
    }
    
    func createBarre2D(){
        
        self.physicsWorld.contactDelegate = self
        
        Barre = SKNode()
        BarreSize = SKSpriteNode()
        
        let barre = SKSpriteNode(imageNamed: "MedioLS")
        //misura da quando inizia a segnare che ci si a il tocco
        BarreSize.size = CGSize(width: 70, height: 30)
        barre.position = CGPoint(x: self.frame.height / 2 + 450, y: self.frame.height / 2)
        barre.setScale(0.1)
        barre.physicsBody = SKPhysicsBody(rectangleOf: BarreSize.size)
        barre.physicsBody?.categoryBitMask = PhysicsCatagory.Barre
        barre.physicsBody?.collisionBitMask = PhysicsCatagory.Ghost
        barre.physicsBody?.contactTestBitMask  = PhysicsCatagory.Ghost
        barre.physicsBody?.affectedByGravity = false
        barre.physicsBody?.isDynamic = false
        Barre.zPosition = 3
        
        let randomPosition = CGFloat.random(min: -255, max: +275)
        barre.position.y = barre.position.y +  randomPosition
        
        Barre.addChild(BarreSize)
        Barre.addChild(barre)
        Barre.run(moveAndRemove2D)
        self.addChild(Barre)
        
    }
    
    func createBarre2(){
        
        self.physicsWorld.contactDelegate = self
        
        Barre = SKNode()
        BarreSize = SKSpriteNode()
        
        let barre = SKSpriteNode(imageNamed: "MedioL")
        //misura da quando inizia a segnare che ci si a il tocco
        BarreSize.size = CGSize(width: 70, height: 30)
        barre.position = CGPoint(x: self.frame.height / 2 - 170, y: self.frame.height / 2)
        barre.setScale(0.1)
        barre.physicsBody = SKPhysicsBody(rectangleOf: BarreSize.size)
        barre.physicsBody?.categoryBitMask = PhysicsCatagory.Barre
        barre.physicsBody?.collisionBitMask = PhysicsCatagory.Ghost
        barre.physicsBody?.contactTestBitMask  = PhysicsCatagory.Ghost
        barre.physicsBody?.affectedByGravity = false
        barre.physicsBody?.isDynamic = false
        Barre.zPosition = 3
        
        let randomPosition = CGFloat.random(min: -255, max: +275)
        barre.position.y = barre.position.y +  randomPosition
        
        Barre.addChild(BarreSize)
        Barre.addChild(barre)
        Barre.run(moveAndRemove2)
        self.addChild(Barre)
        
    }
    
    func createBarre1D(){
        
        self.physicsWorld.contactDelegate = self
        
        Barre = SKNode()
        BarreSize = SKSpriteNode()
        
        let barre = SKSpriteNode(imageNamed: "PianoS")
        //misura da quando inizia a segnare che ci si a il tocco
        BarreSize.size = CGSize(width: 70, height: 30)
        //da dove parte
        barre.position = CGPoint(x: self.frame.height / 2 + 450, y: self.frame.height / 2)
        barre.setScale(0.1)
        barre.physicsBody = SKPhysicsBody(rectangleOf: BarreSize.size)
        barre.physicsBody?.categoryBitMask = PhysicsCatagory.Barre
        barre.physicsBody?.collisionBitMask = PhysicsCatagory.Ghost
        barre.physicsBody?.contactTestBitMask  = PhysicsCatagory.Ghost
        barre.physicsBody?.affectedByGravity = false
        barre.physicsBody?.isDynamic = false
        Barre.zPosition = 3
        
        let randomPosition = CGFloat.random(min: -255, max: +275)
        barre.position.y = barre.position.y +  randomPosition
        
        Barre.addChild(BarreSize)
        Barre.addChild(barre)
        Barre.run(moveAndRemove1D)
        self.addChild(Barre)
        
    }
    
    func createBarre1(){
        
        self.physicsWorld.contactDelegate = self
        
        Barre = SKNode()
        BarreSize = SKSpriteNode()
        
        let barre = SKSpriteNode(imageNamed: "Piano")
        //misura da quando inizia a segnare che ci si a il tocco
        BarreSize.size = CGSize(width: 70, height: 30)
        //da dove parte
        barre.position = CGPoint(x: self.frame.height / 2 - 170, y: self.frame.height / 2)
        barre.setScale(0.1)
        barre.physicsBody = SKPhysicsBody(rectangleOf: BarreSize.size)
        barre.physicsBody?.categoryBitMask = PhysicsCatagory.Barre
        barre.physicsBody?.collisionBitMask = PhysicsCatagory.Ghost
        barre.physicsBody?.contactTestBitMask  = PhysicsCatagory.Ghost
        barre.physicsBody?.affectedByGravity = false
        barre.physicsBody?.isDynamic = false
        Barre.zPosition = 3
        
        let randomPosition = CGFloat.random(min: -255, max: +275)
        barre.position.y = barre.position.y +  randomPosition
        
        Barre.addChild(BarreSize)
        Barre.addChild(barre)
        Barre.run(moveAndRemove1)
        self.addChild(Barre)
        
    }
    
    func createWalls(){
        
        let scoreNode = SKSpriteNode()
        //larghezza e lunghezza linea dello score che è attaccata alle "wall"
        scoreNode.size = CGSize(width: 200, height: 1)
        scoreNode.position = CGPoint(x: self.frame.width / 2, y: self.frame.height)
        scoreNode.physicsBody = SKPhysicsBody(rectangleOf: scoreNode.size)
        scoreNode.physicsBody?.affectedByGravity = false
        scoreNode.physicsBody?.isDynamic = false
        scoreNode.physicsBody?.categoryBitMask = PhysicsCatagory.Score
        scoreNode.physicsBody?.collisionBitMask = 0
        scoreNode.color = SKColor.red
        scoreNode.zPosition = -1
        
        
        wallPair = SKNode()
        
        let btmWall = SKSpriteNode(imageNamed: "Rosso")
        btmWall.position = CGPoint(x: 0 + self.frame.height / 2, y: self.frame.height)
        btmWall.size = CGSize(width: 500, height: 25)
        btmWall.zPosition = 2
        
        
        wallPair.addChild(btmWall)
        //Posizione livello
        wallPair.zPosition = 1
        wallPair.addChild(scoreNode)
        wallPair.run(moveAndRemove)
        self.addChild(wallPair)
        
    }
    
    override func update(_ currentTime: CFTimeInterval) {
        
    }
    
    
}
