//
//  ViewController.swift
//  RockPaperScissors
//
//  Created by Usuario invitado on 28/9/18.
//  Copyright © 2018 Usuario invitado. All rights reserved.
//

import UIKit
import Foundation

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        updateUI(status: .start)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func updateUI(status: GameState){
        switch status {
        case .start:
            gameStatus.text = "Rock, Paper, Scissors?"
            appSign.text = "🤖"
            playAgain.isHidden = true
            rockButton.isEnabled = true
            paperButton.isEnabled = true
            scissorsButton.isEnabled = true
            
        case .win:
            gameStatus.text = "You win!"
            self.view.backgroundColor = UIColor.yellow
        case .lose:
            gameStatus.text = "You lose!"
            self.view.backgroundColor = UIColor.purple
        case .draw:
            gameStatus.text = "It's a draw!"
            self.view.backgroundColor = UIColor.green
        }
    }
    var playerSign :Sign!
    func play(){
        appSign.text = "👾"
        let computerSign = randomSign()
        let gameState = selectState(mySign: playerSign, appSign: computerSign)
       updateUI(status: gameState)
        appSign.text = playerSign.signs
        rockButton.isEnabled = false
        paperButton.isEnabled = false
        scissorsButton.isEnabled = false
        
        playAgain.isHidden = false
        
    }

    @IBOutlet weak var appSign: UILabel!
    @IBOutlet weak var gameStatus: UILabel!
    @IBOutlet weak var rockButton: UIButton!
    @IBOutlet weak var paperButton: UIButton!
    @IBOutlet weak var scissorsButton: UIButton!
    @IBOutlet weak var playAgain: UIButton!
    
    @IBAction func rockButton(_ sender: Any) {
         playerSign = .rock
    }
    @IBAction func paperButton(_ sender: Any) {
        playerSign = .paper
    }
    
    @IBAction func scissorsButton(_ sender: Any) {
        playerSign = .scissors
    }
    @IBAction func playAgainButton(_ sender: Any) {
        updateUI(status: .start)
        
    }
}

