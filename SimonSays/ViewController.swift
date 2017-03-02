//
//  ViewController.swift
//  SimonSays
//
//  Created by Shane Noonan on 24/02/2017.
//  Copyright © 2017 Shane Noonan. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet var simonLabel: UILabel!
    @IBOutlet var timerLabel: UILabel!
    @IBOutlet var scoreLabel: UILabel!
    @IBOutlet var startButton: UIButton!
    
    var timeInt = 0
    var scoreInt = 0
    var modeInt = 0
    
    var timer = Timer()
    var simonTimer = Timer()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        timeInt = 20
        scoreInt = 0
        modeInt = 0
        
        timerLabel.text = String("Time: \(timeInt)")
        scoreLabel.text = String("Score: \(timeInt)")
        
        let swipeRight = UISwipeGestureRecognizer(target: self, action: #selector(ViewController.swipeGestures))
        swipeRight.direction = UISwipeGestureRecognizerDirection.right
        self.view.addGestureRecognizer(swipeRight)
        
        let swipeLeft = UISwipeGestureRecognizer(target: self, action: #selector(ViewController.swipeGestures))
        swipeLeft.direction = UISwipeGestureRecognizerDirection.left
        self.view.addGestureRecognizer(swipeLeft)
        
        let swipeDown = UISwipeGestureRecognizer(target: self, action: #selector(ViewController.swipeGestures))
        swipeDown.direction = UISwipeGestureRecognizerDirection.down
        self.view.addGestureRecognizer(swipeDown)
        
        let swipeUp = UISwipeGestureRecognizer(target: self, action: #selector(ViewController.swipeGestures))
        swipeUp.direction = UISwipeGestureRecognizerDirection.up
        self.view.addGestureRecognizer(swipeUp)
        
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func startGame(_ sender: Any) {
        
        if timeInt == 20 {
            
            timer = Timer.scheduledTimer(timeInterval: 1.0, target: self, selector: #selector(ViewController.updateTimer), userInfo: nil, repeats: true)
            
            modeInt = 1
            
            startButton.isEnabled = false
            startButton.alpha = 0.5
            
            simonLabel.text = "Simon Says..."
            
            //calls simonSays function once
            self.simonSays()
        
        }
        
        if timeInt == 0 {
            
            timeInt = 20
            scoreInt = 0
            
            timerLabel.text = String("Time: \(timeInt)")
            scoreLabel.text = String("Score: \(timeInt)")
            
            
            startButton.setTitle("Start Game", for: [])
            simonLabel.text = "Simon Says..."
        }
        
    }
    
    func updateTimer() {
        
        timeInt -= 1
        timerLabel.text = String("Time: \(timeInt)")
        
        if timeInt == 0 {
            
            timer.invalidate()
            simonTimer.invalidate()
            simonLabel.text = "Game Over"
            
            modeInt = 0
            
            startButton.isEnabled = true
            startButton.alpha = 1
            startButton.setTitle("Restart", for: [])
        }
        
    }
    
    func simonSays() {
        
        let simonArray = ["Simon says swipe right", "Simon says swipe left", "Simon says swipe up", "Simon says swipe down", "Swipe down", "Swipe up", "Swipe left", "Swipe right"]
        
        let randomWord = Int(arc4random_uniform(UInt32(simonArray.count)))
        simonLabel.text = simonArray[randomWord]
        
        simonTimer = Timer.scheduledTimer(timeInterval: 1.0, target: self, selector: #selector(ViewController.simonSays), userInfo: nil, repeats: false)
    }
    
    func swipeGestures(sender: UISwipeGestureRecognizer) {
        
        if modeInt == 1 {
            
            if sender.direction == .right {
                
                simonTimer.invalidate()
                
                if simonLabel.text == "Simon says swipe right" {
                    
                    scoreInt += 1
                    scoreLabel.text = String("Score: \(scoreInt)")
                    
                    self.simonSays()
                }
                else {
                    
                    scoreInt -= 1
                    scoreLabel.text = String("Score: \(scoreInt)")
                    
                    self.simonSays()
                }
            }
            
            if sender.direction == .left {
                
                simonTimer.invalidate()
                
                if simonLabel.text == "Simon says swipe left" {
                    
                    scoreInt += 1
                    scoreLabel.text = String("Score: \(scoreInt)")
                    
                    self.simonSays()
                }
                else {
                    
                    scoreInt -= 1
                    scoreLabel.text = String("Score: \(scoreInt)")
                    
                    self.simonSays()
                }
            }
            
            if sender.direction == .up {
                
                simonTimer.invalidate()
                
                if simonLabel.text == "Simon says swipe up" {
                    
                    scoreInt += 1
                    scoreLabel.text = String("Score: \(scoreInt)")
                    
                    self.simonSays()
                }
                else {
                    
                    scoreInt -= 1
                    scoreLabel.text = String("Score: \(scoreInt)")
                    
                    self.simonSays()
                }
            }
            
            if sender.direction == .down {
                
                simonTimer.invalidate()
                
                if simonLabel.text == "Simon says swipe down" {
                    
                    scoreInt += 1
                    scoreLabel.text = String("Score: \(scoreInt)")
                    
                    self.simonSays()
                }
                else {
                    
                    scoreInt -= 1
                    scoreLabel.text = String("Score: \(scoreInt)")
                    
                    self.simonSays()
                }
            }
        }
    }

}

