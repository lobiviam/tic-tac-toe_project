//
//  GameStateMachine.swift
//  tic-tac-toe
//
//  Created by Olga on 13.01.2020.
//  Copyright © 2020 Olga Zubrilina. All rights reserved.
//

import Foundation

enum GameStates {
    case firstTurn
    case secondTurn
    case firstWin
    case secondWin
    case tie
}

class GameStateMachine : NSObject {
    static var shared = GameStateMachine()
    
    private override init() {
        super.init()
        gameState = .firstTurn
    }
    
    var gameState : GameStates = .firstTurn
}


