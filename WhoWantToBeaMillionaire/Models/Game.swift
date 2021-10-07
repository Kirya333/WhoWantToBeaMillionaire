//
//  Game.swift
//  WhoWantToBeaMillionaire
//
//  Created by Кирилл Тарасов on 30.08.2021.
//

import Foundation

final class Game {
    static let shared = Game()
    
    var gameSession: SessionOfGame?
    
    private(set) var records: [Record] {
        didSet {
            recordsCareTaker.save(records: self.records)
        }
    }
    
    var difficulty: Difficulty = .random
    
    var questions: [Question] {
        didSet {
            questionsCaretaker.save(questions: self.questions)
        }
    }
    
    private let recordsCareTaker = RecordsCaretaker()
    private let questionsCaretaker = QuestionsCaretaker()
    
    private init() {
        
        self.records = self.recordsCareTaker.retrieveRecords()
        self.questions = self.questionsCaretaker.retrieveQuestions()
        
    }
    
    func endGame() {
        
        guard let gameSession = self.gameSession else { return }
        
//        let percentOfCorrectAnswers = Double(gameSession.countCorrectAnswer) /
//            Double(gameSession.countQuestions)
        
        let record = Record(Prize: gameSession.Prize, date: Date(), percentCurrentAnswers: gameSession.percentOfCorrectAnswers)
        self.addRecord(record)
        self.gameSession = nil
    }
    
    func addRecord(_ record: Record) {
        
        self.records.append(record)
        
    }
    
    func addQuestions(_ questions: [Question]) {
        self.questions += questions
    }
}

