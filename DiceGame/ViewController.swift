//
//  ViewController.swift
//  DiceGame
//
//  Created by Omar Aldair Romero Pérez on 10/2/18.
//  Copyright © 2018 Omar Aldair Romero Pérez. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    
    
    @IBOutlet weak var diceLeftPlayer: UIImageView!
    @IBOutlet weak var diceRightPlayer: UIImageView!
    @IBOutlet weak var diceLeftIA: UIImageView!
    @IBOutlet weak var diceRightIA: UIImageView!
    
    
    let diceImages = ["dice1", "dice2", "dice3", "dice4", "dice5", "dice6"]
    let diceImagesNumber = ["dice1":1, "dice2":2, "dice3":3, "dice4":4, "dice5":5, "dice6":6]
    let nFaces : UInt32
    
    var diceLeftPlayerIndex = 0
    var diceRightPlayerIndex = 0
    var diceLeftIAIndex = 0
    var diceRightIAIndex = 0
    
    
    required init?(coder aDecoder: NSCoder) {
        self.nFaces = UInt32(self.diceImages.count)
        super.init(coder: aDecoder)
    }
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        generateMyRandomDices()
        generateIARandomDices()
    }
    
    
    func generateMyRandomDices(){
        
        self.diceLeftPlayerIndex = Int(arc4random_uniform(nFaces))
        self.diceRightPlayerIndex = Int(arc4random_uniform(nFaces))
        
        
        UIView.animate(withDuration: 0.3, delay: 0, options: UIView.AnimationOptions.curveEaseInOut, animations: {
            
            self.diceLeftPlayer.transform = CGAffineTransform(scaleX: 0.6, y: 0.6).concatenating(CGAffineTransform(rotationAngle: CGFloat.pi/2)).concatenating(CGAffineTransform(translationX: -100, y: 100))
            
            self.diceRightPlayer.transform = CGAffineTransform(scaleX: 0.6, y: 0.6).concatenating(CGAffineTransform(rotationAngle: CGFloat.pi/2)).concatenating(CGAffineTransform(translationX: 100, y: 100))
            
            self.diceLeftPlayer.alpha = 0.0
            self.diceRightPlayer.alpha = 0.0
            
            
        }) { (completed) in
            
            self.diceLeftPlayer.transform = CGAffineTransform.identity
            self.diceRightPlayer.transform = CGAffineTransform.identity
            
            self.diceLeftPlayer.alpha = 1.0
            self.diceRightPlayer.alpha = 1.0
            
            self.diceLeftPlayer.image = UIImage(named: self.diceImages[self.diceLeftPlayerIndex])
            self.diceRightPlayer.image = UIImage(named: self.diceImages[self.diceRightPlayerIndex])
        }
        
    }
    
    func generateIARandomDices(){
        
        self.diceLeftIAIndex = Int(arc4random_uniform(nFaces))
        self.diceRightIAIndex = Int(arc4random_uniform(nFaces))
        
        UIView.animate(withDuration: 0.3, delay: 0, options: UIView.AnimationOptions.curveEaseInOut, animations: {
            
            self.diceLeftIA.transform = CGAffineTransform(scaleX: 0.6, y: 0.6).concatenating(CGAffineTransform(rotationAngle: CGFloat.pi/2)).concatenating(CGAffineTransform(translationX: -100, y: 100))
            
            self.diceRightIA.transform = CGAffineTransform(scaleX: 0.6, y: 0.6).concatenating(CGAffineTransform(rotationAngle: CGFloat.pi/2)).concatenating(CGAffineTransform(translationX: 100, y: 100))
            
            self.diceLeftIA.alpha = 0.0
            self.diceRightIA.alpha = 0.0
            
            
        }) { (completed) in
            
            self.diceLeftIA.transform = CGAffineTransform.identity
            self.diceRightIA.transform = CGAffineTransform.identity
            
            self.diceLeftIA.alpha = 1.0
            self.diceRightIA.alpha = 1.0
            
            self.diceLeftIA.image = UIImage(named: self.diceImages[self.diceLeftIAIndex])
            self.diceRightIA.image = UIImage(named: self.diceImages[self.diceRightIAIndex])
        }
    }

    @IBAction func playButton(_ sender: UIButton) {
        
        generateMyRandomDices()
        generateIARandomDices()
    }
    
}

