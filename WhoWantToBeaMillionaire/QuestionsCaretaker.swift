//
//  QuestionsCaretaker.swift
//  WhoWantToBeaMillionaire
//
//  Created by Кирилл Тарасов on 05.09.2021.
//

import Foundation


final class QuestionsCaretaker {
    
    private let encoder = JSONEncoder()
    private let decoder = JSONDecoder()
    
    private let key = "questions"
    
    func save(questions: [Question]) {
        do {
            let data = try self.encoder.encode(questions)
            UserDefaults.standard.set(data, forKey: key)
        } catch {
            print(error)
        }
    }
    
    func retrieveQuestions() -> [Question] {
        guard let data = UserDefaults.standard.data(forKey: key) else { return [] }
        
        do {
            return try self.decoder.decode([Question].self, from: data)
        } catch {
            print(error)
            return []
        }
    }
}
