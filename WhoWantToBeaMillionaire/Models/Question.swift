//
//  Question.swift
//  WhoWantToBeaMillionaire
//
//  Created by Кирилл Тарасов on 30.08.2021.
//

import Foundation

struct Question: Codable {
    
    var question: String = ""
    var answers: [String] = []
    var correctAnswer: Int = 0
    var prize: Int = 100
    
}
