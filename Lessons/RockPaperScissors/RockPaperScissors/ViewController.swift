//
//  ViewController.swift
//  RockPaperScissors
//
//  Created by Usuario invitado on 28/9/18.
//  Copyright © 2018 Usuario invitado. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func updateUI(status: GameState){
        switch status {
        case .start:
            gameStatus.text = "Rock, Paper, Scissors?"
        }
    }

    @IBOutlet weak var appSign: UILabel!
    @IBOutlet weak var gameStatus: UILabel!
    @IBOutlet weak var rockButton: UIButton!
    @IBOutlet weak var paperButton: UIButton!
    @IBOutlet weak var scissorsButton: UIButton!
    
    @IBOutlet weak var playAgain: UIButton!
    @IBAction func rockButton(_ sender: Any) {
    }
    @IBAction func paperButton(_ sender: Any) {
    }
    
    @IBAction func scissorsButton(_ sender: Any) {
    }
    @IBAction func playAgainButton(_ sender: Any) {
    }
}

