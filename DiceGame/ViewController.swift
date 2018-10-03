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
    let diceImagesNumber = [1,2,3,4,5,6]
    let nFaces : UInt32
    
    
    var diceLeftPlayerIndex = 0
    var diceRightPlayerIndex = 0
    var diceLeftIAIndex = 0
    var diceRightIAIndex = 0
    
    
    var diceLeftPlayerNumber = 0
    var diceRightPlayerNumber = 0
    var diceLeftIANumber = 0
    var diceRightIANumber = 0
    var resultSumPlayer = 0
    var resultSumIA = 0
    
    
    required init?(coder aDecoder: NSCoder) {
        self.nFaces = UInt32(self.diceImages.count)
        super.init(coder: aDecoder)
    }
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        generateRandomDices()
    }
    
    
    func generateRandomDices(){
        
        self.diceLeftPlayerIndex = Int(arc4random_uniform(nFaces))
        self.diceRightPlayerIndex = Int(arc4random_uniform(nFaces))
        self.diceLeftIAIndex = Int(arc4random_uniform(nFaces))
        self.diceRightIAIndex = Int(arc4random_uniform(nFaces))
        
        
        UIView.animate(withDuration: 0.3, delay: 0, options: UIView.AnimationOptions.curveEaseInOut, animations: {
            
            // Dado del jugador
            self.diceLeftPlayer.transform = CGAffineTransform(scaleX: 0.6, y: 0.6).concatenating(CGAffineTransform(rotationAngle: CGFloat.pi/2)).concatenating(CGAffineTransform(translationX: -100, y: 100))
            
            self.diceRightPlayer.transform = CGAffineTransform(scaleX: 0.6, y: 0.6).concatenating(CGAffineTransform(rotationAngle: CGFloat.pi/2)).concatenating(CGAffineTransform(translationX: 100, y: 100))
            
            self.diceLeftPlayer.alpha = 0.0
            self.diceRightPlayer.alpha = 0.0
            
            
            // Dado de la IA
            self.diceLeftIA.transform = CGAffineTransform(scaleX: 0.6, y: 0.6).concatenating(CGAffineTransform(rotationAngle: CGFloat.pi/2)).concatenating(CGAffineTransform(translationX: -100, y: 100))
            
            self.diceRightIA.transform = CGAffineTransform(scaleX: 0.6, y: 0.6).concatenating(CGAffineTransform(rotationAngle: CGFloat.pi/2)).concatenating(CGAffineTransform(translationX: 100, y: 100))
            
            self.diceLeftIA.alpha = 0.0
            self.diceRightIA.alpha = 0.0
            
            
        }) { (completed) in
            
            // Dado del jugador
            self.diceLeftPlayer.transform = CGAffineTransform.identity
            self.diceRightPlayer.transform = CGAffineTransform.identity
            
            self.diceLeftPlayer.alpha = 1.0
            self.diceRightPlayer.alpha = 1.0
            
            self.diceLeftPlayer.image = UIImage(named: self.diceImages[self.diceLeftPlayerIndex])
            self.diceRightPlayer.image = UIImage(named: self.diceImages[self.diceRightPlayerIndex])
            
            
            self.diceLeftPlayerNumber = self.diceImagesNumber[self.diceLeftPlayerIndex]
            self.diceRightPlayerNumber = self.diceImagesNumber[self.diceRightPlayerIndex]
            self.resultSumPlayer = self.diceLeftPlayerNumber + self.diceRightPlayerNumber
            
            
            // Dado de la IA
            self.diceLeftIA.transform = CGAffineTransform.identity
            self.diceRightIA.transform = CGAffineTransform.identity
            
            self.diceLeftIA.alpha = 1.0
            self.diceRightIA.alpha = 1.0
            
            self.diceLeftIA.image = UIImage(named: self.diceImages[self.diceLeftIAIndex])
            self.diceRightIA.image = UIImage(named: self.diceImages[self.diceRightIAIndex])
            
            
            self.diceLeftIANumber = self.diceImagesNumber[self.diceLeftIAIndex]
            self.diceRightIANumber = self.diceImagesNumber[self.diceRightIAIndex]
            self.resultSumIA = self.diceLeftIANumber + self.diceRightIANumber
            
            
            // Resultado
            self.checkWiner()
        

        }
        
    }
    

    func checkWiner(){
        
        if self.resultSumPlayer > self.resultSumIA{
            print("Has ganado. Tu resultado fué: \(self.resultSumPlayer) y el del rival fué: \(self.resultSumIA)")
        }
        
        if self.resultSumPlayer == self.resultSumIA{
            print("Has empatado. Tu resultado fué \(self.resultSumPlayer) y el del rival fué \(self.resultSumIA)")
        }
        
        if self.resultSumPlayer < self.resultSumIA{
            print("Has perdido. Tu resultado fué \(self.resultSumPlayer) y el del rival fué \(self.resultSumIA)")
        }
    }

    
    @IBAction func playButton(_ sender: UIButton) {
        generateRandomDices()
    }
    
}

