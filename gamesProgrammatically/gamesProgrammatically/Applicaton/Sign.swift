//
//  Sign.swift
//  gamesProgrammatically
//
//  Created by Артём on 17.04.2022.
//

import Foundation

func randomSign() -> Sign
{
    
    let randomNumber = UInt8.random(in: 0...2)
    
    if  randomNumber == 0
    {
        return .stone
    }
    else if  randomNumber == 1
    {
        return .scissors
    }
    else
    {
        return .paper
    }
}

enum Sign
{
    
    case stone, scissors, paper
    
    
    
    var emoji: String
    {
        switch self {
        case .paper:
            return "✋🏻"
        case .stone:
            return "👊🏻"
        case .scissors:
            return "✌🏻"
        }
    }

    func getResult(for opposite: Sign) -> GameState
    {
        
        switch (self, opposite)
        {
        case (.stone, .stone), (.paper, .paper), (.scissors, .scissors):
            return .draw
            
        case (.stone, .scissors), (.paper, .stone), (.scissors, .paper):
            return .win
        default:
        return .lose
        }
        
    }
    
}
