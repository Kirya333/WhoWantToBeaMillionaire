//
//  QuestionsBuilder.swift
//  WhoWantToBeaMillionaire
//
//  Created by Кирилл Тарасов on 05.09.2021.
//

import Foundation


final class QuestionsBuilder {
    
    var currentQuestion: Question = Question()
    var questions: [Question] = []
    
    func build() -> [Question] {
        return self.questions
    }
    
    func setNewQuestion() -> Self {
        self.questions.append(self.currentQuestion)
        
        return self
    }
    
    func setCurrentQuestion(at index: Int) -> Self {
        self.currentQuestion = self.questions[index]
        return self
    }
    
    func setTextQuestion(_ textQuestion: String) -> Self {
        self.currentQuestion.question = textQuestion
        return self
    }
    
    func setAnswer(_ answer: String) -> Self {
        self.currentQuestion.answers.append(answer)
        return self
    }
    
    func setCorrectAnswer(_ correctAnswer: Int) -> Self {
        self.currentQuestion.correctAnswer = correctAnswer
        return self
    }
    
    func setCashPrize(_ cashPrize: Int) -> Self {
        self.currentQuestion.prize = cashPrize
        return self
    }
}
