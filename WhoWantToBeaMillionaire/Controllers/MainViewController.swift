//
//  MainViewController.swift
//  WhoWantToBeaMillionaire
//
//  Created by Кирилл Тарасов on 30.08.2021.
//

import Foundation
import UIKit

class MainViewController: UIViewController {
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        switch segue.identifier {
        case "StartGameIdentifier":
            guard let destination = segue.destination as? GameViewController else { return }
            let gameSession = SessionOfGame()
            Game.shared.gameSession = gameSession
            destination.delegate = gameSession
        default:
            break
        }
    }
}
