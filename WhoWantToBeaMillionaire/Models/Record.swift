//
//  Record.swift
//  WhoWantToBeaMillionaire
//
//  Created by Кирилл Тарасов on 30.08.2021.
//

import Foundation

struct Record: Codable {
    let Prize: Int
    let date: Date
    let percentCurrentAnswers: Double
}
