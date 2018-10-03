//
//  Sign.swift
//  RockPaperScissors
//
//  Created by Usuario invitado on 28/9/18.
//  Copyright © 2018 Usuario invitado. All rights reserved.
//

import Foundation
import GameplayKit

let randomChoice = GKRandomDistribution(lowestValue: 0, highestValue: 2)
func randomSign() -> Sign {
    let sign = randomChoice.nextInt()
    if sign == 0 {
        return .rock
    }else if sign == 1 {
        return .paper
    }else{
        return .scissors
    }
}

func selectState (mySign: Sign, appSign: Sign) -> GameState{
    
    let status = mySign.stateOfGame(computerChoice: appSign)
    return status
}

enum Sign {
    case rock, paper, scissors
    
    var signs: String{
        switch self {
        case .rock:
            return "👊🏽"
        case .paper:
            return "✋🏽"
        case .scissors:
            return "✌🏽"
        }
    }
    
    func stateOfGame(computerChoice: Sign) -> GameState {
        
        switch self {
        case .rock:
            if computerChoice == .paper{
                return .lose
            }else if computerChoice == .rock{
                return .draw
            }else if computerChoice == .scissors{
                return .win
            }
        case .scissors:
            if computerChoice == .paper{
                return .win
            }else if computerChoice == .rock{
                return .lose
            }else if computerChoice == .scissors{
                return .draw
            }
        
        case .paper:
            if computerChoice == .paper{
                return .draw
            }else if computerChoice == .rock{
                return .win
            }else if computerChoice == .scissors{
                return .lose
            }
        }
        return .draw
    }
}
