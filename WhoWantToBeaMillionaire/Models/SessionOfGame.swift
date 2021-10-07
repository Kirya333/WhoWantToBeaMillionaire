//
//  SessionOfGame.swift
//  WhoWantToBeaMillionaire
//
//  Created by Кирилл Тарасов on 30.08.2021.
//

import Foundation

class SessionOfGame {
    
    var countQuestions: Int = Game.shared.questions.count
    var countCorrectAnswer: Observable<Int> = Observable(0)
    var Prize: Int = 0
    var percentOfCorrectAnswers: Double {
        get {
            return Double(self.countCorrectAnswer.value) / Double(self.countQuestions)
        }
    }
    
}

extension SessionOfGame: GameViewControllerDelegate {
    
    func gameViewController(_ viewController: GameViewController, chooseCorrectAnswer question: Question) {
        self.countCorrectAnswer.value += 1
        self.Prize += question.prize
    }
    
}
