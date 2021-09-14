//
//  SequentialOrderOfQuestionsStratagy.swift
//  WhoWantToBeaMillionaire
//
//  Created by Кирилл Тарасов on 05.09.2021.
//

import Foundation


final class SequentialOrderOfQuestionsStratagy: OrderOfQuestionsStratagy {
    func getQuestions() -> [Question] {
        return Game.shared.questions.shuffled()
    }
}
