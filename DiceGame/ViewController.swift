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
    @IBOutlet weak var resultLabel: UILabel!
    @IBOutlet weak var countPlayerLabel: UILabel!
    @IBOutlet weak var countIALabel: UILabel!
    @IBOutlet weak var countRoundsLabel: UILabel!
    
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
    
    var countPlayer = 0
    var countIA = 0
    var numberOfRounds = 0
    
    
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
            self.countPlayer += 1
            self.resultLabel.text = "Has ganado. Tu resultado: \(self.resultSumPlayer), tu rival: \(self.resultSumIA)"
            self.countPlayerLabel.text = "Tú: \(self.countPlayer)"
            
        }else if self.resultSumPlayer == self.resultSumIA{
            self.resultLabel.text = "Has empatado. Tu resultado: \(self.resultSumPlayer), tu rival: \(self.resultSumIA)"
        }else {
            self.countIA += 1
            self.resultLabel.text = "Has perdido. Tu resultado: \(self.resultSumPlayer), tu rival: \(self.resultSumIA)"
            self.countIALabel.text = "Rival: \(self.countIA)"
        }
        
        self.numberOfRounds += 1
        self.countRoundsLabel.text = "Cuenta: \(self.numberOfRounds)"
        
        if self.numberOfRounds >= 10{
            restartGame()
        }
        
    }
    
    
    func restartGame(){
        
        let alert = UIAlertController(title: "Fin", message: "Has llegado a 10 rondas", preferredStyle: .alert)
        let action = UIAlertAction(title: "OK", style: .default) { (action) in
            self.countPlayer = 0
            self.countIA = 0
            self.numberOfRounds = 0
            self.updateLabels()
            self.generateRandomDices()
        }
        
        alert.addAction(action)
        present(alert, animated: true, completion: nil)
        
        
        
        
    }
    
    func updateLabels(){
        self.countPlayerLabel.text = "Tú: \(self.countPlayer)"
        self.countIALabel.text = "Rival: \(self.countIA)"
        self.countRoundsLabel.text = "Cuenta: \(self.numberOfRounds)"
    }
    
    
    override func becomeFirstResponder() -> Bool {
        return true
    }
    
    override func motionEnded(_ motion: UIEvent.EventSubtype, with event: UIEvent?) {
        if motion == .motionShake{
            generateRandomDices()
        }
    }

    
    @IBAction func playButton(_ sender: UIButton) {
        generateRandomDices()
    }
    
}

