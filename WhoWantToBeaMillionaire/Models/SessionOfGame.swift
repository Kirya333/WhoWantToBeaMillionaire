//
//  SessionOfGame.swift
//  WhoWantToBeaMillionaire
//
//  Created by Кирилл Тарасов on 30.08.2021.
//

import Foundation

class SessionOfGame {
    
    var countQuestions: Int = Game.shared.questions.count
    var countCorrectAnswer: Int = 0
    var Prize: Int = 0
    
}

extension SessionOfGame: GameViewControllerDelegate {
    
    func gameViewController(_ viewController: GameViewController, chooseCorrectAnswer question: Question) {
        self.countCorrectAnswer += 1
        self.Prize += question.prize
    }
    
}
