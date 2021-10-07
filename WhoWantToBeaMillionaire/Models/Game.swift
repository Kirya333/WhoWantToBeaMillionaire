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
    
    let questions = [
        
        Question(question: "Кто был первым военным министром Российской империи?",
                 answers: [
                 "Аракчеев",
                "Барклай-де-Толли",
                "Вязмитинов",
                "Коновницын"
                 ],
                 correctAnswer: 3,
                 prize: 1000
        ),
        Question(question: "Реки с каким названием нет на территории России?",
                 answers: [
                    "Спина",
                    "Уста",
                    "Палец",
                    "Шея"

                 ],
                 correctAnswer: 1,
                 prize: 5000
        ),
        Question(question: "Что Шекспир назвал «вкуснейшим из блюд в земном пиру»?",
                 answers: [
                    "Опьянение",
                    "Любовь",
                    "Уединение",
                    "Сон"
                 ],
                 correctAnswer: 4,
                 prize: 10000
        ),
        Question(question: "Кто из этих философов в 1864 году написал музыку на стихи А. С. Пушкина «Заклинание» и «Зимний вечер»?",
                 answers: [
                    "Юнг",
                    "Ницше",
                    "Шопенгауэр",
                    "Гегель"
                 ],
                 correctAnswer: 2,
                 prize: 100000
        ),
        Question(question: "С какой фигуры начинаются соревнования по городошному спорту?",
                 answers: [
                    "Часовые",
                    "Артиллерия",
                    "Пушка",
                    "Пулемётное гнездо"
                 ], correctAnswer: 3,
                 prize: 200000
        ),
        Question(question: "Сколько раз в сутки подзаводят куранты Спасской башни Кремля?",
                 answers: [
                    "Один",
                    "Два",
                    "Три",
                    "Четыре",
                 ], correctAnswer: 2,
                 prize: 500000
        ),
        Question(question: "Как назвали первую кимберлитовую трубку, открытую Ларисой Попугаевой 21 августа 1954 года?",
                 answers: [
                    "«Советская»",
                    "«Зарница»",
                    "«Удачная»",
                    "«Мир»"
                 ],
                 correctAnswer: 2,
                 prize: 1000000
        )
    ]
    
    private let recordsCareTaker = RecordsCaretaker()
    
    private init() {
        
        self.records = self.recordsCareTaker.retrieveRecords()
        
    }
    
    func endGame() {
        
        guard let gameSession = self.gameSession else { return }
        
        let percentOfCorrectAnswers = Double(gameSession.countCorrectAnswer) /
            Double(gameSession.countQuestions)
        
        let record = Record(Prize: gameSession.Prize, date: Date(), percentCurrentAnswers: percentOfCorrectAnswers)
        self.addRecord(record)
        self.gameSession = nil
    }
    
    func addRecord(_ record: Record) {
        
        self.records.append(record)
        
    }
}

