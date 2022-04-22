//
//  GameViewController.swift
//  Ball Records!
//
//  Created by Monica Gaiga on 04/01/16.
//  Copyright (c) 2016 Monica Gaiga. All rights reserved.
//

import UIKit
import SpriteKit
import GameKit


class GameViewController: UIViewController, UITableViewDelegate, GKGameCenterControllerDelegate {
    
    @IBOutlet var bannerView: GADBannerView!
    
    var score:Int = 0
    var rscorBTN = SKSpriteNode()
    var interstitial: GADInterstitial!
    var request = GADRequest()
    var keymore = MyVariables.keymore

    
    func gamecenter(){
        saveHighscore(score)
        showLeader()
    }
    
    func savegamecenter(){
        saveHighscore(score)
    }
    
    override func viewDidLoad() {
        
        NSNotificationCenter.defaultCenter().addObserver(self, selector: #selector(GameViewController.gamecenter), name: "gamecenter", object: nil)
        NSNotificationCenter.defaultCenter().addObserver(self, selector: #selector(GameViewController.savegamecenter), name: "savegamecenter", object: nil)
        NSNotificationCenter.defaultCenter().addObserver(self, selector: #selector(GameViewController.showid), name: "showid", object: nil)
        NSNotificationCenter.defaultCenter().addObserver(self, selector: #selector(GameViewController.showid2), name: "showid2", object: nil)
        NSNotificationCenter.defaultCenter().addObserver(self, selector: #selector(GameViewController.internetCheck), name: "internetCheck", object: nil)
        
        super.viewDidLoad()
        
        authenticateLocalPlayer()
        
        bannerView.adUnitID = "ca-app-pub-5103786236100616/5337465482"
        bannerView.rootViewController = self
        bannerView.loadRequest(GADRequest())
        
        self.interstitial = GADInterstitial(adUnitID: "ca-app-pub-5103786236100616/9628064287")
        self.interstitial.loadRequest(request)

        
        let skView = view as! SKView
        skView.showsFPS = false
        let nextScene = HomeScene(fileNamed:"GameScene")
        nextScene!.scaleMode = .AspectFill
        
        skView.presentScene(nextScene)
        
    }
    
    func internetCheck() {
        if Reachability.isConnectedToNetwork() == true {
            print("Internet connection OK")
            
            NSUserDefaults.standardUserDefaults().boolForKey("internet")
            NSUserDefaults.standardUserDefaults().setBool(true, forKey: "internet")
            NSUserDefaults.standardUserDefaults().synchronize()
            
        } else {
            print("Internet connection FAILED")
            
            let defaults: NSUserDefaults = NSUserDefaults.standardUserDefaults()
            defaults.removeObjectForKey("internet")
            defaults.synchronize()
            
            let alert = UIAlertController(title: "Error!", message: "You don't have an internet connection!", preferredStyle: UIAlertControllerStyle.Alert)
            alert.addAction(UIAlertAction(title: "Ok", style: UIAlertActionStyle.Default) { _ in })
            self.view?.window?.rootViewController?.presentViewController(alert, animated: true, completion: nil)

        }
    }
    
    func showid(){
      
        print("Ad pronto")
        
        if self.interstitial.isReady {
            self.interstitial.presentFromRootViewController(self)
            MyVariables.keymore = true

        }
        self.interstitial = GADInterstitial(adUnitID: "ca-app-pub-5103786236100616/9628064287")
        self.interstitial.loadRequest(request)
        
    }
    
    func showid2(){
        
        print("Ad pronto")
        
        if self.interstitial.isReady {
            self.interstitial.presentFromRootViewController(self)
            MyVariables.keymore = true
            
        }
        self.interstitial = GADInterstitial(adUnitID: "ca-app-pub-5103786236100616/6814198685")
        self.interstitial.loadRequest(request)
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func shouldAutorotate() -> Bool {
        return false
    }
    
    override func supportedInterfaceOrientations() -> UIInterfaceOrientationMask {
        if UIDevice.currentDevice().userInterfaceIdiom == .Phone {
            return .AllButUpsideDown
        } else {
            return .All
        }
    }
    
    override func prefersStatusBarHidden() -> Bool {
        return true
    }
    
    //hides leaderboard screen
    func gameCenterViewControllerDidFinish(gameCenterViewController: GKGameCenterViewController) {
        gameCenterViewController.dismissViewControllerAnimated(true, completion: nil)
        
    }
    
    //shows leaderboard screen
    func showLeader() {
        let vc = self.view?.window?.rootViewController
        let gc = GKGameCenterViewController()
        gc.gameCenterDelegate = self
        vc?.presentViewController(gc, animated: true, completion: nil)
    }
    
    //send high score to leaderboard
    func saveHighscore(var score:Int) {
        
        //check if user is signed in
        if GKLocalPlayer.localPlayer().authenticated {
            
            let punteggio = MyVariables.yourVariable
            
            let stringNumber = "\(punteggio)"
            score = Int(stringNumber)!
            
            let scoreReporter = GKScore(leaderboardIdentifier: "grp.BallRecords") //leaderboard id here
            
            scoreReporter.value = Int64((score)
            ) //score variable here (same as above)
            
            let scoreArray: [GKScore] = [scoreReporter]
            
            GKScore.reportScores(scoreArray, withCompletionHandler: {(error : NSError?) -> Void in
                if error != nil {
                    print("error")
                }
            })
            
        }
        
    }
    
    //initiate gamecenter
    func authenticateLocalPlayer(){
        
        let localPlayer = GKLocalPlayer.localPlayer()
        
        localPlayer.authenticateHandler = {(viewController, error) -> Void in
            
            if (viewController != nil) {
                self.presentViewController(viewController!, animated: true, completion: nil)
            }
            else if (localPlayer.authenticated) {
                
                // IL PLAYER É STATO AUTENTICATO, QUI ATTIVI IL TUO BOTTONE
                print(true)
                
            } else {
                // GAME CENTER NON ATTIVO
                print("Not authenticated")
            }
            
        }
        
    }
}
