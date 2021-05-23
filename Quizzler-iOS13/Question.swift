//
// Created by Thomas Strauß on 23.05.21.
// Copyright (c) 2021 The App Brewery. All rights reserved.
//

import Foundation

struct Question {
    let questionText: String
    let correctAnswer: String
    var userAnswer: Bool = false
    var aNumber: Int = 0

    mutating func checkAnswer(anAnswer: String) -> Bool {
        userAnswer = anAnswer == correctAnswer
        return userAnswer
    }
}
