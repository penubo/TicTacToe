//
//  GameBrain.swift
//  MyTicTacToe
//
//  Created by Joon on 09/09/2017.
//  Copyright © 2017 Joon. All rights reserved.
//

import Foundation

struct GameBrain {
    
    private enum BoardState {
        case cross
        case naught
        case empty
    }
    private enum Player {
        case crossUser
        case naughtUser
    }    
    private enum Winner {
        case cross
        case naught
        case draw
    }
    
    private var boardState: Dictionary<Int, BoardState> = [ 1:.empty, 2:.empty, 3:.empty,
                                                            4:.empty, 5:.empty, 6:.empty,
                                                            7:.empty, 8:.empty, 9:.empty ]
    private let winCombination: [Array<Int>] = [ [1,2,3], [4,5,6], [7,8,9],
                                                 [1,4,7], [2,5,8], [3,6,9],
                                                 [1,5,9], [3,5,7] ]
    private var player: Player = .crossUser
    private var isGameEnded: Bool = false
    
    mutating func performSettingObject(of object: Int) -> Int? {
        
        var result: Int?
        
        if boardState[object] == .empty && isGameEnded == false {
            switch player {
            case .crossUser:
                boardState[object]? = .cross
                result = 1
            case .naughtUser:
                boardState[object]? = .naught
                result = 2
            }
        } else {
            result = nil
        }
        return result
    }
    
    mutating func checkGameIsEnded () -> Int? {
        
        var result: Int?
        var countSeeIfItIsDraw = 0
        
        if isGameEnded == false {
            // check who is winner
            for combination in winCombination {
                if ((boardState[combination[0]] != .empty) &&
                    (boardState[combination[0]] == boardState[combination[1]]) &&
                    (boardState[combination[1]] == boardState[combination[2]]) ){
                    result = player == .crossUser ? 1 : 2
                    isGameEnded = true
                }
            }
            // check game is ended by draw
            for (_, value) in boardState {
                countSeeIfItIsDraw += 1
                if value == .empty {
                    break
                } else if countSeeIfItIsDraw == 9 && isGameEnded == false {
                    result = 0
                }
            }
        } else {
            result = nil
        }
        return result
        
    }
    
    mutating func togglePlayer() {
        player = player == .crossUser ? .naughtUser : .crossUser
    }
    
    mutating func resetGame() {
        boardState = [ 1:.empty, 2:.empty, 3:.empty,
                       4:.empty, 5:.empty, 6:.empty,
                       7:.empty, 8:.empty, 9:.empty ]
        player = .crossUser
        isGameEnded = false
    }
    
}

