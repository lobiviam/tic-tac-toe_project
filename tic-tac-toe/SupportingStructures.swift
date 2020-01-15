//
//  SupportingStructures.swift
//  tic-tac-toe
//
//  Created by Olga Zubrilina on 14.01.2020.
//  Copyright © 2020 Olga Zubrilina. All rights reserved.
//

import Foundation

enum Signs : String{
    case tic = "X"
    case tac = "O"
    
}

struct Player {
    var sign = Signs.tic
    var playerId = 1
    var isHisTurn = false
    var didHeWin = false
    var positions:[IndexPath] = []
}
