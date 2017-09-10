//
//  ViewController.swift
//  MyTicTacToe
//
//  Created by Joon on 07/09/2017.
//  Copyright © 2017 Joon. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    private var brain = GameBrain()
    
    @IBOutlet weak var winnerLabel: UILabel!
    @IBOutlet weak var gameResetButton: UIButton!
    
    @IBAction func boardButtons(_ sender: UIButton) {
        
        if let player = brain.performSettingObject(of: sender.tag) {
            let image: UIImage?
            switch player {
            case 1:
                image = #imageLiteral(resourceName: "tictactoeCross")
            case 2:
                image = #imageLiteral(resourceName: "tictactoeNaught")
            default:
                image = nil
            }
            sender.setImage(image, for: .normal)
        }
        
        if let winner = brain.checkGameIsEnded() {
            winnerLabel.isHidden = false
            gameResetButton.isHidden = false
            
            switch winner {
            case 1:
                winnerLabel.text = "Winner is X"
            case 2:
                winnerLabel.text = "Winner is O"
            case 0:
                winnerLabel.text = "It's draw"
            default:
                break
            }
        }
        
        brain.togglePlayer()
        
    }
    
    @IBAction func gameResetButton(_ sender: UIButton) {
        winnerLabel.isHidden = true
        gameResetButton.isHidden = true
        brain.resetGame()
        for i in 1...9 {
            if let button: UIButton = view.viewWithTag(i) as? UIButton {
                button.setImage(nil, for: .normal)
            }
        }
    }
}

